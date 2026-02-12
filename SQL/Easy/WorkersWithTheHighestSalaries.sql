-- Title: Workers With The Highest Salaries
-- Difficulty: Easy
--Question: Management wants to analyze only employees with official job titles. Find the job titles of the employees with the highest salary.
--             If multiple employees have the same highest salary, include all their job titles.

--First Solution
SELECT tit.worker_title AS best_paid_title
FROM worker AS emp 
JOIN title AS tit ON emp.worker_id=tit.worker_ref_id
WHERE (emp.salary=(SELECT MAX(salary) FROM worker emp
    JOIN title AS tit ON emp.worker_id=tit.worker_ref_id))


--Second Solution 
WITH max_salary AS(
    SELECT MAX(salary) FROM worker emp
        JOIN title AS tit ON emp.worker_id=tit.worker_ref_id)
  
SELECT tit.worker_title AS best_paid_title
FROM worker AS emp 
JOIN title AS tit ON emp.worker_id=tit.worker_ref_id
WHERE emp.salary= (SELECT * FROM max_salary)
