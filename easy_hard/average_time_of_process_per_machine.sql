# Write your MySQL query statement below

WITH machine_process_count(machine_id, process_count) AS
(
    SELECT
        a.machine_id,
        COUNT(DISTINCT a.process_id) AS process_count
    FROM
        activity a
    GROUP BY 
        a.machine_id
), 
    machine_process_time(machine_id, process_id, end_time, start_time) AS
(
    SELECT
        a.machine_id,
        a.process_id,
        MAX(a.timestamp) AS end_time,
        MIN(a.timestamp) AS start_time
    FROM
        activity a
    GROUP BY 
        a.machine_id,
        a.process_id
), 
    machine_total_time(machine_id, total_time) AS
(
    SELECT
        m.machine_id,
        SUM(m.end_time-m.start_time) AS total_time
    FROM
        machine_process_time m
    GROUP BY m.machine_id
) 
SELECT
    m1.machine_id,
    ROUND(m2.total_time/m1.process_count,3) AS processing_time
FROM
    machine_process_count m1
JOIN
    machine_total_time m2
ON 
    m1.machine_id = m2.machine_id;