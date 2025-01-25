-- Create the passengers_per_airport temporary table, which contains  the total number of passengers departing from each airport.  Use the m_ticket_prices table; we are interested in the origin and the passengers attributes.

USE flights;

CREATE TEMPORARY TABLE passengers_per_airport AS
SELECT 
    origin,
    SUM(passengers) AS total_passengers
FROM 
    m_ticket_prices
GROUP BY 
    origin;
