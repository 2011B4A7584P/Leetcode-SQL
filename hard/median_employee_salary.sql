# Write your MySQL query statement below

WITH salary_info (id, company, salary, salary_num) AS  
(
SELECT
    id,
    company,
    salary,
    ROW_NUMBER() OVER (PARTITION BY company ORDER BY salary) AS salary_num
FROM
    employee
), company_info (company, headcount) AS
(
SELECT
    company,
    COUNT(id) AS headcount
FROM
    employee 
GROUP BY 
    company
)
SELECT
    s.id,
    s.company,
    s.salary
FROM
    salary_info s
JOIN
    company_info c
ON
    s.company = c.company
WHERE
(c.headcount % 2 = 0 AND s.salary_num IN (ROUND(headcount/2,0), ROUND(headcount/2,0) + 1))
OR (c.headcount % 2 != 0 AND s.salary_num = ROUND(headcount/2,0));