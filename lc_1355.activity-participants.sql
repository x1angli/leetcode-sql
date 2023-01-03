# MYSQL solution 1
SELECT activity 
FROM friends
GROUP BY activity
HAVING COUNT(*) > ANY(
    SELECT COUNT(*) FROM friends GROUP BY activity
) AND COUNT(*) < ANY(
    SELECT COUNT(*) FROM friends GROUP BY activity
)

# MYSQL solution 2
With t AS (
    SELECT 
        activity,
        COUNT(*) as ct, 
        RANK() OVER (ORDER BY COUNT(*) ASC) AS rank_asc,
        RANK() OVER (ORDER BY COUNT(*) DESC) AS rank_desc
    FROM friends
    GROUP BY 1
)
SELECT activity
FROM t
WHERE rank_asc > 1 AND rank_desc > 1
