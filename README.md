# Introduction
This case study is the capstone project for the Google Data Analytics Certificate. It will focus on Cyclistic, a fictional bike-share company in Chicago, and I will act as a junior data analyst helping to solve a business problem. I will be following the data analysis steps outlined in the certificate: Ask, Prepare, Process, Analyze, Share, and Act. The overarching question to explore is: **How do casual users and members use Cyclistic bikes differently?**

## Quick Links
[Tableau Report](https://public.tableau.com/views/CyclisticPresentationDashboard/CyclisticPresentation?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

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

### Guiding Questions
- What is the problem you are trying to solve?
- How can your insights drive business decisions?
### Key Tasks
- Identify the business task
- Consider key stakeholders
 
**Business Task:**

I will be using 1 year of Cyclistic’s ridership data to gather insights to inform a marketing plan that aims to convert casual users into members. This plan will be developed by my team, my manager, and will be presented to executives for approval.

# Prepare
### Guiding Questions
- Where is your data located?
- How is the data organized?
-	Are there issues with bias or credibility in this data? Does your data ROCCC?
-	How are you addressing licensing, privacy, security, and accessibility?
-	How did you verify the data’s integrity?
-	How does it help you answer your question?
-	Are there any problems with the data?
### Key Tasks
- Download data and store it appropriately.
-	Identify how it’s organized.
-	Sort and filter the data.
-	Determine the credibility of the data.

The data is organized by month and was accessed directly from the company’s servers. The data was collected by the company directly, it is the primary source of data so has a low chance of bias and high credibility. The data was made publicly available under the company’s [license agreement](https://www.divvybikes.com/data-license-agreement), and does not include personal information to protect user data. It contains useful information to examine basic differences between casual and annual members.

# Process
### Guiding Questions
-	What tools are you choosing and why?
-	Have you ensured your data’s integrity?
-	What steps have you taken to ensure that your data is clean?
-	How can you verify that your data is clean and ready to analyze?
-	Have you documented your cleaning process so you can review and share those results?
### Key Tasks
- Check the data for errors.
-	Choose your tools.
-	Transform the data so you can work with it effectively.
-	Document the cleaning process.

I chose to use SQL in BigQuery Studio because Excel and Google Sheets ran too slowly, even when working with just one month of data at a time. I examined the SCHEMA and ensured the columns had the correct data types, even after the cleaning process, to ensure the data’s integrity. I cleaned the data and documented my rationale and associated queries.

Steps taken for cleaning:

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
        END AS greater_than_1_minute
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
- I then created a final cleaned table to be used for analysis, called 'yearly_data_cleaned'.
