-- List all the tracks by the artist The Stone Roses and rank them by time length, from shortest to longest

USE music;
SELECT
   track_id,
   track_name,
   artist_id,
   album_id,
   time
FROM track
JOIN artist ON track.artist_id = artist.artist_id
WHERE artist_name = 'The Stone Roses'
ORDER BY time ASC;