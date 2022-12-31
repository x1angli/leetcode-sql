# Write your MySQL query statement below

WITH evt_avgoccur AS (
    SELECT event_type,
        AVG (occurences) AS avgoccur
    FROM events 
    GROUP BY 1
)
SELECT business_id 
FROM events INNER JOIN evt_avgoccur
ON events.event_type = evt_avgoccur.event_type
    AND occurences > avgoccur
GROUP BY 1
HAVING COUNT(1) >= 2


## ----- A Clumsy Approach for reference ------------
# WITH t_outer AS ( 
#     WITH t_inner AS (
#         SELECT event_type,
#             AVG (occurences) AS avg_o
#         FROM events 
#         GROUP BY 1
#     )
#     SELECT business_id, events.event_type, COUNT(1)
#     FROM events INNER JOIN t_inner
#     ON events.event_type = t_inner.event_type
#         AND occurences > avg_o
#     GROUP BY 1, 2 
# )
# SELECT business_id FROM t_outer 
# GROUP BY 1
# HAVING COUNT(event_type) >= 2

