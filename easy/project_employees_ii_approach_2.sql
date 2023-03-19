WITH
project_headcount (project_id, headcount, headcount_rank) AS
(
SELECT
    p.project_id,
    COUNT(p.employee_id) AS headcount,
    DENSE_RANK() OVER (ORDER BY COUNT(p.employee_id) DESC) AS headcount_rank
FROM
    project p
GROUP BY 
    p.project_id
)
SELECT
    p.project_id
FROM
    project_headcount p
WHERE 
    headcount_rank = 1;