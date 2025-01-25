-- For every date listed in the tracked_played table, show the artist's name, the artist id, the number of users that listened to the artist, and the total amount of time users listened to the artist. Assume that each track is played fully.

USE music;
SELECT
 tp.played_on AS date_played,
 ar.artist_id,
 ar.artist_name,
 COUNT(DISTINCT tp.user_id) AS users,
 SUM(t.time) AS total_time,
 COUNT(tp.track_id) AS total_tracks
FROM tracks_played tp
JOIN track t ON tp.track_id = t.track_id
JOIN artist ar ON tp.artist_id = ar.artist_id
GROUP BY
 tp.played_on, ar.artist_id, ar.artist_name
ORDER BY
 tp.played_on, ar.artist_name;