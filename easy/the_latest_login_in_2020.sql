SELECT
    a.user_id,
    MAX(a.time_stamp) AS last_stamp
FROM
    logins a
WHERE
    YEAR(a.time_stamp) = 2020
GROUP BY
    a.user_id;