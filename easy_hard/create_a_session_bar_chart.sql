WITH 

session_durations_in_minutes (session, duration_mins) AS

(
SELECT
    session_id AS session,
    duration/60 AS duration_mins
FROM
    sessions s
)

SELECT
    '[0-5>' AS bin,
    SUM(CASE WHEN duration_mins >= 0  AND duration_mins < 5 THEN 1 ELSE 0 END) AS total
FROM
    session_durations_in_minutes 
GROUP BY 
    bin
    

UNION

SELECT
    '[5-10>' AS bin,
    SUM(CASE WHEN duration_mins >= 5  AND duration_mins < 10 THEN 1 ELSE 0 END) AS total
FROM
    session_durations_in_minutes 
GROUP BY 
    bin
    

UNION

SELECT
    '[10-15>' AS bin,
    SUM(CASE WHEN duration_mins >= 10  AND duration_mins < 15 THEN 1 ELSE 0 END) AS total
FROM
    session_durations_in_minutes 
GROUP BY 
    bin

UNION

SELECT
    '15 or more' AS bin,
    SUM(CASE WHEN duration_mins >= 15 THEN 1 ELSE 0 END) AS total
FROM
    session_durations_in_minutes 
GROUP BY 
    bin;