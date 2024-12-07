--Total trips
SELECT COUNT(*) AS trip_count
FROM 'data-analytics-capstone-437301.capstone.yearly_data_cleaned'
;
--Average trip length
SELECT AVG(ride_length) AS average_trip_length
FROM 'data-analytics-capstone-437301.capstone.yearly_data_cleaned'
;
--Trip count by member type
SELECT member_casual,
  COUNT(*) AS trip_count
FROM 'data-analytics-capstone-437301.capstone.yearly_data_cleaned'
GROUP BY member_casual
ORDER BY trip_count DESC
;
--Trip count by rideable type
SELECT rideable_type,
  COUNT(*) AS trip_count
FROM 'data-analytics-capstone-437301.capstone.yearly_data_cleaned'
GROUP BY rideable_type
ORDER BY trip_count DESC
;
--Trip count by member type and rideable type
SELECT member_casual,
  rideable_type,
  COUNT(*) AS trip_count
FROM 'data-analytics-capstone-437301.capstone.yearly_data_cleaned'
GROUP BY member_casual,
  rideable_type
ORDER BY trip_count DESC
;
--Ride length by member type
SELECT member_casual,
  AVG(ride_length_in_minutes) AS average_ride_length
FROM 'data-analytics-capstone-437301.capstone.yearly_data_cleaned'
GROUP BY member_casual
;
--Ride length by bike type
SELECT rideable_type,
  AVG(ride_length_in_minutes) AS average_ride_length
FROM 'data-analytics-capstone-437301.capstone.yearly_data_cleaned'
GROUP BY rideable_type
;
--Ride length by member type and bike type
SELECT member_casual
  rideable_type,
  AVG(ride_length_in_minutes) AS average_ride_length
FROM 'data-analytics-capstone-437301.capstone.yearly_data_cleaned'
GROUP BY member_casual,
  rideable_type
;
--Trip count by hour
SELECT EXTRACT(HOUR FROM started_at) AS hour,
  COUNT(*) AS trip_count
FROM 'data-analytics-capstone-437301.capstone.yearly_data_cleaned'
GROUP BY hour
ORDER BY trip_count DESC
;
--Trip count by hour and member type
SELECT EXTRACT(HOUR FROM started_at) AS hour,
  member_casual,
  COUNT(*) AS trip_count
FROM 'data-analytics-capstone-437301.capstone.yearly_data_cleaned'
GROUP BY hour,
  member_casual
ORDER BY hour,
  member_casual
;
--Average ride length by hour
SELECT EXTRACT(HOUR FROM started_at) AS hour,
  AVG(ride_length_in_minutes) AS average_ride_length
FROM 'data-analytics-capstone-437301.capstone.yearly_data_cleaned'
GROUP BY hour
ORDER BY hour
;
--Average ride length by hour and member type
SELECT EXTRACT(HOUR FROM started_at) AS hour,
  member_casual,
  AVG(ride_length_in_minutes) AS average_ride_length
FROM 'data-analytics-capstone-437301.capstone.yearly_data_cleaned'
GROUP BY hour,
  member_casual
ORDER BY hour,
  member_casual
;
--Trip count by time of day
SELECT time_of_day,
  COUNT(*) AS trip_count
FROM 'data-analytics-capstone-437301.capstone.yearly_data_cleaned'
GROUP BY time_of_day
ORDER BY trip_count DESC
;
--Trip count by time of day and member type
SELECT time_of_day,
  member_casual,
  COUNT(*) AS trip_count
FROM 'data-analytics-capstone-437301.capstone.yearly_data_cleaned'
GROUP BY time_of_day,
  member_casual
ORDER BY time_of_day,
  member_casual
;
--Average ride length by time of day
SELECT time_of_day,
  AVG(ride_length_in_minutes) AS average_ride_length
FROM 'data-analytics-capstone-437301.capstone.yearly_data_cleaned'
GROUP BY time_of_day
ORDER BY time_of_day
;
--Average ride length by time of day and member type
SELECT time_of_day,
  member_casual,
  AVG(ride_length_in_minutes) AS average_ride_length
FROM 'data-analytics-capstone-437301.capstone.yearly_data_cleaned'
GROUP BY time_of_day,
  member_casual
ORDER BY time_of_day,
  member_casual
;
--Trip count by day
SELECT day_of_week,
  COUNT(*) AS trip_count
FROM 'data-analytics-capstone-437301.capstone.yearly_data_cleaned'
GROUP BY day_of_week
ORDER BY trip_count DESC
;
--Trip count by day and member type
SELECT day_of_week,
  member_casual,
  COUNT(*) AS trip_count
FROM 'data-analytics-capstone-437301.capstone.yearly_data_cleaned'
GROUP BY day_of_week,
  member_casual
ORDER BY day_of_week,
  member_casual
;
--Average ride length by day
SELECT day_of_week,
  AVG(ride_length_in_minutes) AS average_ride_length
