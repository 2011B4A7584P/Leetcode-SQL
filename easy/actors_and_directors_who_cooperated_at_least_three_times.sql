WITH

actor_director_cooperation_stats(actor_id, director_id, cooperation_count) AS 
(
SELECT
    a.actor_id,
    a.director_id,
    COUNT(timestamp) AS cooperation_count
FROM
    actordirector a
GROUP BY
    a.actor_id,
    a.director_id
HAVING 
    cooperation_count >= 3
)
SELECT
    actor_id,
    director_id
FROM
    actor_director_cooperation_stats;