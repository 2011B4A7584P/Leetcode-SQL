SELECT
    DISTINCT
    s.name
FROM
    salesperson s 
LEFT JOIN 
    orders o
ON 
    s.sales_id = o.sales_id
WHERE
    s.sales_id NOT IN (
SELECT
    o.sales_id
FROM
    orders o
LEFT JOIN
    company c
ON
    o.com_id = c.com_id
WHERE
    c.name = 'RED');