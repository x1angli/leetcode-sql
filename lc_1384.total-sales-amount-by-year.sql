# Write your MySQL query statement below

WITH s_t AS (
    SELECT yr,
           product_id,  
           (DATEDIFF(LEAST(ADDDATE(period_end, 1), MAKEDATE(yr+1, 1)), GREATEST(period_start, MAKEDATE(yr, 1)))) * average_daily_sales AS amt
    FROM   (VALUES ROW(2018), ROW(2019), ROW(2020)) yr_t(yr), 
           Sales
    HAVING amt > 0
)

SELECT p.product_id, 
       p.product_name, 
       CAST(yr AS CHAR) AS report_year, 
       SUM(amt) AS total_amount
FROM   product p LEFT JOIN s_t 
ON     p.product_id = s_t.product_id
GROUP BY  1, 3
ORDER BY  1, 3


# # Note: 
# This solution is more concise than the official solution 
