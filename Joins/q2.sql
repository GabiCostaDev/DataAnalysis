-- List the tracks for the album Second Coming

use music;
SELECT
   t.track_id,
   t.track_name,
   t.artist_id,
   t.album_id,
   t.time
FROM track t
JOIN
    album a ON t.album_id = a.album_id
WHERE
    a.album_name = 'Second Coming' AND t.artist_id = 5;