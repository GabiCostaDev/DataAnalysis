-- Show the name of the artist and the number of albums for each artist in the database. Name the column that shows the number of albums as num_albums.

USE music;
SELECT
   artist.artist_id,
   artist_name,
   COUNT(*) AS num_albums
FROM artist
JOIN album ON artist.artist_id = album.artist_id
GROUP BY artist.artist_id, artist_name;