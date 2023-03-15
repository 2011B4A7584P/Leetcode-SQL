WITH 
weather_comparison_info (id, record_date_difference, temperature_difference) AS
(
SELECT 
    id,
    DATEDIFF(recordDate, LAG(recordDate,1) OVER (ORDER BY recordDate)) AS record_date_difference_with_predecessor,
    temperature - LAG(temperature,1) OVER (ORDER BY recordDate) AS temperature_difference_with_predecessor
FROM
    weather
) 
SELECT 
    id 
FROM 
    weather_comparison_info w
WHERE 
    w.temperature_difference_with_predecessor > 0 
AND w.record_date_difference_with_predecessor = 1;