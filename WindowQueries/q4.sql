-- InactiveAsOf: Using the InactiveOn table, calculate the total number of users who are inactive as of a given date (again,  up to each date in the MemberSince. Use a SUM() function together with a window specification.

USE facebook;

SELECT 
    LastUpdate,
    SUM(NumberOfInactives) OVER (ORDER BY LastUpdate) AS TotalInactivesAsOf
FROM 
    InactiveOn;
