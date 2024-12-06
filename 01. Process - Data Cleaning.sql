-- Combining all 12 tables:
SELECT * FROM data-analytics-capstone-437301.capstone.2309_september23
UNION ALL
SELECT * FROM data-analytics-capstone-437301.capstone.2310_october23
UNION ALL
SELECT * FROM data-analytics-capstone-437301.capstone.2311_november23
UNION ALL
SELECT * FROM data-analytics-capstone-437301.capstone.2312_december23
UNION ALL
SELECT * FROM data-analytics-capstone-437301.capstone.2401_january24
UNION ALL
SELECT * FROM data-analytics-capstone-437301.capstone.2402_february24
UNION ALL
SELECT * FROM data-analytics-capstone-437301.capstone.2403_march24
UNION ALL
SELECT * FROM data-analytics-capstone-437301.capstone.2404_april24
UNION ALL
SELECT * FROM data-analytics-capstone-437301.capstone.2405_may24
UNION ALL
SELECT * FROM data-analytics-capstone-437301.capstone.2406_june24
UNION ALL
SELECT * FROM data-analytics-capstone-437301.capstone.2407_july24
UNION ALL
SELECT * FROM data-analytics-capstone-437301.capstone.2408_july24
;

--Ensuring there are no NULL values in ride_id
SELECT COUNT(CASE WHEN ride_id IS NULL THEN 1 END) AS null_count,
  COUNT(ride_id) AS non_null_count
FROM data-analytics-capstone-437301.capstone.yearly_data

--Making sure there are no duplicates
/* SELECT a.*,
  a.ride_id,
  B.COUNT_OF_RIDEID
FROM data-analytics-capstone-437301.capstone.yearly_data AS A
JOIN (
  SELECT ride_id, 
  COUNT(ride_id) AS COUNT_OF_RIDEID
  FROM data-analytics-capstone-437301.capstone.yearly_data
  GROUP BY ride_id
  HAVING COUNT_OF_RIDEID > 1) AS B
ON A.ride_id = B.ride_id
ORDER BY a.ride_id

No need for the join, to simply check the following code suffices:*/
SELECT ride_id, 
  COUNT(*) AS count_of_ride_id
FROM data-analytics-capstone-437301.capstone.yearly_data
GROUP BY ride_id
HAVING count_of_ride_id > 1 

-- Displays all duplicates together, ranks them to distinguish between them, overwrote table
SELECT *,
       COUNT(ride_id) OVER(PARTITION BY ride_id ORDER BY ride_id) AS ride_id_count,
       RANK() OVER(PARTITION BY ride_id ORDER BY ended_at) AS duplicate_rank
FROM data-analytics-capstone-437301.capstone.yearly_data
ORDER BY ride_id_count DESC, ride_id, duplicate_rank

--Checking that there are no ride_id values were duplicated more than once
SELECT *
FROM data-analytics-capstone-437301.capstone.yearly_data
WHERE ride_id_count > 2

--Checking a random duplicate
SELECT *
FROM data-analytics-capstone-437301.capstone.yearly_data
WHERE ride_id LIKE "011C8EF97AB0F30D"

-- calculating ride length, column is stored as an INTERVAL
SELECT *,
  ended_at - started_at AS ride_length
FROM `data-analytics-capstone-437301.capstone.yearly_data`

--Converting time zone to Chicago Time, storing column as a DATETIME so I can extract the day of week
SELECT *,
  DATETIME(started_at, 'America/Chicago') AS started_at_converted
FROM `data-analytics-capstone-437301.capstone.yearly_data`

--Checking for Daylight Savings time
SELECT started_at,
  DATETIME(started_at, 'America/Chicago') AS started_at_converted
FROM `data-analytics-capstone-437301.capstone.yearly_data`
WHERE EXTRACT(MONTH FROM started_at AT TIME ZONE 'America/Chicago') = 3
  AND EXTRACT(DAY FROM started_at AT TIME ZONE 'America/Chicago') = 10
  AND EXTRACT(HOUR FROM started_at AT TIME ZONE 'America/Chicago') BETWEEN 1 AND 3
ORDER BY started_at_converted

--Adding to TABLE
SELECT *,
  DATETIME(started_at, 'America/Chicago') AS started_at_converted
FROM `data-analytics-capstone-437301.capstone.yearly_data`

