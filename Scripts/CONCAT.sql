DROP VIEW cohort_analysis;

CREATE OR REPLACE VIEW public.cohort_analysis AS
WITH customer_revenue AS (
         SELECT s.customerkey,
            s.orderdate,
            sum(s.quantity::double precision * s.netprice * s.exchangerate) AS rev,
            count(s.orderkey) AS num_orders,
            c.countryfull,
            c.age,
            c.givenname,
            c.surname
           FROM sales s
             LEFT JOIN customer c ON s.customerkey = c.customerkey
          GROUP BY c.customerkey, s.customerkey, s.orderdate, c.countryfull, c.age, c.givenname, c.surname
        )
 SELECT customerkey,
    orderdate,
    rev,
    num_orders,
    countryfull,
    age,
    CONCAT(TRIM(givenname), ' ', TRIM(surname)) AS full_name,
    min(orderdate) OVER (PARTITION BY customerkey) AS first_purchase_yr,
    EXTRACT(year FROM min(orderdate) OVER (PARTITION BY customerkey)) AS cohort_yr
   FROM customer_revenue cr;