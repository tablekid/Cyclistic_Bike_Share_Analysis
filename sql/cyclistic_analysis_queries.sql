-- Cyclistic Bike Share Analysis
-- SQL Queries Used in Case Study
-- Author: Noah Irby
-- Tools: Google BigQuery

-- This file contains the SQL queries used to analyze
-- behavioral differences between Cyclistic members
-- and casual riders.

--------------------------------------------------
-- Average Ride Time by Rider Type (March 2025 - February 2026)
--------------------------------------------------
SELECT
  member_casual,
  AVG(ride_length) AS avg_ride_seconds
FROM casestudy-489502.cyclingdata.all_trips
GROUP BY member_casual;
--------------------------------------------------
-- Rides per Weekday by Rider Type (March 2025 - February 2026)
--------------------------------------------------
SELECT
  day_of_week,
  member_casual,
  COUNT(*) AS rides
FROM casestudy-489502.cyclingdata.all_trips
GROUP BY
  day_of_week,
  member_casual
ORDER BY
  day_of_week;
--------------------------------------------------
-- Hourly Rides by Rider Type (March 2025 - February 2026)
--------------------------------------------------
SELECT
  EXTRACT(HOUR FROM started_at) AS hour,
  member_casual,
  COUNT(*) AS rides
FROM casestudy-489502.cyclingdata.all_trips
GROUP BY
  hour,
  member_casual
ORDER BY
  hour;
--------------------------------------------------
-- Total Rides by Bike Type(and Rider Type) (March 2025 - February 2026)
--------------------------------------------------
SELECT
  rideable_type,
  member_casual,
  COUNT(*) AS rides
FROM casestudy-489502.cyclingdata.all_trips
GROUP BY
  rideable_type,
  member_casual
ORDER BY
  rides DESC;
