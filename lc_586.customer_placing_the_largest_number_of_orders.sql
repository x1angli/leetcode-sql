/* ORDER BY and LIMIT */
SELECT  customer_number
FROM  Orders
GROUP BY 1
ORDER BY count(order_number) DESC
LIMIT 1 


/* Inequation and "ALL" to obtain the max */
SELECT customer_number
FROM Orders
GROUP BY customer_number
HAVING
    /* Alternatively, we can use common table expression CTE to encapsulate the following derived tbl */
    count(*) >= ALL(
        SELECT count(order_number) 
        FROM orders
        GROUP BY customer_number
    )  


/* RANK() | DENSE_RANK() | ROW_NUMBER() funciton */ 
SELECT
    customer_number
FROM (
    SELECT
        customer_number, 
        RANK() OVER (ORDER BY count(order_number) DESC) AS rk
    FROM
        orders
    GROUP BY 1
) t1
WHERE
    rk = 1

