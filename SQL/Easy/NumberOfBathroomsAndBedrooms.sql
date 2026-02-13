-- Title: Number Of Bathrooms And Bedrooms
-- Difficulty: Easy
--Question: Find the average number of bathrooms and bedrooms for each city’s property types. Output the result along with the city name and the property type.

--First Solution
SELECT city
       ,property_type,
       AVG(bathrooms) AS n_bathrooms_avg
       ,AVG(bedrooms) AS n_bedrooms_avg
FROM airbnb_search_details
GROUP BY city
        ,property_type

