CREATE FUNCTION getUserIDs(startDate DATE, endDate DATE, minAmount INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
      SELECT
            COUNT(DISTINCT p.user_id) AS user_cnt
      FROM
            purchases p
      WHERE
            p.time_stamp >= startDate
      AND   p.time_stamp <= endDate
      AND   p.amount >= minAmount                
  );
END