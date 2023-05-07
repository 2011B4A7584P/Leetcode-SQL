SELECT
    t.tweet_id
FROM
    tweets t
WHERE
    LENGTH(t.content) > 15;