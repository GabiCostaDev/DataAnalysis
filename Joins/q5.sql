-- The table tracks_played contains the tracks the users listened to and the time they listened to the songs. For every track listed in the tracks_played table, show the user's first and last name, the user id, the album name, the track name, and the date/time it was played.

USE music;
SELECT users.first_name, users.last_name, users.user_id, album.album_name, track.track_name, tracks_played.played_on
FROM tracks_played
JOIN users ON tracks_played.user_id = users.user_id
JOIN track ON tracks_played.track_id = track.track_id
JOIN album ON track.album_id = album.album_id;