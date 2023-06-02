WITH reported_spam_and_removed_posts(spam_and_removed_posts, day) AS
(
    SELECT 
        COUNT(DISTINCT a.post_id) AS spam_and_removed_posts,
        a.action_date AS day
    FROM
        actions a 
    JOIN
        removals r
    ON  
        a.post_id = r.post_id          
    WHERE a.action = 'report'
    AND a.extra = 'spam'
    GROUP BY a.action_date
), spam_posts_by_day(spam_count, day) AS
(
    SELECT
        COUNT(DISTINCT a.post_id) AS spam_count,
        a.action_date AS day
    FROM
        actions a
    WHERE a.action = 'report'
    AND a.extra = 'spam'
    GROUP BY a.action_date
), percentage_by_day(percentage, day) AS 
(
    SELECT 
        (IFNULL(r.spam_and_removed_posts,0)/s.spam_count)*100 AS percentage,
        s.day
    FROM 
        spam_posts_by_day s
    LEFT JOIN
        reported_spam_and_removed_posts r
    ON 
    s.day = r.day
) 
SELECT 
    ROUND(SUM(percentage)/COUNT(day),2) AS average_daily_percent 
FROM 
    percentage_by_day p;