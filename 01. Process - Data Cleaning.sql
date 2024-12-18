--Combining all 12 tables
SELECT * FROM 'data-analytics-capstone-437301.capstone.2309_september23'
UNION ALL
SELECT * FROM 'data-analytics-capstone-437301.capstone.2310_october23'
UNION ALL
SELECT * FROM 'data-analytics-capstone-437301.capstone.2311_november23'
UNION ALL
SELECT * FROM 'data-analytics-capstone-437301.capstone.2312_december23'
UNION ALL
SELECT * FROM 'data-analytics-capstone-437301.capstone.2401_january24'
UNION ALL
SELECT * FROM 'data-analytics-capstone-437301.capstone.2402_february24'
UNION ALL
SELECT * FROM 'data-analytics-capstone-437301.capstone.2403_march24'
UNION ALL
SELECT * FROM 'data-analytics-capstone-437301.capstone.2404_april24'
UNION ALL
SELECT * FROM 'data-analytics-capstone-437301.capstone.2405_may24'
UNION ALL
SELECT * FROM 'data-analytics-capstone-437301.capstone.2406_june24'
UNION ALL
SELECT * FROM 'data-analytics-capstone-437301.capstone.2407_july24'
UNION ALL
SELECT * FROM 'data-analytics-capstone-437301.capstone.2408_july24'
;

--Checking for NULL values in ride_id
SELECT COUNT(CASE WHEN ride_id IS NULL THEN 1 END) AS null_count,
  COUNT(ride_id) AS non_null_count
FROM 'data-analytics-capstone-437301.capstone.yearly_data'
;

--Checking for duplicate ride_id values
SELECT ride_id,
  COUNT(*) AS count_of_ride_id
FROM 'data-analytics-capstone-437301.capstone.yearly_data'
GROUP BY ride_id
HAVING count_of_ride_id > 1
;

--Displays all duplicates together, rank them to distinguish between them
SELECT *,
  COUNT(ride_id) OVER(PARTITION BY ride_id ORDER BY ride_id) AS ride_id_count,
  RANK() OVER(PARTITION BY ride_id ORDER BY ended_at) AS duplicate_rank
FROM 'data-analytics-capstone-437301.capstone.yearly_data'
ORDER BY ride_id_count DESC,
ride_id,
duplicate_rank
;

--Checking no ride_id values were duplicated more than once
SELECT *
FROM 'data-analytics-capstone-437301.capstone.yearly_data'
WHERE ride_id_count > 2
;

--Checking a random duplicate for verification
SELECT *
FROM 'data-analytics-capstone-437301.capstone.yearly_data'
WHERE ride_id LIKE "011C8EF97AB0F30D"
;

--Calculating ride length, column is stored as an INTERVAL
SELECT *,
  ended_at - started_at AS ride_length
FROM 'data-analytics-capstone-437301.capstone.yearly_data'
;

--Creating a column to determine which rides are 1 minute or shorter
SELECT *,
  CASE
    WHEN ride_length < INTERVAL 1 MINUTE THEN FALSE
    WHEN ride_length >= INTERVAL 1 MINUTE THEN TRUE
    ELSE NULL
  END AS greater_than_one_minute
FROM 'data-analytics-capstone-437301.capstone.yearly_data'
;

--Creating a column to determine the time of day
SELECT *,
  CASE
    WHEN EXTRACT(HOUR FROM started_at) BETWEEN 0 AND 5 THEN "Night"
    WHEN EXTRACT(HOUR FROM started_at) BETWEEN 6 AND 11 THEN "Morning"
    WHEN EXTRACT(HOUR FROM started_at) BETWEEN 12 AND 17 THEN "Afternoon"
    WHEN EXTRACT(HOUR FROM started_at) BETWEEN 18 AND 23 THEN "Evening"
    ELSE NULL
  END AS time_of_day
FROM 'data-analytics-capstone-437301.capstone.yearly_data'
;

--Creating a column to determine which day of week the ride occurred
SELECT *,
  CASE
    WHEN EXTRACT(DAYOFWEEK FROM started_at) = 1 THEN "Sunday"
    WHEN EXTRACT(DAYOFWEEK FROM started_at) = 2 THEN "Monday"
    WHEN EXTRACT(DAYOFWEEK FROM started_at) = 3 THEN "Tuesday"
    WHEN EXTRACT(DAYOFWEEK FROM started_at) = 4 THEN "Wednesday"
    WHEN EXTRACT(DAYOFWEEK FROM started_at) = 5 THEN "Thursday"
    WHEN EXTRACT(DAYOFWEEK FROM started_at) = 6 THEN "Friday"
    WHEN EXTRACT(DAYOFWEEK FROM started_at) = 7 THEN "Saturday"
    ELSE NULL
  END AS day_of_week
FROM 'data-analytics-capstone-437301.capstone.yearly_data'

--Creating the type of day column
SELECT *,
  CASE
    WHEN day_of_week IN ("Monday", "Tuesday", "Wednesday", "Thursday", "Friday") THEN "Weekday"
    WHEN day_of_week IN ("Sunday", "Saturday") THEN "Weekend"
    ELSE NULL
  END AS type_of_day
FROM 'data-analytics-capstone-437301.capstone.yearly_data'
;

--Creating a season column
SELECT *,
  CASE
    WHEN EXTRACT(MONTH FROM started_at) IN (12,1,2) THEN "Winter"
    WHEN EXTRACT(MONTH FROM started_at) BETWEEN 3 AND 5 THEN "Spring"
    WHEN EXTRACT(MONTH FROM started_at) BETWEEN 6 AND 8 THEN "Summer"
    WHEN EXTRACT(MONTH FROM started_at) BETWEEN 9 AND 11 THEN "Fall"
    ELSE NULL
  END AS season
FROM 'data-analytics-capstone-437301.capstone.yearly_data'
;

--Creating a new, cleaned table
SELECT *
FROM 'data-analytics-capstone-437301.capstone.yearly_data'
WHERE greater_than_one_minute = TRUE
AND duplicate_rank = 1
;
