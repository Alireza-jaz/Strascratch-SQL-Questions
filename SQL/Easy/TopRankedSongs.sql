-- Title: Top Ranked Songs
-- Difficulty: Easy
--Question: Find songs that have ranked in the top position. Output the track name and the number of times it ranked at the top. 
--            Sort your records by the number of times the song was in the top position in descending order.


--First Solution
WITH data AS(SELECT * 
FROM spotify_worldwide_daily_song_ranking
WHERE position=1)
  
SELECT DISTINCT trackname,
       COUNT(1)OVER (PARTITION BY trackname) As total
FROM data
ORDER BY total DESC


  
--Second Solution
SELECT  trackname,
       COUNT(1) As total
FROM spotify_worldwide_daily_song_ranking
WHERE position=1
GROUP BY trackname
ORDER BY total DESC
