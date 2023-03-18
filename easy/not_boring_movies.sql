SELECT
    *
FROM
    cinema c
WHERE 
    c.id % 2 != 0
AND LOWER(c.description) NOT LIKE '%boring%'
ORDER BY rating DESC;