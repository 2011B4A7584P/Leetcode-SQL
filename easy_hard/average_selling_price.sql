WITH
product_sales (product_id, total_sales, total_quantity) AS
(
SELECT
    u.product_id,
    SUM(p.price*u.units) AS total_sales,
    SUM(u.units) AS total_quantity
FROM
    prices p
LEFT JOIN 
    unitsSold u
ON 
    p.product_id = u.product_id
WHERE 
    u.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY 
    p.product_id    
)
SELECT
    p.product_id,
    ROUND(IFNULL(p.total_sales/p.total_quantity,0),2) AS average_price
FROM
    product_sales p;