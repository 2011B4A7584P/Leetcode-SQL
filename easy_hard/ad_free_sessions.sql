WITH sessions_with_ads (session_id) AS
(
SELECT
    p.session_id
FROM
    playback p
JOIN
    ads a
ON 
    p.customer_id = a.customer_id
WHERE
    a.timestamp BETWEEN p.start_time AND p.end_time
)
SELECT 
    session_id 
FROM 
    playback p 
WHERE 
    session_id 
NOT IN (SELECT session_id FROM sessions_with_ads);