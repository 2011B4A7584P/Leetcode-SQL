SELECT
    LOWER(TRIM(s.product_name)) AS product_name,
    DATE_FORMAT(sale_date,'%Y-%m') AS sale_date,
    COUNT(s.sale_id) AS total
FROM
    sales s
GROUP BY
    LOWER(TRIM(s.product_name)),
    DATE_FORMAT(sale_date,'%Y-%m')
ORDER BY 
    LOWER(TRIM(s.product_name)),
    DATE_FORMAT(sale_date,'%Y-%m');