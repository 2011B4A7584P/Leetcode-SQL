WITH

customer_order_counts (customer_number, order_count) AS
(
SELECT 
    customer_number,
    COUNT(order_number) AS order_count
FROM
    orders
GROUP BY customer_number
),
customer_ranks (customer_number, order_count_rank) AS
(
SELECT 
    customer_number,
    DENSE_RANK() OVER(ORDER BY order_count DESC) AS order_count_rank
FROM
    customer_order_counts
)  
SELECT 
    customer_number
FROM
    customer_ranks
WHERE 
    order_count_rank = 1;