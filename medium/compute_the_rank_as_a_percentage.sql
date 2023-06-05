WITH department_headcount(department_id, headcount) AS
(
    SELECT 
        s.department_id,
        COUNT(s.student_id) AS headcount
    FROM
        students s
    GROUP BY s.department_id
), department_rank_list(student_id, department_id, student_rank) AS
(
    SELECT
        s.student_id,
        s.department_id,
        RANK() OVER(PARTITION BY s.department_id ORDER BY s.mark DESC) AS student_rank
    FROM   
        students s
)
SELECT
    d1.student_id,
    d1.department_id,
    IFNULL(ROUND(((d1.student_rank - 1)*100)/(d2.headcount-1),2),0) AS percentage
FROM
    department_rank_list d1
JOIN
    department_headcount d2
ON 
    d1.department_id = d2.department_id;