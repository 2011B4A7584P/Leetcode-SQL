SELECT
    e.employee_id,
    e.department_id
FROM
    employee e
WHERE
    e.primary_flag = 'Y'
UNION
SELECT 
    e.employee_id,
    e.department_id
FROM
    employee e
WHERE
    e.employee_id
IN
(SELECT employee_id FROM(
    SELECT
        e.employee_id,
        COUNT(department_id) AS dept_count
    FROM
        employee e
    GROUP BY e.employee_id
    HAVING dept_count = 1
)e)