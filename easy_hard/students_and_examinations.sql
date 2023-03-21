SELECT
    stu.student_id,
    stu.student_name,
    stu.subject_name,
    SUM(CASE WHEN e.subject_name IS NOT NULL THEN 1 ELSE 0 END) AS attended_exams
FROM
    (SELECT * FROM students s, subjects st) stu
LEFT JOIN  
    examinations e
ON 
    stu.student_id = e.student_id
AND stu.subject_name = e.subject_name
GROUP BY 
    stu.student_id, 
    stu.student_name,
    stu.subject_name  
ORDER BY 
    stu.student_id, 
    stu.subject_name;