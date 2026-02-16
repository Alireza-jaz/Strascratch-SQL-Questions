-- Title: Highest Cost Orders
-- Difficulty: Medium
--Question: 
      /*Find the customers with the highest daily total order cost between 2019-02-01 and 2019-05-01. If a customer had more than one order on a certain day, 
        sum the order costs on a daily basis. Output each customer's first name, total cost of their items, and the date.
        If multiple customers tie for the highest daily total on the same date, return all of them.
        For simplicity, you can assume that every first name in the dataset is unique.*/

-- Solution
WITH total_daily_cost AS(
SELECT cust_id,order_date,SUM(total_order_cost) AS total_daily_sales FROM orders
WHERE order_date BETWEEN '2019-02-01' AND '2019-05-01'
GROUP BY cust_id,order_date
)
SELECT c.first_name,t.order_date,t.total_daily_sales AS total_cost_of_items
FROM(
    SELECT *,
    RANK()OVER(PARTITION BY order_date ORDER BY total_daily_sales DESC)  AS ranked_sales
    FROM total_daily_cost) AS t
LEFT JOIN customers AS c
ON c.id=t.cust_id
WHERE t.ranked_sales=1
ORDER BY t.order_date
