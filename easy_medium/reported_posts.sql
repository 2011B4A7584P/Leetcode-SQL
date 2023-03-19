SELECT
    a.extra AS report_reason,
    COUNT(DISTINCT a.post_id) AS report_count
FROM
    actions a
WHERE
    a.action_date = '2019-07-04'
AND a.extra IS NOT NULL
AND a.action = 'report'
GROUP BY 
    a.extra;