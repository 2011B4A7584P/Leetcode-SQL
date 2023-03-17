WITH

unique_sent_requests(total_sent_requests) AS
(
SELECT COUNT(*) AS total_sent_requests FROM(
SELECT 
    sender_id,
    send_to_id,
    COUNT(*)
FROM
    friendrequest 
GROUP BY 
    sender_id,
    send_to_id
)sent_requests
),

unique_accept_requests(total_accept_requests) AS
(
SELECT COUNT(*) AS total_accept_requests FROM(
SELECT 
    requester_id,
    accepter_id,
    COUNT(*)
FROM
    requestaccepted 
GROUP BY 
    requester_id,
    accepter_id
)sent_requests
)

SELECT 
    IFNULL(ROUND(total_accept_requests/total_sent_requests,2),0) AS accept_rate
FROM 
    unique_sent_requests, 
    unique_accept_requests;