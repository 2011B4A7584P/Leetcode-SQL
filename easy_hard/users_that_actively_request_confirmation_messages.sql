WITH message_window(user_id, gap) AS
(
SELECT
    user_id,
    TIMESTAMPDIFF(SECOND, time_stamp, LAG(time_stamp) OVER(PARTITION BY user_id ORDER BY time_stamp DESC)) AS gap
FROM
    confirmations
)
SELECT DISTINCT 
    user_id
FROM
    message_window
WHERE gap IS NOT NULL AND ABS(gap) <= 86400
;