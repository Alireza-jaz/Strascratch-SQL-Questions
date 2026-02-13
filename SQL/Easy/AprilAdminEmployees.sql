-- Title: April Admin Employees
-- Difficulty: Easy
--Question: Find the number of employees working in the Admin department that joined in April or later, in any year.

--First Solution
SELECT count(*) AS number_of_employees 
FROM( SELECT * FROM worker
WHERE department LIKE '%Admin%' 
AND DATE_PART('month',joining_date)>=4)


--Second Solution
SELECT count(*) AS number_of_employees 
FROM( SELECT * FROM worker
WHERE department LIKE '%Admin%' 
AND EXTRACT(MONTH FROM joining_date)>=4)


