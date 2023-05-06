SELECT
    e.employee_id,
    CASE WHEN e.employee_id % 2 != 0 AND e.name NOT LIKE 'M%' THEN e.salary
         ELSE 0 END AS bonus
FROM
    employees e
ORDER BY e.employee_id;