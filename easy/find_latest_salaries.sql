SELECT 
        s.emp_id,
        s.firstname,
        s.lastname,
        MAX(s.salary) AS salary,
        s.department_id
FROM 
  salary s
GROUP BY
  s.emp_id,s.firstname,s.lastname,s.department_id
ORDER BY
s.emp_id
;