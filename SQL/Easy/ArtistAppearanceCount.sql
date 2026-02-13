-- Title: Artist Appearance Count
-- Difficulty: Easy
--Question: Find how many times each artist appeared on the Spotify ranking list.
--           Output the artist name along with the corresponding number of occurrences.
--            Order records by the number of occurrences in descending order.
  
--First Solution
SELECT artist,
    COUNT(1) AS n_occurences
FROM spotify_worldwide_daily_song_ranking
GROUP BY artist
ORDER BY n_occurences DESC
  

--Second Solution
SELECT DISTINCT
        artist,
        (SELECT COUNT(1) AS Total FROM spotify_worldwide_daily_song_ranking d1
         WHERE d1.artist=d2.artist)
FROM spotify_worldwide_daily_song_ranking d2
ORDER BY Total DESC
