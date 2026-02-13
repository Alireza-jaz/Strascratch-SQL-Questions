-- Title: Average Salaries
-- Difficulty: Easy
--Question: Compare each employee's salary with the average salary of the corresponding department.
--            Output the department, first name, and salary of employees along with the average salary of that department.

--First Solution
SELECT department,
        first_name,
        salary,
        AVG(salary) OVER (PARTITION BY department) AS avg_salary
FROM employee;

  
--Second Solution 
SELECT e.department,
       e.first_name,
       e.salary,
       d.avg_salary
FROM employee e
LEFT JOIN (SELECT AVG(salary) AS avg_salary,department FROM employee
    GROUP BY department) AS d
ON d.department=e.department

  
--Third Solution
WITH department_salary_average AS(
    SELECT AVG(salary) AS avg_salary,department FROM employee
    GROUP BY department)
SELECT e.department,
       e.first_name,
       e.salary,
       d.avg_salary
FROM employee e
LEFT JOIN department_salary_average d
ON d.department=e.department



