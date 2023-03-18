WITH

single_numbers (num,frequency) AS
(
SELECT
    num,
    COUNT(num) AS frequency
FROM
    mynumbers
GROUP BY num
HAVING frequency = 1
)
SELECT
    MAX(num) AS num
FROM
    single_numbers;