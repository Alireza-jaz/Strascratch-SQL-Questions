-- Title: Users By Average Session Time
-- Difficulty: Medium
--Question: 
      /*Calculate each user's average session time, where a session is defined as the time difference between a page_load and a page_exit.
         Assume each user has only one session per day. If there are multiple page_load or page_exit events on the same day, use only the 
          latest page_load and the earliest page_exit. Only consider sessions where the page_load occurs before the page_exit on the same day. 
            Output the user_id and their average session time.*/

-- Solution
WITH load AS(
    SELECT *,date(timestamp)
    FROM facebook_web_log
    WHERE action='page_load')
,exit AS(
    SELECT *,date(timestamp) 
    FROM facebook_web_log
    WHERE action='page_exit')
    
SELECT user_id,
    AVG(exit_time - load_time) AS avg_time
FROM(
    SELECT l.user_id,MAX(l.timestamp) AS load_time,
           MIN(e.timestamp) AS exit_time FROM load AS l
    JOIN exit AS e
    ON l.user_id=e.user_id 
    AND l.date=e.date
    WHERE e.timestamp>l.timestamp
    GROUP BY l.date,l.user_id)
GROUP BY user_id
