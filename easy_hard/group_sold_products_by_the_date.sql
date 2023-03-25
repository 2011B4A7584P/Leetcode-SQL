SELECT
    a.sell_date,
    COUNT(DISTINCT a.product) AS num_sold,
    GROUP_CONCAT(DISTINCT product ORDER BY product SEPARATOR ',') AS products
FROM
    activities a
GROUP BY 
    a.sell_date
ORDER BY 
    a.sell_date;