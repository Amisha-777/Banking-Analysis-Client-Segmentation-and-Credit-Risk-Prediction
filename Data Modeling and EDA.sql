-- Creating the Database
CREATE DATABASE Dominion_Capital


-- To use the newly created database
USE Dominion_Capital;  
GO

-- DATA EXPLORATION

-- 1. Total number of records
SELECT COUNT(*) AS TotalClients FROM banking_clients;

-- 2. Count NULLs in important columns
SELECT 
  SUM(CASE WHEN Estimated_Income IS NULL THEN 1 ELSE 0 END) AS Null_Income,
  SUM(CASE WHEN Bank_Deposits IS NULL THEN 1 ELSE 0 END) AS Null_Deposits,
  SUM(CASE WHEN Bank_Loans IS NULL THEN 1 ELSE 0 END) AS Null_Loans,
  SUM(CASE WHEN Occupation_Category IS NULL THEN 1 ELSE 0 END) AS Null_Occupation
FROM banking_clients;

-- 3. Client Count By Categorical Segments
-- A. By Gender ID
SELECT GenderId, COUNT(*) AS ClientCount
FROM dbo.banking_clients
GROUP BY GenderId;

-- B. By Province
SELECT Province, COUNT(*) AS ClientCount
FROM dbo.banking_clients
GROUP BY Province;

-- C. By Occupation Category
SELECT Occupation_Category, COUNT(*) AS ClientCount
FROM dbo.banking_clients
GROUP BY Occupation_Category;

-- 4. Numerical Summary
-- Basic stats for Income
SELECT 
  MIN(Estimated_Income) AS MinIncome,
  MAX(Estimated_Income) AS MaxIncome,
  AVG(Estimated_Income) AS AvgIncome,
  STDEV(Estimated_Income) AS StdDevIncome
FROM dbo.banking_clients;

-- 5. Average financials by Occupation
SELECT 
  Occupation_Category,
  COUNT(*) AS ClientCount,
  AVG(Estimated_Income) AS AvgIncome,
  AVG(Bank_Deposits) AS AvgDeposit,
  AVG(Bank_Loans + Business_Lending) AS AvgLending
FROM dbo.banking_clients
GROUP BY Occupation_Category;

-- 6. Date-Based Tenure
-- Tenure in years (approximate)
SELECT 
  Client_ID,
  DATEDIFF(DAY, [Joined_Bank], GETDATE()) / 365.0 AS TenureYears
FROM dbo.banking_clients;

-- Overall average tenure in years
SELECT 
  AVG(DATEDIFF(DAY, [Joined_Bank], GETDATE()) / 365.0) AS Avg_Tenure_Years
FROM dbo.banking_clients;

-- Joined Bank Trends Over Time: See how many clients joined each year
SELECT 
  YEAR(Joined_Bank) AS JoinYear,
  COUNT(*) AS ClientsJoined
FROM dbo.banking_clients
GROUP BY YEAR(Joined_Bank)
ORDER BY JoinYear;

-- 7. Province-wise metrics
SELECT 
  Province,
  COUNT(*) AS Clients,
  AVG(Estimated_Income) AS AvgIncome,
  AVG(Bank_Loans + Business_Lending) AS AvgLending
FROM dbo.banking_clients
GROUP BY Province;

-- Top Provinces by Total Income
SELECT 
  Province,
  SUM(Estimated_Income) AS TotalIncome
FROM dbo.banking_clients
GROUP BY Province
ORDER BY TotalIncome DESC;

-- 8. Risk Distribution Overview
SELECT 
  Risk_Weighting,
  COUNT(*) AS ClientCount
FROM dbo.banking_clients
GROUP BY Risk_Weighting
ORDER BY Risk_Weighting;

-- DATA JOINING AND MODELING

-- 1. Joining the related table to create detailed view of banking clients with gender, advisor, and relationship details
SELECT 
    bc.[Client_ID],
    bc.[Name],
    bc.[Age],
    g.[Gender] AS Gender,
    bc.[Joined_Bank],
    bc.[Banking_Contact],
    bc.[City],
    bc.[Province],
    bc.[Latitude],
    bc.[Longitude],
    bc.[Nationality],
    bc.[Occupation],
    bc.[Occupation_Category],
    bc.[Fee_Structure],
    bc.[Loyalty_Classification],
    bc.[Estimated_Income],
    bc.[Superannuation_Savings],
    bc.[Amount_of_Credit_Cards],
    bc.[Credit_Card_Balance],
    bc.[Bank_Loans],
    bc.[Bank_Deposits],
    bc.[Checking_Accounts],
    bc.[Saving_Accounts],
    bc.[Foreign_Currency_Account],
    bc.[Business_Lending],
    bc.[Properties_Owned],
    bc.[Risk_Weighting],
    ia.[Investment_Advisor],
    br.[Banking_Relationship]
INTO dbo.expanded_banking_clients
FROM dbo.banking_clients as bc
LEFT JOIN dbo.gender g ON bc.[GenderId] = g.[GenderId]
LEFT JOIN dbo.investment_advisors ia ON bc.[IAId] = ia.[IAId]
LEFT JOIN dbo.banking_relationships br ON bc.[BRId] = br.[BRId];


-- 2. Creating VIEWs from the dataset

CREATE VIEW vw_compiled_client_data AS
SELECT *
FROM dbo.expanded_banking_clients;



