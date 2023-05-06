SELECT
    s.artist,
    COUNT(s.id) AS occurrences
FROM
    spotify s
GROUP BY 
    s.artist
ORDER BY 
    occurrences DESC, s.artist ASC;