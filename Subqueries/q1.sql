-- As a first step, limit your analysis only to first names that do not include a dot "." or parentheses (i.e, ignore "A.", "J.B.", "Alfred (I)" etc); also only consider first names that appear at least 50 times in the actors table (across both genders; ie., a name that appears in 35 males and 20 females qualifies as eligible). Create a temporary table with the results, called "eligible_names". (This table is used in later questions)

use imdb;
CREATE TEMPORARY TABLE eligible_names AS
SELECT
   first_name,
   COUNT(*) AS name_count
FROM actors
WHERE first_name NOT LIKE '%.%'
AND first_name NOT LIKE '%(%'
GROUP BY first_name
HAVING name_count >= 50;