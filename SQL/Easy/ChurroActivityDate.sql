-- Title: Churro Activity Date
-- Difficulty: Easy
--Question: Find the inspection date and risk category (pe_description) of facilities named 'STREET CHURROS' that received a score below 95.


--First Solution
SELECT activity_date ,
       pe_description
FROM los_angeles_restaurant_health_inspections
WHERE facility_name='STREET CHURROS' 
AND score<95


--Second Solution
WITH street_churros AS(SELECT *
FROM los_angeles_restaurant_health_inspections
WHERE facility_name='STREET CHURROS' )

SELECT activity_date ,
       pe_description
FROM street_churros
WHERE score <954)
