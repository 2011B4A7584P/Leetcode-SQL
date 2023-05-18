SELECT
    b.bike_number,
    MAX(b.end_time) AS end_time
FROM
    bikes b
GROUP BY 
    b.bike_number
ORDER BY MAX(b.end_time) DESC;