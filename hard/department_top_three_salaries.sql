SELECT department, employee, salary FROM
(SELECT 
    d.name AS department,
    e.name AS employee,
    e.salary,
    DENSE_RANK() OVER(PARTITION BY e.departmentId ORDER BY e.salary DESC) AS salary_rank
FROM
    employee e
JOIN 
    department d
ON e.departmentId = d.id) department_ranked_salaries
WHERE salary_rank <=3;