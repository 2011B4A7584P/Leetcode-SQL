WITH

login_rankings (player_id, device_id,login_rank) AS

(
SELECT
    a.player_id,
    a.device_id,
    DENSE_RANK() OVER(PARTITION BY a.player_id ORDER BY a.event_date) AS login_rank 
FROM
    activity a
) 

SELECT 
	player_id, 
	device_id 
FROM 
	login_rankings d
WHERE 
	d.login_rank = 1;