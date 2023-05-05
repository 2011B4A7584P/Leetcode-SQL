SELECT 
        * 
FROM 
    olympic o 
ORDER BY 
    o.gold_medals DESC, 
    o.silver_medals DESC, 
    o.bronze_medals DESC,
    o.country ASC;