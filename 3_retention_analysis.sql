WITH customer_last_purchase AS(
	SELECT 
		customerkey,
		full_name,
		orderdate,
		cohort_yr,
		ROW_NUMBER() OVER (PARTITION BY customerkey ORDER BY orderdate DESC) AS rn,
		first_purchase_yr 
	FROM
		cohort_analysis
),
churned_customers AS (
	SELECT
		customerkey,
		full_name,
		cohort_yr,
		orderdate AS last_purchase_date,
		CASE
			WHEN orderdate < (SELECT MAX(orderdate) FROM sales) - INTERVAL '6 months' THEN 'Churned'
			ELSE 'Active'
		END AS customers_status
		
	FROM
		customer_last_purchase
	WHERE rn = 1
		AND first_purchase_yr < '2024-04-20'::date - INTERVAL '6 months'
)
SELECT 
	customers_status,
	COUNT(customerkey) AS num_customers,
	SUM(COUNT(customerkey)) OVER(PARTITION BY cohort_yr) AS total_customers,
	-- here we used window func because we already used group by and we want the sum of total customers both churned and active, and also we didnt partitioned it by anything, cuz obvio we want sum of total customers
	-- but without applying partition by we were getting the collected information, like total count of customer, but we want the count of customers as per cohort yr, hence we partitioned it by cohort yr
	ROUND(COUNT(customerkey)/SUM(COUNT(customerkey)) OVER(PARTITION BY cohort_yr), 2) AS status_percentage,
	cohort_yr
FROM
	churned_customers
GROUP BY 
	cohort_yr,
	customers_status 
