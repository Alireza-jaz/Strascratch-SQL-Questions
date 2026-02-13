-- Title: Popularity of Hack
-- Difficulty: Easy
--Question: Meta/Facebook has developed a new programing language called Hack.To measure the popularity of Hack they ran a survey with their employees.
--           The survey included data on previous programing familiarity as well as the number of years of experience, age, gender and most importantly satisfaction with Hack. 
--            Due to an error location data was not collected, but your supervisor demands a report showing average popularity of Hack by office location. 
--             Luckily the user IDs of employees completing the surveys were stored.
--              Based on the above, find the average popularity of the Hack per office location.
--               Output the location along with the average popularity.

--First Solution
SELECT AVG(popularity),
        location
FROM facebook_hack_survey AS fh
JOIN facebook_employees fe 
ON fe.id=fh.employee_id
GROUP BY location
  
--Second Solution 
SELECT AVG(popularity),
        location
FROM facebook_hack_survey AS fh, facebook_employees fe 
where fe.id=fh.employee_id
GROUP BY 2 --OR location
