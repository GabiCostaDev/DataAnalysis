-- Using the passengers_per_airport table from the previous question, calculate each airport's national rank and state rank in terms of departing passengers. The m_airports table contains the state of each airport. (Note: The number 1 airport nationally will have the most passengers nationwide, while the number 1 per state will have the most passengers within the state.)

USE flights;

CREATE TEMPORARY TABLE airport_passenger_data AS
SELECT 
    p.origin,
    p.total_passengers,
    a.state
FROM 
    passengers_per_airport p
JOIN 
    m_airports a ON p.origin = a.airport_code;

CREATE TEMPORARY TABLE national_rank AS
SELECT 
    origin,
    total_passengers,
    state,
    RANK() OVER (ORDER BY total_passengers DESC) AS national_rank
FROM 
    airport_passenger_data;

CREATE TEMPORARY TABLE state_rank AS
SELECT 
    origin,
    total_passengers,
    state,
    national_rank,
    RANK() OVER (PARTITION BY state ORDER BY total_passengers DESC) AS state_rank
FROM 
    national_rank;

SELECT 
    origin,
    total_passengers,
    state,
    national_rank,
    state_rank
FROM 
    state_rank
ORDER BY 
    national_rank, state_rank;
