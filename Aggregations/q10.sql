-- Show the name of each track and the first and last time it was played. Include tracks that were not played at all. 

USE music;
SELECT
   t.artist_id,
   t.album_id,
   t.track_id,
   t.track_name,
   MIN(tp.played_on) AS min_played_on,
   MAX(tp.played_on) AS max_played_on
FROM track t
LEFT JOIN tracks_played tp ON t.track_id = tp.track_id
GROUP BY
   t.artist_id, t.album_id, t.track_id, t.track_name;