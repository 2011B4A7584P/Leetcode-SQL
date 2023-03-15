WITH
 
incomplete_requests_involving_unbanned_clients(id, banned) AS
(
 SELECT 
	t.id AS id,
    u.banned AS banned
 FROM 
	trips t 
 JOIN 
	users u 
 ON 
    t.client_id = u.users_id 
 WHERE 
    t.status != 'completed' 
 AND t.request_at BETWEEN '2013-10-01' AND '2013-10-03' 
 AND u.banned = 'No' AND u.role = 'client'
),
 
incomplete_requests_involving_unbanned_drivers(id, banned) AS 
(
 SELECT 
	t.id AS id,
    u.banned AS banned
 FROM 
	trips t 
 JOIN 
	users u 
 ON 
	t.driver_id = u.users_id 
 WHERE 
 t.status != 'completed' 
 AND t.request_at BETWEEN '2013-10-01' AND '2013-10-03' 
 AND u.banned = 'No' 
 AND u.role = 'driver'
),

cancelled_requests_by_unbanned_clients_and_drivers(day, cancellations_by_unbanned_drivers_and_clients) AS
(
 SELECT
	t.request_at AS day,
    SUM(CASE WHEN t.status != 'completed' AND c.banned = 'No' AND d.banned = 'No' THEN 1 ELSE 0 END) AS cancellations_by_unbanned_drivers_and_clients
 FROM
    trips t
 LEFT JOIN
    incomplete_requests_involving_unbanned_clients c
 ON    
    t.id = c.id
 LEFT JOIN
    incomplete_requests_involving_unbanned_drivers d	
 ON    
    t.id = d.id 
 WHERE 
	t.request_at BETWEEN '2013-10-01' AND '2013-10-03' 
 GROUP BY t.request_at
),

total_requests_with_unbanned_clients(id, banned) AS
(
 SELECT 
	t.id AS id,
    u.banned AS banned
 FROM 
	trips t 
 JOIN 
	users u 
 ON 
	t.client_id = u.users_id 
 WHERE 
    t.request_at BETWEEN '2013-10-01' AND '2013-10-03' 
	AND u.banned = 'No'
),

total_requests_with_unbanned_drivers(id, banned) AS
(
 SELECT 
	t.id AS id,
    u.banned AS banned
 FROM 
	trips t 
 JOIN 
	users u 
 ON 
	t.driver_id = u.users_id 
 WHERE 
    t.request_at BETWEEN '2013-10-01' AND '2013-10-03' 
	AND u.banned = 'No'
),

total_requests_with_unbanned_users_by_day (day, total_requests_count) AS
(
 SELECT
    t.request_at AS day,
    SUM(CASE WHEN c.banned = 'No' AND d.banned = 'No' THEN 1 ELSE 0 END) AS total_requests_count
 FROM
    trips t
 LEFT JOIN
    total_requests_with_unbanned_clients c
 ON    
    t.id = c.id
 LEFT JOIN
    total_requests_with_unbanned_drivers d  
 ON    
    t.id = d.id 
 WHERE 
	t.request_at BETWEEN '2013-10-01' AND '2013-10-03' 
	GROUP BY t.request_at
)

SELECT 
	t1.day AS `Day`, 
	ROUND(IFNULL(t1.cancellations_by_unbanned_drivers_and_clients/t2.total_requests_count,0),2) AS `Cancellation Rate`
FROM 
	cancelled_requests_by_unbanned_clients_and_drivers t1
JOIN
	total_requests_with_unbanned_users_by_day t2
ON 
	t1.day = t2.day
WHERE 
	t2.total_requests_count > 0;