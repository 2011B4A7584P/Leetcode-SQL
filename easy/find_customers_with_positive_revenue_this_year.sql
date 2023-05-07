SELECT
    c.customer_id
FROM
    customers c
WHERE
    c.year = 2021
AND c.revenue > 0;