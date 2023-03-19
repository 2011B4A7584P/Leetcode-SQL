WITH

total_orders (all_orders) AS
(
SELECT
    COUNT(delivery_id) AS all_orders
FROM
    delivery d
),

immediate_orders (immediate_order_count) AS
(
SELECT
    COUNT(delivery_id) AS immediate_order_count
FROM
    delivery d
WHERE
    d.order_date = d.customer_pref_delivery_date
)

SELECT 
    ROUND(IFNULL((immediate_order_count*100)/all_orders,0),2) AS immediate_percentage
FROM
    total_orders, immediate_orders;