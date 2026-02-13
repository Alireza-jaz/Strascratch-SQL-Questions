-- Title: Bikes Last Used
-- Difficulty: Easy
--Question: Find the last time each bike was in use. Output both the bike number and the date-timestamp of the bike's last use (i.e., the date-time the bike was returned).
--            Order the results by bikes that were most recently used.

--First Solution
WITH last_used as(
SELECT * ,
      MAX(end_time)OVER(PARTITION BY bike_number) AS last_time
FROM dc_bikeshare_q1_2012)
  
SELECT
    bike_number 
    ,end_time as last_used 
FROM last_used 
WHERE end_time=last_time

  
--Second Solution 
SELECT bike_number,
       MAX(end_time)
FROM dc_bikeshare_q1_2012
GROUP BY bike_number
