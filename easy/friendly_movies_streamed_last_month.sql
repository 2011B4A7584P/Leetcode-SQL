SELECT
    DISTINCT
    title
FROM
    tvprogram t
LEFT JOIN
    content c
ON 
    t.content_id = c.content_id
WHERE
    MONTH(t.program_date) = 6
AND YEAR(t.program_date) = 2020
AND c.kids_content = 'Y'
AND c.content_type = 'Movies';