FROM 'data-analytics-capstone-437301.capstone.yearly_data_cleaned'
GROUP BY day_of_week
ORDER BY day_of_week
;
--Average ride length by day and member type
SELECT day_of_week,
  member_casual,
  AVG(ride_length_in_minutes) AS average_ride_length
FROM 'data-analytics-capstone-437301.capstone.yearly_data_cleaned'
GROUP BY day_of_week,
  member_casual
ORDER BY day_of_week,
  member_casual
;
--Trip count by type of day
SELECT type_of_day,
  COUNT(*) AS trip_count
FROM 'data-analytics-capstone-437301.capstone.yearly_data_cleaned'
GROUP BY type_of_day
ORDER BY trip_count DESC
;
--Trip count by type of day and member type
SELECT type_of_day,
  member_casual,
  COUNT(*) AS trip_count
FROM 'data-analytics-capstone-437301.capstone.yearly_data_cleaned'
GROUP BY type_of_day,
  member_casual
ORDER BY type_of_day,
  member_casual
;
--Average ride length by type of day
SELECT type_of_day,
  AVG(ride_length_in_minutes) AS average_ride_length
FROM 'data-analytics-capstone-437301.capstone.yearly_data_cleaned'
GROUP BY type_of_day
ORDER BY type_of_day
;
--Average ride length by type of day and member type
SELECT type_of_day,
  member_casual,
  AVG(ride_length_in_minutes) AS average_ride_length
FROM 'data-analytics-capstone-437301.capstone.yearly_data_cleaned'
GROUP BY type_of_day,
  member_casual
ORDER BY type_of_day,
  member_casual
;
--Trip count by month
SELECT EXTRACT(MONTH FROM started_at) AS month,
  COUNT(*) AS trip_count
FROM 'data-analytics-capstone-437301.capstone.yearly_data_cleaned'
GROUP BY month
ORDER BY trip_count DESC
;
--Trip count by month and member type
SELECT EXTRACT(MONTH FROM started_at) AS month,
  member_casual,
  COUNT(*) AS trip_count
FROM 'data-analytics-capstone-437301.capstone.yearly_data_cleaned'
GROUP BY month,
  member_casual
ORDER BY month,
  member_casual
;
--Average ride length by month
SELECT EXTRACT(MONTH FROM started_at) AS month,
  AVG(ride_length_in_minutes) AS average_ride_length
FROM 'data-analytics-capstone-437301.capstone.yearly_data_cleaned'
GROUP BY month
ORDER BY month
;
--Average ride length by month and member type
SELECT EXTRACT(HOUR FROM started_at) AS month,
  member_casual,
  AVG(ride_length_in_minutes) AS average_ride_length
FROM 'data-analytics-capstone-437301.capstone.yearly_data_cleaned'
GROUP BY month,
  member_casual
ORDER BY month,
  member_casual
;
--Trip count by season
SELECT season,
  COUNT(*) AS trip_count
FROM 'data-analytics-capstone-437301.capstone.yearly_data_cleaned'
GROUP BY season
ORDER BY trip_count DESC
;
--Trip count by season and member type
SELECT season,
  member_casual,
  COUNT(*) AS trip_count
FROM 'data-analytics-capstone-437301.capstone.yearly_data_cleaned'
GROUP BY season,
  member_casual
ORDER BY season,
  member_casual
;
--Average ride length by season
SELECT season,
  AVG(ride_length_in_minutes) AS average_ride_length
FROM 'data-analytics-capstone-437301.capstone.yearly_data_cleaned'
GROUP BY season
ORDER BY season
;
--Average ride length by season and member type
SELECT season,
  member_casual,
  AVG(ride_length_in_minutes) AS average_ride_length
FROM 'data-analytics-capstone-437301.capstone.yearly_data_cleaned'
GROUP BY season,
  member_casual
ORDER BY season,
  member_casual
;
--Most frequent starting stations
SELECT start_station_name,
  start_station_id,
  COUNT(*) AS trip_count
FROM 'data-analytics-capstone-437301.capstone.yearly_data_cleaned'
GROUP BY start_station_name,
  start_station_id
HAVING trip_count >= 1000
ORDER BY trip_count DESC
;
--Most frequent ending stations
SELECT end_station_name,
  end_station_id,
  COUNT(*) AS trip_count
FROM 'data-analytics-capstone-437301.capstone.yearly_data_cleaned'
GROUP BY end_station_name,
  end_station_id
HAVING trip_count >= 1000
ORDER BY trip_count DESC
;
--Most frequent trips
SELECT start_station_name,
  start_station_id,
  end_station_name,
  end_station_id,
  COUNT(*) AS trip_count
FROM 'data-analytics-capstone-437301.capstone.yearly_data_cleaned'
GROUP BY start_station_name,
  start_station_id,
  end_station_name,
  end_station_id
HAVING trip_count >= 1000
ORDER BY trip_count DESC
;
