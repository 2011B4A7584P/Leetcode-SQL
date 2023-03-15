WITH ranked_departmental_salaries(department, employee, salary, salary_rank) AS 
(SELECT 
    d.name AS department,
    e.name AS employee,
    e.salary,
    DENSE_RANK() OVER(PARTITION BY e.departmentId ORDER BY e.salary DESC) AS salary_rank
FROM
    employee e
JOIN 
    department d
ON e.departmentId = d.id)
SELECT department, employee, salary FROM ranked_departmental_salaries r
WHERE r.salary_rank <=3;
