-- For eligible names that appear for both males and females, report the names and the frequencies for males and females. Rank the most ambiguous names on top. We consider as most ambiguous names the ones where the formula log( male_freq / female_freq ) is close to 0. Remember that the log can be positive and negative; ranking by absolute value (using the ABS() function) will allow you to rank the smallest numbers first.

USE imdb;

WITH gender_counts AS (
   SELECT e.first_name,
          SUM(CASE WHEN gender = 'M' THEN 1 ELSE 0 END) AS male_freq,
          SUM(CASE WHEN gender = 'F' THEN 1 ELSE 0 END) AS female_freq
   FROM eligible_names e
   JOIN actors a ON e.first_name = a.first_name
   GROUP BY first_name
   HAVING male_freq > 0 AND female_freq > 0
),
ranked_names AS (
   SELECT first_name, male_freq, female_freq,
          ABS(LOG(male_freq / female_freq)) AS ambiguity_score
   FROM gender_counts
)

SELECT first_name, male_freq, female_freq, ambiguity_score
FROM ranked_names
ORDER BY ambiguity_score ASC;