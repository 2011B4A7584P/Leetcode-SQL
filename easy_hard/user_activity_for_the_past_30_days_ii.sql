WITH

user_sessions (user_id, session_count) AS
(
SELECT
    a.user_id,
    COUNT(DISTINCT a.session_id) AS session_count
FROM
    activity a
WHERE
    DATEDIFF('2019-07-27', activity_date) BETWEEN 0 AND 29
GROUP BY 
    a.user_id
)

SELECT
    ROUND(IFNULL(SUM(u.session_count)/COUNT(u.user_id),0),2) AS average_sessions_per_user
FROM
    user_sessions u;