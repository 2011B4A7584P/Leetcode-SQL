SELECT
    p.product_id,
    SUM(CASE WHEN p.store = 'store1' THEN p.price END) AS store1,
    SUM(CASE WHEN p.store = 'store2' THEN p.price END) AS store2,
    SUM(CASE WHEN p.store = 'store3' THEN p.price END) AS store3
FROM
    products p
GROUP BY 
    p.product_id;