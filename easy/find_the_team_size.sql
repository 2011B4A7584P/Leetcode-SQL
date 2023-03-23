SELECT
    e.employee_id,
    COUNT(e.employee_id) OVER (PARTITION BY e.team_id) AS team_size
FROM
    employee e;