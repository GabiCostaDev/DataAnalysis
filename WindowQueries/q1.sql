-- Setup: Create a temporary table SignUpsOn, that shows the number of people that signed up on that day (using the MemberSince attribute)

USE facebook;

CREATE TEMPORARY TABLE SignUpsOn AS
SELECT MemberSince, COUNT(*) AS NumberOfSignUps
FROM Users
GROUP BY MemberSince;


