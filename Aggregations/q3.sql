-- Show the average and standard deviation of the track length

USE music;
SELECT
      AVG(time) AS avg_time,
      STDDEV(time) AS std_time
FROM track;