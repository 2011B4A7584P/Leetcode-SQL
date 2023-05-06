SELECT
    CONCAT( DAYNAME(d.day),', ' ,MONTHNAME(d.day), ' ', DAY(d.day), ', ',YEAR(d.day) ) AS day
FROM
    days d;