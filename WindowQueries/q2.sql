-- Setup: Create a temporary table InactiveOn, that shows the number of people that became inactive that day (using the LastUpdate attribute)

USE facebook;

CREATE TEMPORARY TABLE InactiveOn AS
SELECT LastUpdate, COUNT(*) AS NumberOfInactives
FROM Users
WHERE Status = 'Inactive'
GROUP BY LastUpdate;


