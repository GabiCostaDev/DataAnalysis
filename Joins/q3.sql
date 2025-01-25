-- List all the track names, the corresponding album name, and the corresponding artist name

USE music;
SELECT
   t.track_name,
   a.album_name,
   ar.artist_name      
FROM track t
INNER JOIN album a ON t.album_id = a.album_id
INNER JOIN artist ar ON a.artist_id = ar.artist_id
ORDER BY ar.artist_name, a.album_name, t.track_name;