# Write your MySQL query statement below

WITH t AS (
    SELECT
        power,
 	    CONCAT (
            (
                IF(factor <0,'-','+')
            ),
            (
                CASE
                    WHEN power=0 THEN ABS(factor) 
                    WHEN power=1 THEN CONCAT(ABS(factor),'X')
                    ELSE CONCAT(ABS(factor), 'X' , '^', power) 
                END
            )
        ) item 
	FROM Terms
) 


SELECT 
    CONCAT(
        GROUP_CONCAT(item ORDER BY power DESC SEPARATOR ''),
        '=0'
    ) equation
FROM t
