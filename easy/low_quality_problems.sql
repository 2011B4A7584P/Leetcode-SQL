SELECT
    problem_id
FROM
    problems p
WHERE
    p.likes/(p.likes + p.dislikes) < 0.6
ORDER BY problem_id;