-- Title: Order Details
-- Difficulty: Easy
--Question: Find order details made by Jill and Eva.
--           Consider the Jill and Eva as first names of customers.
--            Output the order date, details and cost along with the first name.
--             Order records based on the customer id in ascending order.
  
--First Solution
SELECT c.first_name,
       o.order_date,
       o.order_details,
       o.total_order_cost 
from customers c
LEft join orders as o
on o.cust_id=c.id
WHERE c.first_name In('Eva','Jill')     --  WHERE c.first_name LIKE '%Jill%' OR c.first_name LIKE '%Eva%'





