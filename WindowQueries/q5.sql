-- Using the SingUpsAsOf and InactiveAsOf, calculate the total_active users for each date. We define total active users as the total signups up to that date, minus the total users that have been inactive up to that date.

USE facebook;

WITH SignUpsAsOf AS (
    SELECT 
        MemberSince,
        SUM(NumberOfSignUps) OVER (ORDER BY MemberSince) AS TotalSignUpsAsOf
    FROM 
        SignUpsOn
),
InactiveAsOf AS (
    SELECT 
        LastUpdate,
        SUM(NumberOfInactives) OVER (ORDER BY LastUpdate) AS TotalInactivesAsOf
    FROM 
        InactiveOn
)
SELECT 
    s.MemberSince AS Date,
    s.TotalSignUpsAsOf - COALESCE(i.TotalInactivesAsOf, 0) AS TotalActiveUsers
FROM 
    SignUpsAsOf s
LEFT JOIN 
    InactiveAsOf i 
ON 
    s.MemberSince = i.LastUpdate
ORDER BY 
    s.MemberSince;
