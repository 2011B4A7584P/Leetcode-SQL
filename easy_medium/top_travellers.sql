WITH 

user_id_distance_info (name, id, travelled_distance) AS
(
SELECT
    u.name,
    u.id,
    SUM(IFNULL(r.distance,0)) AS travelled_distance
FROM
    users u
LEFT JOIN
    rides r
ON
    u.id = r.user_id
GROUP BY 
    u.name,
    u.id
)
SELECT
    name,
    travelled_distance
FROM
    user_id_distance_info
ORDER BY 
	travelled_distance DESC, 
	name ASC;    