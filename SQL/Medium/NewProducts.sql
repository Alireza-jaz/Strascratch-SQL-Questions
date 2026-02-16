-- Title: New Products
-- Difficulty: Medium
--Question: Calculate the net change in the number of products launched by companies in 2020 compared to 2019. Your output should include the company names and the net difference.
--            (Net difference = Number of products launched in 2020 - The number launched in 2019.)

-- First Solution
SELECT 
    company_name,
    COUNT(*) FILTER (WHERE year = 2020) - 
    COUNT(*) FILTER (WHERE year = 2019) AS diff
FROM car_launches
GROUP BY company_name;


-- Second Solution
WITH cars20 AS(
SELECT company_name,count(1) AS n_2020
From car_launches
WHERE year=2020
GROUP BY company_name),
cars19 AS(
SELECT  company_name,count(1) AS n_2019
FROM car_launches
WHERE year=2019
GROUP BY company_name)
SELECT company_name,COALESCE(n_2020-n_2019,0) AS difference  FROM(
SELECT c.company_name ,c.n_2020,t.n_2019 FROM cars20 c 
LEFT JOIN cars19 t
ON t.company_name=c.company_name)


-- Third Solution
SELECT 
    company_name,
    SUM(CASE WHEN year = 2020 THEN 1 ELSE 0 END) - 
    SUM(CASE WHEN year = 2019 THEN 1 ELSE 0 END) AS diff
FROM car_launches
GROUP BY company_name;
