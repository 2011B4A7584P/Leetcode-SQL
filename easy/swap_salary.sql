UPDATE 
    salary s
SET
    s.sex = CASE WHEN s.sex = 'm' THEN 'f' ELSE 'm' END;