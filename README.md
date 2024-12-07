# Introduction
This case study is the capstone project for the Google Data Analytics Certificate. It will focus on Cyclistic, a fictional bike-share company in Chicago, and I will act as a junior data analyst helping to solve a business problem. I will be following the data analysis steps outlined in the certificate: Ask, Prepare, Process, Analyze, Share, and Act. The overarching question to explore is: **How do casual users and members use Cyclistic bikes differently?**

**Tools used:** BigQuery, SQL, Tableau, Figma

## Quick Links
[Tableau Report](https://public.tableau.com/views/CyclisticPresentationDashboard/CyclisticPresentation?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link) | [Data Cleaning SQL Queries](https://github.com/cavalierej/cyclistic-case-study/blob/0773ed3e7df8b406ab9613e8739beba83cc525c2/01.%20Process%20-%20Data%20Cleaning.sql)

# Background
## Cyclistic
Cyclistic is a bike-share program that features more than 5,800 bicycles and 600 docking stations. Cyclistic sets itself apart by also offering reclining bikes, hand tricycles, and cargo bikes, making bike-share more inclusive to people with disabilities and riders who can’t use a standard two-wheeled bike. The bikes can be unlocked from one station and returned to any other station in the system anytime. Most riders opt for traditional bikes; about 8% of riders use the assistive options. Cyclistic users are more likely to ride for leisure, but about 30% use the bikes to commute to work each day.

Until now, Cyclistic’s marketing strategy relied on building general awareness and appealing to broad consumer segments. One approach that helped make these things possible was the flexibility of its pricing plans: single-ride passes, full-day passes, and annual memberships. Customers who purchase single-ride or full-day passes are referred to as casual riders. Customers who purchase annual memberships are Cyclistic members. 

Cyclistic’s finance analysts have concluded that annual members are much more profitable than casual riders. Although the pricing flexibility helps Cyclistic attract more customers, Moreno (the director of marketing) believes that maximizing the number of annual members will be key to future growth. Rather than creating a marketing campaign that targets all-new customers, Moreno believes there is a solid opportunity to convert casual riders into members. She notes that casual riders are already aware of the Cyclistic program and have chosen Cyclistic for their mobility needs. 

Moreno has set a clear goal: Design marketing strategies aimed at converting casual riders into annual members. To do that, however, the team needs to better understand how annual members and casual riders differ, why casual riders would buy a membership, and how digital media could affect their marketing tactics. Moreno and her team are interested in analyzing the Cyclistic historical bike trip data to identify trends.

## Scenario
I am assuming the role of a junior data analyst working on the marketing analyst team at Cyclistic. My manager, Moreno, believes that the company’s future success relies on maximizing the number of annual memberships. Therefore, my team needs to understand how casual riders and annual members use Cyclistic bikes differently. From these insights, a marketing strategy will be devised to convert casual riders into members. Cyclistic executives will need to approve any recommendations made, and they must be backed up with compelling data insights and visualizations.

I will be using “Guiding Questions” and “Key Tasks” as taught in the certificate courses to help complete my analysis at each step of the data analysis steps outlined earlier. 

# Ask
Three questions will guide the future marketing program: 
1.	How do annual members and casual riders use Cyclistic bikes differently? 
2.	Why would casual riders buy Cyclistic annual memberships? 
3.	How can Cyclistic use digital media to influence casual riders to become members? 

I will be focusing on answering the first question: How do annual members and casual riders use Cyclistic bikes differently?

## Guiding Questions
- What is the problem you are trying to solve?
- How can your insights drive business decisions?
## Key Tasks
- Identify the business task
- Consider key stakeholders
 
**Business Task:**

I will be using 1 year of Cyclistic’s ridership data to gather insights to inform a marketing plan that aims to convert casual users into members. This plan will be developed by my team, my manager, and will be presented to executives for approval.

# Prepare
## Guiding Questions
- Where is your data located?
- How is the data organized?
-	Are there issues with bias or credibility in this data? Does your data ROCCC?
-	How are you addressing licensing, privacy, security, and accessibility?
-	How did you verify the data’s integrity?
-	How does it help you answer your question?
-	Are there any problems with the data?
## Key Tasks
- Download data and store it appropriately.
-	Identify how it’s organized.
-	Sort and filter the data.
-	Determine the credibility of the data.

The data is organized by month and was accessed directly from the company’s servers. The data was collected by the company directly, it is the primary source of data so has a low chance of bias and high credibility. The data was made publicly available under the company’s [license agreement](https://www.divvybikes.com/data-license-agreement), and does not include personal information to protect user data. It contains useful information to examine basic differences between casual and annual members.

# Process
## Guiding Questions
-	What tools are you choosing and why?
-	Have you ensured your data’s integrity?
-	What steps have you taken to ensure that your data is clean?
-	How can you verify that your data is clean and ready to analyze?
-	Have you documented your cleaning process so you can review and share those results?
## Key Tasks
- Check the data for errors.
-	Choose your tools.
-	Transform the data so you can work with it effectively.
-	Document the cleaning process.

I chose to use SQL in BigQuery Studio because Excel and Google Sheets ran too slowly, even when working with just one month of data at a time. I examined the SCHEMA and ensured the columns had the correct data types, even after the cleaning process, to ensure the data’s integrity. I cleaned the data and documented my rationale and associated queries.

Steps taken for cleaning:

[01. Process - Data Cleaning.sql](https://github.com/cavalierej/cyclistic-case-study/blob/9fe55fa63f2bb74c342d0276f567ef5acc05121d/01.%20Process%20-%20Data%20Cleaning.sql) (All SQL queries combined in a file)

- Downloaded all 12 datasets from divvy-tripdata for the most recent year, at the time it was September 2023 – August 2024.
-	Unzipped all files.
-	Uploaded all 12 files to Google Cloud to import them into Big Query.
    -	I couldn’t import them as attachments or from Google Drive as many files were too lage.
-	I had to import each file as its own table, then used a query to merge them into one table, saving these query results into a new table called 'yearly_data'
    - ``` SQL
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
      ```
- Checked for NULL ride_id values.
    - ``` SQL
      SELECT COUNT(CASE WHEN ride_id IS NULL THEN 1 END) AS null_count,
        COUNT(ride_id) AS non_null_count
      FROM 'data-analytics-capstone-437301.capstone.yearly_data'
      ;
      ```
    - I determined I only wanted to eliminate rows with no valid 'ride_id' value, but there were no NULL values.
    - I could have eliminated rows with NULL 'station_start' or 'station_end' values, but I decided to keep them in the analysis for multiple reasons:
        - The rides had a 'ride_id' value so they must have been trips that people have taken,
        - I didn’t know whether station_start or station_end meant a transit station or a bike docking station – if it meant a transit station it is realistic that many trips were started in the middle of a street as opposed to a transit station.
- Checked for duplicate 'ride_id' values to ensure I wasn’t counting any trip twice.
    - ``` SQL
      SELECT ride_id,
        COUNT(*) AS count_of_ride_id
      FROM 'data-analytics-capstone-437301.capstone.yearly_data'
      GROUP BY ride_id
      HAVING count_of_ride_id > 1
      ;
      ```
    - There were duplicates, so I had to figure out a way to only include one version of the trip.
        - All duplicates were on Friday, May 31st – could be useful information for programmers.
- Created the 'ride_id_count' and 'duplicate_rank' columns, and overwrote the existing table with these results.
    - ```SQL
      SELECT *,
        COUNT(ride_id) OVER(PARTITION BY ride_id ORDER BY ride_id) AS ride_id_count,
        RANK() OVER(PARTITION BY ride_id ORDER BY ended_at) AS duplicate_rank
      FROM 'data-analytics-capstone-437301.capstone.yearly_data'
      ORDER BY ride_id_count DESC,
      ride_id,
      duplicate_rank
      ;
      ```
    - I ranked all the trips, using the 'ended_at' column to distinguish between the duplicates. There was little information between the two duplicate rows to distinguish between them. I reviewed each row individually because there were only around 200 duplicates, so I knew a RANK() function would work; however, if there was absolutely no way to distinguish between the duplicates, a ROW_NUMBER() function would’ve also worked.
        - This will allow me to select only the unique trips by selecting the highest value from the ranked column.
    - Checked to ensure that no trips were duplicated more than once. From the previous step, I saw that there was only around 200 duplicates and didn’t see any ride_id value with a count higher than 2, but I created a query anyways to be sure.
        - ``` SQL
          SELECT *
          FROM 'data-analytics-capstone-437301.capstone.yearly_data'
          WHERE ride_id_count > 2
          ;
          ```
        - There were no 'ride_id' values that occurred more than twice.
- Created the “ride_length” column as an INTERVAL to determine trip length for each trip, and overwrote the existing table with the query results.
    - ``` SQL
      SELECT *,
        ended_at - started_at AS ride_length
      FROM 'data-analytics-capstone-437301.capstone.yearly_data'
      ;
      ```
    - I tried to change the format of the INTERVAL column but unfortunately there is no way to do so in BigQuery while also storing the data as an INTERVAL. I could have extracted the hours, minutes, and seconds and created a column as a STRING, but then it will not be as useful for analysis.
- Originally, I converted the 'started_at' and 'ended_at' columns to Central Time using the DATETIME() function, but through later analysis learned this was unnecessary as the values were already in Central Time despite BigQuery indicating UTC.
- Created 'greater_than_one_minute' column as a BOOLEAN, determining if the ride length was at least one minute, and overwrote the existing table with query results.
    - I didn’t delete the values in case I wanted to refer to them in future, but the BOOLEAN values will still allow me to isolate them and only include trips one minute or longer in my analysis.
    - ``` SQL
      SELECT *,
        CASE
          WHEN ride_length < INTERVAL 1 MINUTE THEN FALSE
          WHEN ride_length >= INTERVAL 1 MINUTE THEN TRUE
          ELSE NULL
        END AS greater_than_one_minute
      FROM 'data-analytics-capstone-437301.capstone.yearly_data'
      ;
      ```
- Created the 'ride_length_in_minutes' column, and added it to the existing table by overwriting it with the query results.
    - ``` SQL
      SELECT *,
      (ride_length_hour * 60) + ride_length_minute AS ride_length_in_minutes
      FROM(
        SELECT *,
          EXTRACT(HOUR FROM ride_length) AS ride_length_hour,
          EXTRACT(MINUTE FROM ride_length) AS ride_length_minute
        FROM 'data-analytics-capstone-437301.capstone.yearly_data'
      )
      ;
      ```
- Created the 'time_of_day' column based on the 'started_at' column, and added it to the table by overwriting it with query results.
    - ``` SQL
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
      ```
- Created the 'day_of_week' column based on the 'started_at' column, to determine on which day the trip began in the appropriate Central Time zone. Overwrote the existing table with the query results.
    - Used the Google BigQuery Timestamp Functions Reference Documentation to determine which numbers corresponded to which day of the week.
    - ``` SQL
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
      ```
- Created the 'type_of_day' column based on the created 'day_of_week' column and overwrote the existing table.
    - ``` SQL
      SELECT *,
        CASE
          WHEN day_of_week IN ("Monday", "Tuesday", "Wednesday", "Thursday", "Friday") THEN "Weekday"
          WHEN day_of_week IN ("Sunday", "Saturday") THEN "Weekend"
          ELSE NULL
        END AS type_of_day
      FROM 'data-analytics-capstone-437301.capstone.yearly_data'
      ;
      ```
- Created the 'season' column based on the 'started_at' column, and added it to the table by overwriting it with the query reuslts.
    - ``` SQL
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
      ``` 
- With each column I created, I added it onto the existing table by overwriting it.
    - This ensured all data remained intact, while also accounting for the need to query only a part of the entire dataset to ensure it is relevant for this analysis.
- I then created a final cleaned table to be used for analysis, by saving the results of a query to a new table called 'yearly_data_cleaned'.
    - ``` SQL
      SELECT *
      FROM 'data-analytics-capstone-437301.capstone.yearly_data'
      WHERE greater_than_one_minute = TRUE
      AND duplicate_rank = 1
      ;
      ```
After performing these steps to clean my dataset, it was then ready to be analyzed.

# Analyze
## Guiding questions
- How should you organize your data to perform analysis on it?
- Has your data been properly formatted?
- What surprises did you discover in the data?
- What trends or relationships did you find in the data?
- How will these insights help answer your business questions?
## Key tasks
- Aggregate your data so it’s useful and accessible.
- Organize and format your data.
- Perform calculations.
- Identify trends and relationships.

After cleaning my data in the previous step, I now had a clean new table with data that was ready to be analyzed, called “yearly_data_cleaned”. I used SQL to perform various calculations, to obtain information like trip counts and average ride length by periods of time and type of user.



### Overall Trip Count
- Total trips
    - ``` SQL
      SELECT COUNT(*) AS trip_count
      FROM 'data-analytics-capstone-437301.capstone.yearly_data_cleaned'
      ;
      ```
- Average trip length
    - ``` SQL
      SELECT AVG(ride_length) AS average_trip_length
      FROM 'data-analytics-capstone-437301.capstone.yearly_data_cleaned'
      ;
      ```
- Trip count by member type
    - ``` SQL
      SELECT member_casual,
        COUNT(*) AS trip_count
      FROM 'data-analytics-capstone-437301.capstone.yearly_data_cleaned'
      GROUP BY member_casual
      ORDER BY trip_count DESC
      ;
      ```
- Trip count by rideable type
    - ``` SQL
      SELECT rideable_type,
        COUNT(*) AS trip_count
      FROM 'data-analytics-capstone-437301.capstone.yearly_data_cleaned'
      GROUP BY rideable_type
      ORDER BY trip_count DESC
      ;
      ```
- Trip count by member type and rideable type
    - ``` SQL
      SELECT member_casual,
        rideable_type,
        COUNT(*) AS trip_count
      FROM 'data-analytics-capstone-437301.capstone.yearly_data_cleaned'
      GROUP BY member_casual,
        rideable_type
      ORDER BY trip_count DESC
      ;
      ```
### Overall Ride Length
- Ride length by member type
    - ``` SQL
      SELECT member_casual,
        AVG(ride_length_in_minutes) AS average_ride_length
      FROM 'data-analytics-capstone-437301.capstone.yearly_data_cleaned'
      GROUP BY member_casual
      ;
      ```
- Ride length by bike type
    - ``` SQL
      SELECT rideable_type,
        AVG(ride_length_in_minutes) AS average_ride_length
      FROM 'data-analytics-capstone-437301.capstone.yearly_data_cleaned'
      GROUP BY rideable_type
      ;
      ```
- Ride length by member type and bike type
    - ``` SQL
      SELECT member_casual
        rideable_type,
        AVG(ride_length_in_minutes) AS average_ride_length
      FROM 'data-analytics-capstone-437301.capstone.yearly_data_cleaned'
      GROUP BY member_casual,
        rideable_type
      ;
      ```
### Trips by Hour and Time of Day
- Trip count by hour
    - ``` SQL
      SELECT EXTRACT(HOUR FROM started_at) AS hour,
        COUNT(*) AS trip_count
      FROM 'data-analytics-capstone-437301.capstone.yearly_data_cleaned'
      GROUP BY hour
      ORDER BY trip_count DESC
      ;
      ```
- Trip count by hour and member type
    - ``` SQL
      SELECT EXTRACT(HOUR FROM started_at) AS hour,
        member_casual,
        COUNT(*) AS trip_count
      FROM 'data-analytics-capstone-437301.capstone.yearly_data_cleaned'
      GROUP BY hour,
        member_casual
      ORDER BY hour,
        member_casual
      ;
      ```
- Average ride length by hour
    - ``` SQL
      SELECT EXTRACT(HOUR FROM started_at) AS hour,
        AVG(ride_length_in_minutes) AS average_ride_length
      FROM 'data-analytics-capstone-437301.capstone.yearly_data_cleaned'
      GROUP BY hour
      ORDER BY hour
      ;
      ```
- Average ride length by hour and member type
    - ``` SQL
      SELECT EXTRACT(HOUR FROM started_at) AS hour,
        member_casual,
        AVG(ride_length_in_minutes) AS average_ride_length
      FROM 'data-analytics-capstone-437301.capstone.yearly_data_cleaned'
      GROUP BY hour,
        member_casual
      ORDER BY hour,
        member_casual
      ;
      ```
- Trip count by time of day
    - ``` SQL
      SELECT time_of_day,
        COUNT(*) AS trip_count
      FROM 'data-analytics-capstone-437301.capstone.yearly_data_cleaned'
      GROUP BY time_of_day
      ORDER BY trip_count DESC
      ;
      ```
- Trip count by time of day and member type
    - ``` SQL
      SELECT time_of_day,
        member_casual,
        COUNT(*) AS trip_count
      FROM 'data-analytics-capstone-437301.capstone.yearly_data_cleaned'
      GROUP BY time_of_day,
        member_casual
      ORDER BY time_of_day,
        member_casual
      ;
      ```
- Average ride length by time of day
    - ``` SQL
      SELECT time_of_day,
        AVG(ride_length_in_minutes) AS average_ride_length
      FROM 'data-analytics-capstone-437301.capstone.yearly_data_cleaned'
      GROUP BY time_of_day
      ORDER BY time_of_day
      ;
      ```
- Average ride length by time of day and member type
    - ``` SQL
      SELECT time_of_day,
        member_casual,
        AVG(ride_length_in_minutes) AS average_ride_length
      FROM 'data-analytics-capstone-437301.capstone.yearly_data_cleaned'
      GROUP BY time_of_day,
        member_casual
      ORDER BY time_of_day,
        member_casual
      ;
      ```
### Trips by Day and Type of Day
- Trip count by day
    - ``` SQL
      SELECT day_of_week,
        COUNT(*) AS trip_count
      FROM 'data-analytics-capstone-437301.capstone.yearly_data_cleaned'
      GROUP BY day_of_week
      ORDER BY trip_count DESC
      ;
      ```
- Trip count by day and member type
    - ``` SQL
      SELECT day_of_week,
        member_casual,
        COUNT(*) AS trip_count
      FROM 'data-analytics-capstone-437301.capstone.yearly_data_cleaned'
      GROUP BY day_of_week,
        member_casual
      ORDER BY day_of_week,
        member_casual
      ;
      ```
- Average ride length by day
    - ``` SQL
      SELECT day_of_week,
        AVG(ride_length_in_minutes) AS average_ride_length
      FROM 'data-analytics-capstone-437301.capstone.yearly_data_cleaned'
      GROUP BY day_of_week
      ORDER BY day_of_week
      ;
      ```
- Average ride length by day and member type
    - ``` SQL
      SELECT day_of_week,
        member_casual,
        AVG(ride_length_in_minutes) AS average_ride_length
      FROM 'data-analytics-capstone-437301.capstone.yearly_data_cleaned'
      GROUP BY day_of_week,
        member_casual
      ORDER BY day_of_week,
        member_casual
      ;
      ```
- Trip count by type of day
    - ``` SQL
      SELECT type_of_day,
        COUNT(*) AS trip_count
      FROM 'data-analytics-capstone-437301.capstone.yearly_data_cleaned'
      GROUP BY type_of_day
      ORDER BY trip_count DESC
      ;
      ```
- Trip count by type of day and member type
    - ``` SQL
      SELECT type_of_day,
        member_casual,
        COUNT(*) AS trip_count
      FROM 'data-analytics-capstone-437301.capstone.yearly_data_cleaned'
      GROUP BY type_of_day,
        member_casual
      ORDER BY type_of_day,
        member_casual
      ;
      ```
- Average ride length by type of day
    - ``` SQL
      SELECT type_of_day,
        AVG(ride_length_in_minutes) AS average_ride_length
      FROM 'data-analytics-capstone-437301.capstone.yearly_data_cleaned'
      GROUP BY type_of_day
      ORDER BY type_of_day
      ;
      ```
- Average ride length by type of day and member type
    - ``` SQL
      SELECT type_of_day,
        member_casual,
        AVG(ride_length_in_minutes) AS average_ride_length
      FROM 'data-analytics-capstone-437301.capstone.yearly_data_cleaned'
      GROUP BY type_of_day,
        member_casual
      ORDER BY type_of_day,
        member_casual
      ;
      ```
### Trips by Month
- Trip count by month
    - ``` SQL
      SELECT EXTRACT(MONTH FROM started_at) AS month,
        COUNT(*) AS trip_count
      FROM 'data-analytics-capstone-437301.capstone.yearly_data_cleaned'
      GROUP BY month
      ORDER BY trip_count DESC
      ;
      ```
- Trip count by month and member type
    - ``` SQL
      SELECT EXTRACT(MONTH FROM started_at) AS month,
        member_casual,
        COUNT(*) AS trip_count
      FROM 'data-analytics-capstone-437301.capstone.yearly_data_cleaned'
      GROUP BY month,
        member_casual
      ORDER BY month,
        member_casual
      ;
      ```
- Average ride length by month
    - ``` SQL
      SELECT EXTRACT(MONTH FROM started_at) AS month,
        AVG(ride_length_in_minutes) AS average_ride_length
      FROM 'data-analytics-capstone-437301.capstone.yearly_data_cleaned'
      GROUP BY month
      ORDER BY month
      ;
      ```
- Average ride length by month and member type
    - ``` SQL
      SELECT EXTRACT(HOUR FROM started_at) AS month,
        member_casual,
        AVG(ride_length_in_minutes) AS average_ride_length
      FROM 'data-analytics-capstone-437301.capstone.yearly_data_cleaned'
      GROUP BY month,
        member_casual
      ORDER BY month,
        member_casual
      ;
      ```
- Trip count by season
    - ``` SQL
      SELECT season,
        COUNT(*) AS trip_count
      FROM 'data-analytics-capstone-437301.capstone.yearly_data_cleaned'
      GROUP BY season
      ORDER BY trip_count DESC
      ;
      ```
- Trip count by season and member type
    - ``` SQL
      SELECT season,
        member_casual,
        COUNT(*) AS trip_count
      FROM 'data-analytics-capstone-437301.capstone.yearly_data_cleaned'
      GROUP BY season,
        member_casual
      ORDER BY season,
        member_casual
      ;
      ```
- Average ride length by season
    - ``` SQL
      SELECT season,
        AVG(ride_length_in_minutes) AS average_ride_length
      FROM 'data-analytics-capstone-437301.capstone.yearly_data_cleaned'
      GROUP BY season
      ORDER BY season
      ;
      ```
- Average ride length by season and member type
    - ``` SQL
      SELECT season,
        member_casual,
        AVG(ride_length_in_minutes) AS average_ride_length
      FROM 'data-analytics-capstone-437301.capstone.yearly_data_cleaned'
      GROUP BY season,
        member_casual
      ORDER BY season,
        member_casual
      ;
      ```
### Most Frequent Stations
- Most frequent starting stations
    - ``` SQL
      SELECT start_station_name,
        start_station_id,
        COUNT(*) AS trip_count
      FROM 'data-analytics-capstone-437301.capstone.yearly_data_cleaned'
      GROUP BY start_station_name,
        start_station_id
      HAVING trip_count >= 1000
      ORDER BY trip_count DESC
      ;
      ```
- Most frequent ending stations
    - ``` SQL
      SELECT end_station_name,
        end_station_id,
        COUNT(*) AS trip_count
      FROM 'data-analytics-capstone-437301.capstone.yearly_data_cleaned'
      GROUP BY end_station_name,
        end_station_id
      HAVING trip_count >= 1000
      ORDER BY trip_count DESC
      ;
      ```
- When making the charts related these two queries in Tableau, I discovered some stations were the same but listed as different stations. For example, some entries of a station used a "/" to indicate an intersection, whereas other entries of the same station_id used a "&".
    - I could not edit the entries in BigQuery, so I had to make a new column in Tableau that reflected the fix.
- Most frequent trips
    - ``` SQL
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
      ```
# Share
## Guiding Questions
- Were you able to answer the question of how annual members and casual riders use Cyclistic bikes differently?
- What story does your data tell?
- How do your findings relate to your original question? 
- Who is your audience? What is the best way to communicate with them? 
- Can data visualization help you share your findings?
- Is your presentation accessible to your audience?
## Key Tasks
- Determine the best way to share your findings.
- Create effective data visualizations.
- Present your findings.
- Ensure your work is accessible

[Tableau Report](https://public.tableau.com/views/CyclisticPresentationDashboard/CyclisticPresentation?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

I struggled to import my table into a visualization platform, as my table was too large to download from BigQuery, without a paid subscription. Luckily, I was able to begin a free trial of Tableau and connect my table to Tableau. I was then able to create an extraction in Tableau and work on my project in Tableau Public, so I would have access to it after my trial expired. I created various visualizations displaying similar information from the queries in the previous phase.

This step took the longest amount of time, as it required time to re-familiarize myself with Tableau and it’s features. I tried displaying information in various types of ways, using different types of chart, and trying to combine similar types data into the same chart. For example, at first I created pie charts to display the total trip count broken down by user type, but settled on a bar chart to follow best practice.

Once I was happy with my charts, I sketched various drafts of a dashboard to layout the information I wanted to display. At first, I wanted an interactive bar chart, but then decided that using a more typical dashboard was not conducive to also featuring explanations of my analysis. I then decided to layout the information in a way more similar to an infographic, as this would allow me to present my insights in a way that made better sense to me. After drafting some rough sketches and I was happy with a layout, I used Figma to recreate my final sketch. I then used the Figma to Tableau plugin to connect my charts to the appropriate sections in my Figma layout.

I ensured to follow data visualization best practices, such as removing anything that distracts from the information presented like lines, words, numbers, etc.
# Act
## Guiding Questions
- What is your final conclusion based on your analysis?
- How could your team and business apply your insights?
- What next steps would you or your stakeholders take based on your findings?
- Is there additional data you could use to expand on your findings?
## Key Tasks
- Create your portfolio.
- Add your case study.
- Practice presenting your case study to a friend or family member

My top three recommendations based on my analysis:
1.	Target casual users to use Cyclistic for more than leisure rides.
    1.	Various indicators in the data indicate that casual users use Cyclistic bikes for leisure rides. Casual users on classic bikes have the longest average ride length, at almost 40 minutes. Additionally, Saturday and Sunday are the days when casual users use bikes most as a proportion of all trips on a given day. We can also see that the majority of casual users use bikes in warmer months, whereas members usage is more spread out amongst the whole year. These factors indicate casual users use bikes for leisure or exercise, and perhaps they can be convinced to become members and use the bikes for other trips too, such as going to work, running errands, and visiting others. I would explore creating a targeted marketing campaign for casual users to achieve this. 
2.	Create additional stations near locations where most trips start and end.
     1.	In several of the locations where trips begin and end most frequently for casual users, those stations are either quite isolated or are next to a station where trips begin less frequently. Potentially, this could lead to a shortage of bikes which causes them to skip using a bike altogether. If there are more bikes available where casual users need them, they are more likely to use the service more frequently and become members.
3.	Add winterization features to bikes to make them more suited to use in colder months.
     1.	Usage from both types of users drops significantly in the colder months, but especially amongst casual users. Perhaps bikes could be equipped with features such as winter tires or heated seats and handlebars, to make bike rides more comfortable and encourage more usage in colder weather. This can be marketed to casual users in warmer months when they are already using Cyclistic, and in locations where they are already using bikes.
# Conclusion
I think I did a good job of thoroughly exploring the issue at hand, which was how members and casual users use bikes differently. I believe I  provided many useful insights which can be used by various stakeholders to effectively guide a marketing campaign and other key decisions.

I learned many valuable skills and lessons while completing this capstone project. I was able to refine my SQL skills and gain a more in-depth understanding of Tableau as I hardly used it before. I learned how to effectively present information and how to follow best practices for data visualizations. I also learned a new skill in Figma, which I believe is very a useful tool to layout dashboards or infographics to present data and information.
