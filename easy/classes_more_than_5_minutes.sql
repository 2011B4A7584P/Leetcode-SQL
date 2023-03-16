WITH 

class_batch(class, batch_size) AS
(
SELECT
    c.class,
    COUNT(c.student) AS batch_size
FROM
    courses c
GROUP BY c.class
)
SELECT
    c.class
FROM
   class_batch c
WHERE 
    c.batch_size > 4;