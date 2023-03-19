WITH

Q1_product_sales (product_id, product_name) AS
(SELECT
    s.product_id,
    p.product_name
FROM
    sales s
JOIN 
    product p
ON
    s.product_id = p.product_id
WHERE
    s.sale_date BETWEEN '2019-01-01' AND '2019-03-31'
),

non_Q1_product_sales (product_id, product_name) AS
(SELECT
    s.product_id,
    p.product_name
FROM
    sales s
JOIN 
    product p
ON
    s.product_id = p.product_id
WHERE 
    s.sale_date < '2019-01-01' OR  s.sale_date >'2019-03-31'
)   

SELECT
    DISTINCT
    product_id, 
    product_name
FROM
    Q1_product_sales
WHERE
    (product_id) NOT IN (SELECT product_id FROM non_Q1_product_sales);