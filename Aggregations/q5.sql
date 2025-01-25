-- For each album, count the number of tracks for that album and the total length of all the tracks in the album. You only need to show the primary key of the album, not its name.

USE music;
SELECT a.album_id,
      COUNT(t.track_id) AS track_count,
      SUM(t.time) AS total_time
FROM album a
JOIN track t ON a.album_id = t.album_id
GROUP BY a.album_id;