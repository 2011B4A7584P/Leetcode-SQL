CREATE PROCEDURE getUserIDs(startDate DATE, endDate DATE, minAmount INT)
BEGIN
	# Write your MySQL query statement below.
	SELECT 
        p.user_id
    FROM
        purchases p
    WHERE 
        p.time_stamp >= startDate 
    AND p.time_stamp <= endDate
    AND p.amount >= minAmount;
END