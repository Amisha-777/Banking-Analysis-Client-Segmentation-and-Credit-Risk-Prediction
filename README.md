# 🏦 Dominion Capital: Client Segmentation & Credit Risk Analysis

This project analyzes client data for a fictional bank, **Dominion Capital**, to segment banking clients and identify patterns in credit risk using SQL and machine learning in Python. The dataset was sourced from Kaggle and enriched through structured data modeling and feature engineering.



## 📌 Project Objectives

- Segment clients based on financial and behavioral attributes using **KMeans clustering**
- Classify clients into credit risk categories using **Random Forest**
- Identify key financial drivers behind high-risk client profiles
- Prepare the final dataset for dashboarding in Tableau (future enhancement)



## 🛠️ Tools & Technologies

- **SQL** – Data modeling, view creation, feature extraction
- **Python** – Data wrangling, feature engineering, clustering, classification
- **Libraries** – Pandas, Scikit-learn, Matplotlib, SHAP
- **Jupyter Notebook** – For analysis and model building
- **Tableau** – (Planned) for client risk dashboarding


## 🧱 Project Workflow

1. **📂 Data Preparation**
   - Combined multiple CSVs into a structured SQL database
   - Created a unified view `vw_compiled_client_data` through SQL joins

2. **📊 Feature Engineering & EDA**
   - Created custom metrics like `Liquidity_Ratio`, `Total_Lending`, and `Client_Tenure_Years`
   - Explored financial behavior across occupations, provinces, and segments

3. **🔍 Client Segmentation**
   - Performed **KMeans clustering** to segment clients into behavioral profiles
   - Assigned cluster labels like *Mass Market* and *Loyal but Low Liquidity*

4. **⚙️ Risk Category Classification**
   - Built a **Random Forest model** to classify `Risk_Category`
   - Achieved **93% accuracy**, with feature importance analysis
   - Compared predicted vs actual risk levels for model validation

5. **📁 Final Output**
   - Created a prediction-ready dataset: `Risk_Prediction_Output.csv`
   - Includes all features, cluster labels, and risk category predictions


## 📈 Key Features Used

- Demographics: Age, Gender, Province, Occupation
- Financials: Estimated Income, Credit Card Balance, Bank Loans
- Behavior: Client Tenure, Loyalty Classification, Banking Relationship
- Engineered: Total Lending, Liquidity Ratio, Cluster Label

## 🚀 Future Enhancements

- Build an interactive **Tableau dashboard** to visualize:
  - Risk distributions across provinces and clusters
  - Lending patterns vs income tiers
  - Risk prediction alignment vs actuals
- Benchmark against **XGBoost** or **LightGBM**
- Deploy model as part of a **real-time client scoring tool**


## 📂 Files in Repository

| File Name                      | Description                                |
|-------------------------------|--------------------------------------------|
| `Data Modeling and EDA.sql`   | SQL for database setup and data views      |
| `Data Modeling & Prediction.ipynb` | Python notebook for modeling and EDA      |
| `Risk_Prediction_Output.csv`  | Final dataset with segmentation & prediction |
| `README.md`                   | Project summary and documentation          |



