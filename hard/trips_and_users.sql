WITH cancelled_requests_by_unbanned_clients_and_drivers(day, cancellations_by_unbanned_drivers_and_clients) AS
(SELECT
    t.request_at AS day,
    SUM(CASE WHEN t.status != 'completed' AND clients.banned = 'No' AND drivers.banned = 'No' THEN 1 ELSE 0 END) AS cancellations_by_unbanned_drivers_and_clients
FROM
    trips t
LEFT JOIN
    (SELECT * FROM trips t JOIN users u ON t.client_id = u.users_id WHERE 
    t.status != 'completed' AND t.request_at BETWEEN '2013-10-01' AND '2013-10-03' AND u.banned = 'No' AND u.role = 'client') clients
ON    
    t.id = clients.id
LEFT JOIN
    (SELECT * FROM trips t JOIN users u ON t.driver_id = u.users_id WHERE 
    t.status != 'completed' AND t.request_at BETWEEN '2013-10-01' AND '2013-10-03' AND u.banned = 'No' AND u.role = 'driver') drivers  
ON    
    t.id = drivers.id 
WHERE t.request_at BETWEEN '2013-10-01' AND '2013-10-03' GROUP BY t.request_at),



total_requests_with_unbanned_users_by_day (day, total_requests_count) AS
(SELECT
    t.request_at AS day,
     SUM(CASE WHEN clients.banned = 'No' AND drivers.banned = 'No' THEN 1 ELSE 0 END) AS total_requests_count
FROM
    trips t
LEFT JOIN
    (SELECT * FROM trips t JOIN users u ON t.client_id = u.users_id WHERE 
     t.request_at BETWEEN '2013-10-01' AND '2013-10-03' AND u.banned = 'No') clients
ON    
    t.id = clients.id
LEFT JOIN
    (SELECT * FROM trips t JOIN users u ON t.driver_id = u.users_id WHERE 
    t.request_at BETWEEN '2013-10-01' AND '2013-10-03' AND u.banned = 'No') drivers  
ON    
    t.id = drivers.id 
WHERE t.request_at BETWEEN '2013-10-01' AND '2013-10-03' GROUP BY t.request_at
)

SELECT t1.day AS `Day`, ROUND(IFNULL(t2.cancellations_by_unbanned_drivers_and_clients/t1.total_requests_count,0),2) AS `Cancellation Rate`
FROM total_requests_with_unbanned_users_by_day  t1
JOIN
cancelled_requests_by_unbanned_clients_and_drivers t2
ON t1.day = t2.day
WHERE t1.total_requests_count > 0;