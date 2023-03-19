WITH

S8_buyers (buyer_id) AS
(
SELECT
    s.buyer_id
FROM
    sales s
WHERE
    s.product_id IN (SELECT product_id FROM product WHERE UPPER(product_name) = 'S8')
),
IPHONE_buyers (buyer_id) AS
(
SELECT
    s.buyer_id
FROM
    sales s
WHERE
    s.product_id IN (SELECT product_id FROM product WHERE UPPER(product_name) = 'IPHONE')
)
SELECT 
   DISTINCT buyer_id 
FROM 
    S8_buyers 
WHERE 
    buyer_id NOT IN (SELECT buyer_id FROM IPHONE_buyers);