WITH sales_data AS (
	SELECT 
		customerkey,
		SUM(quantity * netprice * exchangerate) AS net_rev
	FROM
		sales
	GROUP BY 
		customerkey 
)

SELECT 
	AVG(s.net_rev) AS spending_cust_avg_net_rev,
	AVG(COALESCE(s.net_rev, 0)) AS all_cust_avg_net_rev
FROM 
	customer c 
LEFT JOIN sales_data s
	ON s.customerkey = c.customerkey 