-- Determining day of week the ride took place
SELECT *,
  CASE 
    WHEN EXTRACT(DAYOFWEEK FROM started_at_converted) = 1 THEN "Sunday"
    WHEN EXTRACT(DAYOFWEEK FROM started_at_converted) = 2 THEN "Monday"
    WHEN EXTRACT(DAYOFWEEK FROM started_at_converted) = 3 THEN "Tuesday"
    WHEN EXTRACT(DAYOFWEEK FROM started_at_converted) = 4 THEN "Wednesday"
    WHEN EXTRACT(DAYOFWEEK FROM started_at_converted) = 5 THEN "Thursday"
    WHEN EXTRACT(DAYOFWEEK FROM started_at_converted) = 6 THEN "Friday"
    WHEN EXTRACT(DAYOFWEEK FROM started_at_converted) = 7 THEN "Saturday"
    ELSE NULL 
  END AS day_of_week
FROM `data-analytics-capstone-437301.capstone.yearly_data`

--Determining which rides are 1 minute or longer
SELECT *,
  CASE
    WHEN ride_length < INTERVAL 1 MINUTE THEN FALSE
    WHEN ride_length >= INTERVAL 1 MINUTE THEN TRUE
    ELSE NULL
  END AS greater_than_1_minute
FROM `data-analytics-capstone-437301.capstone.yearly_data`



--ANALYZE

--Mean of ride_length
SELECT AVG(ride_length) AS mean_ride_length
FROM data-analytics-capstone-437301.capstone.yearly_data_cleaned

--Max of ride_ength
SELECT MAX(ride_length) AS max_ride_length
FROM data-analytics-capstone-437301.capstone.yearly_data_cleaned

--Mode of weekday
SELECT day_of_week,
  COUNT(*) AS number_of_trips
FROM data-analytics-capstone-437301.capstone.yearly_data_cleaned
GROUP BY day_of_week
ORDER BY number_of_trips DESC
--LIMIT 1

--Average ride length by membership type
SELECT AVG(ride_length) AS avg_ride_length,
  member_casual
FROM data-analytics-capstone-437301.capstone.yearly_data_cleaned
GROUP BY member_casual

--Average ride length by rideable type
SELECT AVG(ride_length) AS avg_ride_length,
  rideable_type
FROM data-analytics-capstone-437301.capstone.yearly_data_cleaned
GROUP BY rideable_type

--Average ride length by day of week
SELECT AVG(ride_length) AS avg_ride_length,
  day_of_week
FROM data-analytics-capstone-437301.capstone.yearly_data_cleaned
GROUP BY day_of_week

--Count of trips by day of week
SELECT COUNT(ride_id) AS trip_count,
  day_of_week
FROM data-analytics-capstone-437301.capstone.yearly_data_cleaned
GROUP BY day_of_week

--Count of trips by rideable type & member type
SELECT COUNT(ride_id) AS trip_count,
  rideable_type,
  member_casual
FROM data-analytics-capstone-437301.capstone.yearly_data_cleaned
GROUP BY rideable_type, member_casual
ORDER BY rideable_type, member_casual

--Average ride length by rideable type & member type
SELECT AVG(ride_length) AS avg_trip_length,
  rideable_type,
  member_casual
FROM data-analytics-capstone-437301.capstone.yearly_data_cleaned
GROUP BY rideable_type, member_casual
ORDER BY rideable_type, member_casual

--Count of trips by month and season
SELECT COUNT(ride_id) AS trip_count, 
  EXTRACT (MONTH FROM started_at_converted) AS month,
  CASE 
    WHEN EXTRACT(MONTH FROM started_at_converted) IN(12,1,2) THEN 'Winter'
    WHEN EXTRACT(MONTH FROM started_at_converted) IN(3,4,5) THEN 'Spring'
    WHEN EXTRACT(MONTH FROM started_at_converted) IN(6,7,8) THEN 'Summer'
    WHEN EXTRACT(MONTH FROM started_at_converted) IN(9,10,11) THEN 'Autumn'
    ELSE 'Other'
  END AS season
FROM data-analytics-capstone-437301.capstone.yearly_data_cleaned
GROUP BY month, season
ORDER BY month

--Count of trips by hour
SELECT COUNT(ride_id) AS trip_count, 
  EXTRACT(HOUR FROM started_at_converted) AS hour
FROM data-analytics-capstone-437301.capstone.yearly_data_cleaned
GROUP BY hour
ORDER BY hour
