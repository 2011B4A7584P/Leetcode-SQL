# Write your MySQL query statement below
WITH company_salary_info(pay_month, monthly_company_salary) AS
(
SELECT
    DATE_FORMAT(s.pay_date,'%Y-%m') AS pay_month,
    AVG(s.amount) AS monthly_company_salary
FROM
    salary s
GROUP BY 
    pay_month
),
department_salary_info(pay_month, department_id, monthly_department_salary) AS 
(
SELECT
    DATE_FORMAT(s.pay_date,'%Y-%m') AS pay_month,
    e.department_id,
    AVG(s.amount) AS monthly_company_salary
FROM
    salary s
JOIN
    employee e
ON 
    s.employee_id = e.employee_id
GROUP BY 
    pay_month,
    e.department_id
) 
SELECT 
    c.pay_month,
    d.department_id,
    CASE WHEN d.monthly_department_salary > c.monthly_company_salary THEN 'higher'
         WHEN d.monthly_department_salary = c.monthly_company_salary THEN 'same'
         ELSE 'lower' END AS 'comparison'
FROM
    company_salary_info c
LEFT JOIN
    department_salary_info d
ON
    c.pay_month = d.pay_month
ORDER BY department_id,pay_month;