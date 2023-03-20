SELECT
    q.query_name,
    ROUND(AVG(q.rating/q.position),2) AS quality,
    ROUND(SUM((CASE WHEN q.rating < 3 THEN 1 ELSE 0 END)*100)/COUNT(q.rating),2) AS poor_query_percentage
FROM
    queries q
GROUP BY 
    q.query_name;