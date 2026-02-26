-- Title: Acceptance Rate By Date
-- Difficulty: Medium
--Question: 
      /* Calculate the friend acceptance rate for each date when friend requests were sent. A request is sent if action = sent and accepted if action = accepted.
          If a request is not accepted, there is no record of it being accepted in the table.
          The output will only include dates where requests were sent and at least one of them was accepted (acceptance can occur on any date after the request is sent).*/

-- First Solution
WITH sent_req AS(
    SELECT user_id_sender,user_id_receiver,date,action
    FROM fb_friend_requests
    WHERE action='sent'
)
,accepted_req AS(
    SELECT user_id_sender,user_id_receiver,date,action
    FROM fb_friend_requests
    WHERE action='accepted'
)
SELECT s.date,
    count(a.user_id_sender)/(count(s.user_id_sender)*1.0) acceptance_rate
FROM sent_req AS s
LEFT JOIN accepted_req AS a
ON a.user_id_sender=s.user_id_sender
AND a.user_id_receiver=s.user_id_receiver
GROUP BY s.date
HAVING COUNT(a.user_id_receiver) > 0


--Second Solution
SELECT 
    s.date,
    COUNT(a.user_id_sender) * 1.0 / COUNT(s.user_id_sender) AS acceptance_rate
FROM 
    (SELECT * FROM fb_friend_requests WHERE action = 'sent') s
LEFT JOIN 
    (SELECT * FROM fb_friend_requests WHERE action = 'accepted') a
    ON s.user_id_sender = a.user_id_sender 
    AND s.user_id_receiver = a.user_id_receiver
GROUP BY s.date

  
--Third Solution 
SELECT 
    s.date,
    COUNT(a.user_id_sender) * 1.0 / COUNT(s.user_id_sender) AS acceptance_rate
FROM fb_friend_requests s
LEFT JOIN fb_friend_requests a 
    ON s.user_id_sender = a.user_id_sender 
    AND s.user_id_receiver = a.user_id_receiver
    AND a.action = 'accepted' 
WHERE s.action = 'sent'      
GROUP BY s.date
