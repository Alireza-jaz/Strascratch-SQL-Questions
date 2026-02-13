-- Title: Workers by Department Since April
-- Difficulty: Easy
--Question: Find the number of workers by department who joined on or after April 1, 2014.
--           Output the department name along with the corresponding number of workers.
--            Sort the results based on the number of workers in descending order.
  
--First Solution
SELECT department
      ,COUNT(1) AS total
FROM worker
WHERE joining_date>='2014-04-01'
GROUP BY department
ORDER BY total DESC

--Second Solution
With updated As(SELECT *
FROM worker
WHERE joining_date>='2014-04-01'
)
SELECT department ,count(*) AS num
FROM updated
GROUP BY department
ORDER BY num DESC
