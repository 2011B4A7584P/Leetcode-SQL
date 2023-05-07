WITH total_users(user_count) AS
(
    SELECT
        COUNT(u.user_id) AS user_count
    FROM
        users u
), registered_users_by_contest(contest_id, registered_users) AS
(
    SELECT
        r.contest_id,
        COUNT(r.user_id) AS registered_users
    FROM
        register r
    GROUP BY 
        r.contest_id
) 
    SELECT
        contest_id,
        ROUND((registered_users/user_count)*100,2) AS percentage
    FROM
        total_users, registered_users_by_contest
    ORDER BY registered_users DESC, contest_id ASC;