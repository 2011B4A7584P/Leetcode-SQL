WITH
sales_ranks (seller_id, sales, sales_rank) AS
(
SELECT
    s.seller_id,
    SUM(s.price) AS total_sales,
    DENSE_RANK() OVER (ORDER BY SUM(s.price) DESC) AS sales_rank
FROM
    sales s
GROUP BY 
    s.seller_id
)
SELECT 
    seller_id
FROM
    sales_ranks s
WHERE
    s.sales_rank = 1;