-- Title: Unique Users Per Client Per Month
-- Difficulty: Easy
--Question: Write a query that returns the number of unique users per client for each month. Assume all events occur within the same year, 
--            so only month needs to be be in the output as a number from 1 to 12.


--First Solution
SELECT client_id 
       ,Extract(MONTH FROM time_id) AS month 
       ,COUNT(DISTINCT(user_id)) AS n_monthly_users
FROM fact_events
GROUP BY month,client_id
ORDER BY n_monthly_users DESC


