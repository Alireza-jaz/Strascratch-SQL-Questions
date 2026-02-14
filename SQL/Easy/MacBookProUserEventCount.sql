-- Title: MacBookPro User Event Count
-- Difficulty: Easy
--Question: Count the number of user events performed by MacBookPro users.
--           Output the result along with the event name.
--            Sort the result based on the event count in the descending order.

--First Solution
WITH mac_users As(
SELECT  *
FROM playbook_events
WHERE device='macbook pro')
SELECT 
      event_name,
      COUNT(*) AS n_events
FROM mac_users
GROUP BY event_name
ORDER BY n_events DESC


--Second Solution
SELECT  event_name,
        COUNT(*) AS n_events
FROM playbook_events
WHERE device='macbook pro'
GROUP BY event_name
ORDER BY n_events DESC
