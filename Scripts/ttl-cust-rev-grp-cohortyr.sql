SELECT 
	ca.cohort_yr,
	COUNT(DISTINCT ca.customerkey) AS total_customers,
	SUM(ca.rev) AS total_rev,
	SUM(ca.rev)/COUNT(DISTINCT ca.customerkey) AS customer_rev
FROM
	cohort_analysis ca 
WHERE 
	ca.orderdate = ca.first_purchase_yr 
GROUP BY
	ca.cohort_yr 