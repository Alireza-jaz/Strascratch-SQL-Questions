-- Title: Lyft Driver Wages
-- Difficulty: Easy
--Question: Find all Lyft drivers who earn either equal to or less than 30k USD or equal to or more than 70k USD.
--            Output all details related to retrieved records.

--First Solution
SELECT * FROM lyft_drivers
WHERE yearly_salary<=30000 
OR yearly_salary>=70000

--Second Solution 
SELECT * FROM lyft_drivers
WHERE yearly_salary NOT BETWEEN 30000 AND 70000
