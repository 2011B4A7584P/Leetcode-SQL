SELECT
    DATE_FORMAT(o.order_date,"%Y-%m") AS month,
    COUNT(order_id) AS order_count,
    COUNT(DISTINCT customer_id) AS customer_count
FROM
    orders o
WHERE
    o.invoice > 20
GROUP BY 
    DATE_FORMAT(o.order_date,"%Y-%m");