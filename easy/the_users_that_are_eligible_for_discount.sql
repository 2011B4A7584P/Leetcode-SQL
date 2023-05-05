CREATE PROCEDURE getUserIDs(startDate DATE, endDate DATE, minAmount INT)
BEGIN
	# Write your MySQL query statement below.
	SELECT 
        DISTINCT p.user_id
    FROM
        purchases p
    WHERE 
        p.time_stamp >= startDate 
    AND p.time_stamp <= endDate
    AND p.amount >= minAmount
    ORDER BY p.user_id;
END