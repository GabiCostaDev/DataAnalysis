-- Find the eligible names that appear only for male actors but for no female actresses, and report the corresponding frequencies.

use imdb;
SELECT e.first_name, COUNT(a.id) AS frequency
FROM eligible_names e
JOIN actors a ON e.first_name = a.first_name
WHERE a.gender = 'M'
AND e.first_name NOT IN (
   SELECT first_name
   FROM actors
   WHERE gender = 'F'
)
GROUP BY e.first_name;