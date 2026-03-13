CREATE VIEW cohort_analysis AS
WITH customer_revenue AS(
	SELECT 
		s.customerkey,
		s.orderdate,
		SUM(s.quantity * s.netprice * s.exchangerate) AS rev,
		COUNT(s.orderkey),
		c.countryfull,
		c.age,
		c.givenname,
		c.surname 
	FROM sales s
	LEFT JOIN customer c 
	ON s.customerkey = c.customerkey 
	GROUP BY
		c.customerkey, 
		s.customerkey,
		s.orderdate,
		c.countryfull,
		c.age,
		c.givenname,
		c.surname 
)
SELECT 
	cr.*,
	MIN(cr.orderdate) OVER (PARTITION BY cr.customerkey) AS first_purchase_yr,
	EXTRACT(YEAR FROM MIN(cr.orderdate) OVER (PARTITION BY cr.customerkey)) AS cohort_yr
FROM customer_revenue cr