DELETE 
    person 
FROM 
    person 
JOIN 
    person p1 
ON 
    person.email = p1.email
WHERE 
	person.id > p1.id;