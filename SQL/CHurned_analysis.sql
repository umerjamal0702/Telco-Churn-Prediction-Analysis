CREATE database churn_analysis;
USE churn_analysis;
Rename table telco_updated to customer_churn;
describe customer_churn;
select count(*) from customer_churn;
SELECT
    contract,
    COUNT(*) AS total_customers,
    SUM(churn_value) AS churned_customers,
    ROUND((SUM(churn_value) / COUNT(*)) * 100, 2) AS churn_rate
FROM customer_churn
GROUP BY contract
ORDER BY churn_rate DESC;
SELECT
    payment_method,
    COUNT(*) AS total_customers,
    SUM(churn_value) AS churned_customers,
    ROUND((SUM(churn_value) / COUNT(*)) * 100, 2) AS churn_rate
FROM customer_churn
GROUP BY payment_method
ORDER BY churn_rate DESC;
SELECT
    CASE
        WHEN tenure_in_months < 12 THEN 'New'
        WHEN tenure_in_months < 48 THEN 'Mid-Term'
        ELSE 'Long-Term'
    END AS tenure_group,
    COUNT(*) AS total_customers,
    SUM(churn_value) AS churned_customers,
    ROUND((SUM(churn_value) / COUNT(*)) * 100, 2) AS churn_rate
FROM customer_churn
GROUP BY tenure_group
ORDER BY churn_rate DESC;
SELECT
    MIN(monthly_charge) AS min_charge,
    MAX(monthly_charge) AS max_charge,
    AVG(monthly_charge) AS avg_charge
FROM customer_churn;
SELECT
    CASE
        WHEN monthly_charge < 50 THEN 'Low'
        WHEN monthly_charge <= 80 THEN 'Medium'
        ELSE 'High'
    END AS charge_group,
    COUNT(*) AS total_customers,
    SUM(churn_value) AS churned_customers,
    ROUND((SUM(churn_value) / COUNT(*)) * 100, 2) AS churn_rate
FROM customer_churn
GROUP BY charge_group
ORDER BY churn_rate DESC;
SELECT
    senior_citizen,
    COUNT(*) AS total_customers,
    SUM(churn_value) AS churned_customers,
    ROUND((SUM(churn_value) / COUNT(*)) * 100, 2) AS churn_rate
FROM customer_churn
GROUP BY senior_citizen
ORDER BY churn_rate DESC;
SELECT
    contract,
    payment_method,
    COUNT(*) AS total_customers,
    SUM(churn_value) AS churned_customers,
    ROUND((SUM(churn_value) / COUNT(*)) * 100, 2) AS churn_rate
FROM customer_churn
GROUP BY contract, payment_method
ORDER BY churn_rate DESC;
 use churn_analysis;
SELECT
    MIN(tenure_in_months),
    AVG(tenure_in_months),
    MAX(tenure_in_months)
FROM customer_churn;