WITH
project_headcount (project_id, headcount) AS
(
SELECT
    p.project_id,
    COUNT(p.employee_id) AS headcount
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
    headcount IN (SELECT MAX(headcount) FROM project_headcount);