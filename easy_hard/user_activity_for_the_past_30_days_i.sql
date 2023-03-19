SELECT
    a.activity_date AS day,
    COUNT(DISTINCT a.user_id) AS active_users
FROM
    activity a
WHERE
    DATEDIFF('2019-07-27', a.activity_date) BETWEEN 0 AND 29
GROUP BY 
    a.activity_date;