-- Title: Most Profitable Financial Company
-- Difficulty: Easy
--Question: Find the most profitable company from the financial sector. Output the result along with the continent.



--First Solution
SELECT company
       ,continent
FROM forbes_global_2010_2014
WHERE sector='financial' AND
profits=(SELECT MAX(profits) FROM forbes_global_2010_2014)

