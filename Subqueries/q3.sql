-- Find the eligible names that appear only for female actors but for no male actresses, and report the corresponding frequencies.

use imdb;
SELECT e.first_name, COUNT(a.id) AS frequency
FROM eligible_names e
JOIN actors a ON e.first_name = a.first_name
WHERE a.gender = 'F'
AND e.first_name NOT IN (
   SELECT first_name
   FROM actors
   WHERE gender = 'M'
)
GROUP BY e.first_name;