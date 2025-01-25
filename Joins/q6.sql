-- List the first and last names of the users that have not listened to any tracks.

USE music;
SELECT u.first_name, u.last_name
FROM users u
LEFT JOIN tracks_played tp ON u.user_id = tp.user_id
WHERE tp.track_id IS NULL;