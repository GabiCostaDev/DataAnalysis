-- List all the album names by the band New Order

use music;
SELECT
   *
FROM album a
JOIN
   artist ar ON a.artist_id = ar.artist_id
WHERE
   ar.artist_name = 'New Order';