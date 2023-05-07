SELECT 
    p.product_id 
FROM
    products p 
WHERE 
    p.low_fats = 'Y' 
AND p.recyclable = 'Y';