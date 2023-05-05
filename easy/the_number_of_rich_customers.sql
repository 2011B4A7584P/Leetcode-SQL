SELECT
    COUNT(DISTINCT customer_id) AS rich_count
FROM
    store s
WHERE
    s.amount > 500;