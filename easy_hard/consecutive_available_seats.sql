WITH
seat_occupancy (seat_id, free, previous_seat_status, next_seat_status) AS
(
SELECT 
    c.seat_id,
    c.free,
    LAG(free,1) OVER (ORDER BY c.seat_id) AS previous_seat_status,
    LEAD(free,1) OVER (ORDER BY c.seat_id) AS next_seat_status
FROM
    cinema c
)
SELECT 
    seat_id
FROM 
    seat_occupancy
WHERE 
    free = 1
AND (previous_seat_status = 1 OR next_seat_status = 1)
ORDER BY seat_id;