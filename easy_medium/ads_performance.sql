WITH
ads_performance (ad_id, ad_total_clicks, ad_total_views) AS
(
SELECT
    a.ad_id,
    SUM(CASE WHEN a.action = 'Clicked' THEN 1 ELSE 0 END) AS ad_total_clicks,
    SUM(CASE WHEN a.action = 'Viewed' THEN 1 ELSE 0 END) AS ad_total_views
FROM
    ads a
GROUP BY 
    a.ad_id
)
SELECT
    ad_id,
    CASE WHEN ad_total_clicks + ad_total_views = 0 THEN 0
         ELSE   ROUND((ad_total_clicks*100)/(ad_total_clicks + ad_total_views),2) 
         END AS ctr
FROM
    ads_performance
ORDER BY 
    ctr DESC, 
    ad_id ASC;