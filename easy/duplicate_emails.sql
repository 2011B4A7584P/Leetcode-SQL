WITH 
duplicate_emails(email, repeat_count) AS
(
SELECT 
    p.email, 
    COUNT(p.id) AS repeat_count
FROM 
	person p 
GROUP BY p.email 
HAVING repeat_count > 1
)   
SELECT 
	email 
FROM
    duplicate_emails;