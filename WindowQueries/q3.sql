-- SingUpsAsOf: Using the SignUpsOn table, calculate the total number of users signed up for Facebook up to each date listed in the MemberSince column. (In other words, calculate the cumulative sum of users from the SignUpsOn table.) Use a SUM() function together with a window specification.

USE facebook;

SELECT 
    MemberSince,
    SUM(NumberOfSignUps) OVER (ORDER BY MemberSince) AS TotalSignUpsAsOf
FROM 
    SignUpsOn;

