SELECT product_id, store, price FROM
(SELECT
    p.product_id,
    CASE WHEN p.store1 IS NOT NULL THEN 'store1' END AS store,
    CASE WHEN p.store1 IS NOT NULL THEN store1 END AS price
FROM
    products p
UNION
SELECT
    p.product_id,
    CASE WHEN p.store2 IS NOT NULL THEN 'store2' END AS store,
    CASE WHEN p.store2 IS NOT NULL THEN store2 END AS price
FROM
    products p    
UNION
SELECT
    p.product_id,
    CASE WHEN p.store3 IS NOT NULL THEN 'store3' END AS store,
    CASE WHEN p.store3 IS NOT NULL THEN store3 END AS price
FROM
    products p) p
WHERE p.store IS NOT NULL;