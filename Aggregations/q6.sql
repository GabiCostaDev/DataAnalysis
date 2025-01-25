-- List the IDs of the albums, where the total album length (across all the album's tracks) is longer than 60 minutes.

USE music;
SELECT
 a.album_id,
 a.album_name
FROM album a
JOIN track t ON a.album_id = t.album_id
GROUP BY
 a.album_id, a.album_name
HAVING SUM(t.time) > 60;