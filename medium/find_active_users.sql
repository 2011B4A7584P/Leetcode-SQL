WITH orders(user_id, created_at, last_order_date) AS
(
SELECT 
	u.user_id,
	u.created_at,
	LAG(u.created_at) OVER(PARTITION BY user_id ORDER BY created_at) AS last_order_date
FROM
	users u 
)
SELECT 
	DISTINCT o.user_id
FROM	
	orders o
WHERE ABS(DATEDIFF(created_at, last_order_date)) IS NOT NULL
AND ABS(DATEDIFF(created_at, last_order_date)) <= 7;