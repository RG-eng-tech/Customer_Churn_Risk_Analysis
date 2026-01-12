CREATE DATABASE Churn_prediction;
SELECT 
    Risk_Level,
    COUNT(*) as Total_Customers,
    ROUND(SUM(MonthlyCharges), 2) as Monthly_Revenue_At_Risk,
    ROUND(AVG(Churn_Probability), 2) as Avg_Churn_Chance
FROM churn_predictions_final
GROUP BY Risk_Level
ORDER BY Monthly_Revenue_At_Risk DESC;

SELECT 
    Contract,
    Risk_Level,
    COUNT(*) as Customer_Count
FROM churn_predictions_final
WHERE Risk_Level = 'High Risk'
GROUP BY Contract, Risk_Level
ORDER BY Customer_Count DESC;

CREATE VIEW vw_Churn_Dashboard_Data AS
SELECT 
    gender, 
    SeniorCitizen, 
    tenure, 
    Contract, 
    PaperlessBilling, 
    PaymentMethod, 
    MonthlyCharges, 
    TotalCharges, 
    Churn, 
    Churn_Probability, 
    Risk_Level
FROM churn_predictions_final;