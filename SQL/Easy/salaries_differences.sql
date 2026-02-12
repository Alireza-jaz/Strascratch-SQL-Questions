-- Title: Salaries Differences
-- Difficulty: Easy
--Question: Calculates the difference between the highest salaries in the marketing and engineering departments. Output just the absolute difference in salaries.

--First Solution
SELECT ABS(
        (SELECT MAX(salary) FROM db_employee e JOIN db_dept d ON e.department_id = d.id WHERE d.department = 'marketing') - 
        (SELECT MAX(salary) FROM db_employee e JOIN db_dept d ON e.department_id = d.id WHERE d.department = 'engineering')
    ) AS salary_difference;


--Second Solution
SELECT ABS(
    (SELECT MAX(salary) FROM db_employee e LEFT JOIN db_dept d ON e.department_id=d.id WHERE d.department='marketing')-
    (SELECT MAX(salary) FROM db_employee e LEFT JOIN db_dept d ON e.department_id=d.id WHERE d.department='engineering'))
