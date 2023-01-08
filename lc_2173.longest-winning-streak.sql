WITH t1 AS (
    SELECT
        player_id, result,
        ROW_NUMBER() OVER (PARTITION BY player_id ORDER BY match_day) AS rk1,           /* punchline */
        ROW_NUMBER() OVER (PARTITION BY player_id, result ORDER BY match_day) AS rk2    /* punchline */
    FROM Matches
),
t2 AS (
    SELECT
        player_id,
        rk1 - rk2,          
        SUM(result = 'Win') AS streak       /* punchline */
    FROM t1
    GROUP BY 1, 2
)
SELECT
    player_id,
    max(streak) AS longest_streak
FROM t2
GROUP BY 1
