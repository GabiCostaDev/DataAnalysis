-- For every user, show the total tracks they played and the total amount of time they listened. Assume that each track is played fully. List also the users that have not played any track

USE music;
SELECT u.user_id,
      COUNT(tp.track_id) AS tracks_played,
      SUM(t.time) AS total_time
FROM users u
LEFT JOIN tracks_played tp ON u.user_id = tp.user_id
LEFT JOIN track t ON tp.track_id = t.track_id
GROUP BY u.user_id;