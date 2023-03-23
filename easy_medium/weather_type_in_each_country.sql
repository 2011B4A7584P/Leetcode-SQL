WITH

country_weather_stats (country_name, average_weather) AS
(
SELECT
    c.country_name,
    AVG(w.weather_state) AS average_weather
FROM
    countries c
LEFT JOIN 
    weather w
ON 
    c.country_id = w.country_id
WHERE 
    MONTH(w.day) = 11
AND YEAR(w.day) = 2019
GROUP BY 
    c.country_name
)
SELECT
    c.country_name,
    CASE WHEN c.average_weather <= 15 THEN 'Cold'
         WHEN c.average_weather >= 25 THEN 'Hot'
         ELSE 'Warm'
         END AS weather_type
FROM
    country_weather_stats c;