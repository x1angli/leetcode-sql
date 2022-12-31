# The key is 
# 1. the usage of GROUP_CONCAT
# Caveat: please remember to use "distinct", and "order by"

SELECT 
    sell_date, 
    COUNT(DISTINCT product) AS num_sold, 
    GROUP_CONCAT(DISTINCT product ORDER BY product ASC SEPARATOR ",") AS products   # punchline
FROM Activities 
GROUP BY sell_date 
