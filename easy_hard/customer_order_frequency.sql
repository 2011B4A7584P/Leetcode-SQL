# Write your MySQL query statement below

WITH customer_spending_details (customer_id,name, exp_month, total_spending) AS
(
SELECT
    c.customer_id,
    c.name,
    MONTH(o.order_date) AS exp_month,
    SUM(o.quantity * p.price) AS total_spending
FROM
    customers c
JOIN
    orders o
ON  
    c.customer_id = o.customer_id
JOIN
    product p
ON
    o.product_id = p.product_id
WHERE 
    MONTH(o.order_date) IN (6,7) 
AND YEAR(o.order_date) = 2020
GROUP BY 
    c.customer_id,
    c.name,
    MONTH(o.order_date),
    YEAR(o.order_date)
HAVING 
    total_spending >= 100
)
SELECT
    DISTINCT
    c1.customer_id,
    c1.name
FROM
    customer_spending_details c1
LEFT JOIN
    customer_spending_details c2
ON
    c1.customer_id = c2.customer_id
WHERE
    c1.exp_month < c2.exp_month;