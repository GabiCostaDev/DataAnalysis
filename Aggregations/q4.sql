-- For each artist, count the number of albums in the database. You only need to show the id of the artist, not the name of the artist.

USE music;
SELECT
      ar.artist_id,
      COUNT(a.album_id) AS cnt_albums
FROM artist ar
JOIN album a ON ar.artist_id = a.artist_id
GROUP BY ar.artist_id;