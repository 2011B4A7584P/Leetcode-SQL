WITH new_york_university(university, excellent_students) AS
(
SELECT
    "New York University" AS university,
    COUNT(n.student_id)
FROM
    newyork n
WHERE n.score >= 90
),
california_university(university, excellent_students) AS
(
SELECT
    "California University" AS university,
    COUNT(c.student_id)
FROM
    california c
WHERE c.score >= 90
)
SELECT 
     CASE WHEN n.excellent_students > c.excellent_students THEN n.university
          WHEN n.excellent_students < c.excellent_students THEN c.university
          ELSE 'No Winner' END AS winner
FROM
    new_york_university n,
    california_university c;