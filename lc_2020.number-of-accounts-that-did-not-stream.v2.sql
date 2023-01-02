# MySQL solution version 2
WITH t1 AS (
    SELECT account_id 
    FROM Subscriptions
    WHERE YEAR(start_date) <= 2021 AND YEAR(end_date) >= 2021
),
WITH t2 AS (
    SELECT account_id 
    FROM Streams
    WHERE YEAR(stream_date) = 2021
)
SELECT COUNT(t1.account_id)
FROM t1 LEFT JOIN t2 USING (account_id)
WHERE t2.account_id IS NULL
