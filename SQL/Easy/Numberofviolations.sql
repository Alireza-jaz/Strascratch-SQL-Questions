-- Title: Number of violations
-- Difficulty: Easy
--Question: You are given a dataset of health inspections that includes details about violations. Each row represents an inspection, and if an inspection resulted in a violation,
--           the violation_id column will contain a value.
--            Count the total number of violations that occurred at 'Roxanne Cafe' for each year, based on the inspection date.
--             Output the year and the corresponding number of violations in ascending order of the year.

--First Solution
SELECT yearly
      ,count(1) AS inspection FROM(
SELECT * ,EXTRACT(YEAR FROM inspection_date) AS yearly
FROM sf_restaurant_health_violations
WHERE business_name='Roxanne Cafe')
GROUP BY yearly
ORDER BY inspection

--Second Solution
SELECT EXTRACT(YEAR FROM inspection_date) AS year,
       COUNT(*) AS n_inspection
FROM sf_restaurant_health_violations
WHERE business_name='Roxanne Cafe'
GROUP BY year
ORDER BY n_inspection ASC;
