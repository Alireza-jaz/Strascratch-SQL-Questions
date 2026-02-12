-- Title: FindingUpdatedRecords
-- Difficulty: Easy
--Question: We have a table with employees and their salaries, however, some of the records are old and contain outdated salary information. 
--    Find the current salary of each employee assuming that salaries increase each year. 
--    Output their id, first name, last name, department ID, and current salary.Order your list by employee ID in ascending order.

--First Solution With CTE's
WITH ranked_employees AS(
    SELECT id, 
        first_name, 
        last_name, 
        department_id, 
        salary,
        Rank() OVER (PARTITION BY id ORDER BY salary DESC) AS rank_salary
    FROM ms_employee_salary)
SELECT id, 
        first_name, 
        last_name, 
        department_id, 
        salary
FROM ranked_employees
WHERE rank_salary=1


  
--Second Solution With Join's
SELECT 
    emp.id,
    emp.first_name,
    emp.last_name,
    emp.department_id,
    t.salary_max AS salary
FROM ms_employee_salary emp
JOIN (SELECT id, MAX(salary) AS salary_max FROM ms_employee_salary GROUP BY id)AS t
ON t.id=emp.id AND t.salary_max=
ORDER BY emp.id


--Third Solution With Subquery
SELECT id, 
        first_name, 
        last_name, 
        department_id, 
        salary
FROM (SELECT id,first_name,last_name,department_id,salary,
        ROW_NUMBER()OVER(PARTITION BY id ORDER BY salary DESC)AS ranked_emp
          FROM ms_employee_salary)
WHERE ranked_emp=1

