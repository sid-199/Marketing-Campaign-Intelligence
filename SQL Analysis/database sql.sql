CREATE DATABASE marketing_analytics;
USE marketing_analytics;

CREATE TABLE nykaa_campaigns (
    Campaign_ID VARCHAR(30),
    Campaign_Type VARCHAR(100),
    Target_Audience VARCHAR(100),
    Duration INT,
    Channel_Used VARCHAR(255),
    Impressions INT,
    Clicks INT,
    Leads INT,
    Conversions INT,
    Revenue DECIMAL(15,2),
    Acquisition_Cost DECIMAL(15,2),
    ROI DECIMAL(10,2),
    Language VARCHAR(50),
    Engagement_Score DECIMAL(10,2),
    Customer_Segment VARCHAR(100),
    Date VARCHAR(20)
);
CREATE TABLE purplle_campaigns LIKE nykaa_campaigns;
CREATE TABLE tira_campaigns LIKE nykaa_campaigns;
SHOW TABLES;
select * from tira_campaigns;

SELECT 'Nykaa' AS Brand, COUNT(*) AS Total_Rows
FROM nykaa_campaigns

UNION ALL

SELECT 'Purplle', COUNT(*)
FROM purplle_campaigns

UNION ALL

SELECT 'Tira', COUNT(*)
FROM tira_campaigns;

-- Check for duplicate Campaign IDs.
-- This helps make sure the same campaign is not repeated.

SELECT COUNT(*) AS Duplicate_IDs
FROM (
    SELECT Campaign_ID
    FROM nykaa_campaigns
    GROUP BY Campaign_ID
    HAVING COUNT(*) > 1
) AS duplicates;


-- Check duplicate Campaign IDs in Tira.

SELECT COUNT(*) AS Duplicate_IDs
FROM (
    SELECT Campaign_ID
    FROM tira_campaigns
    GROUP BY Campaign_ID
    HAVING COUNT(*) > 1
) AS duplicates;


-- Check duplicate Campaign IDs in Purplle.

SELECT COUNT(*) AS Duplicate_IDs
FROM (
    SELECT Campaign_ID
    FROM purplle_campaigns
    GROUP BY Campaign_ID
    HAVING COUNT(*) > 1
) AS duplicates;


-- Check for missing values in the Tira data.
-- This makes sure important fields are not empty.

SELECT
    SUM(Campaign_ID IS NULL) AS Campaign_ID_NULL,
    SUM(Campaign_Type IS NULL) AS Campaign_Type_NULL,
    SUM(Target_Audience IS NULL) AS Target_Audience_NULL,
    SUM(Duration IS NULL) AS Duration_NULL,
    SUM(Channel_Used IS NULL) AS Channel_NULL,
    SUM(Impressions IS NULL) AS Impressions_NULL,
    SUM(Clicks IS NULL) AS Clicks_NULL,
    SUM(Leads IS NULL) AS Leads_NULL,
    SUM(Conversions IS NULL) AS Conversions_NULL,
    SUM(Revenue IS NULL) AS Revenue_NULL,
    SUM(Acquisition_Cost IS NULL) AS Acquisition_Cost_NULL,
    SUM(ROI IS NULL) AS ROI_NULL,
    SUM(Language IS NULL) AS Language_NULL,
    SUM(Engagement_Score IS NULL) AS Engagement_NULL,
    SUM(Customer_Segment IS NULL) AS Segment_NULL,
    SUM(Date IS NULL) AS Date_NULL
FROM tira_campaigns;

-- Check for missing values in the Nykaa data.
-- This makes sure important fields are not empty.

SELECT
    SUM(Campaign_ID IS NULL) AS Campaign_ID_NULL,
    SUM(Campaign_Type IS NULL) AS Campaign_Type_NULL,
    SUM(Target_Audience IS NULL) AS Target_Audience_NULL,
    SUM(Duration IS NULL) AS Duration_NULL,
    SUM(Channel_Used IS NULL) AS Channel_NULL,
    SUM(Impressions IS NULL) AS Impressions_NULL,
    SUM(Clicks IS NULL) AS Clicks_NULL,
    SUM(Leads IS NULL) AS Leads_NULL,
    SUM(Conversions IS NULL) AS Conversions_NULL,
    SUM(Revenue IS NULL) AS Revenue_NULL,
    SUM(Acquisition_Cost IS NULL) AS Acquisition_Cost_NULL,
    SUM(ROI IS NULL) AS ROI_NULL,
    SUM(Language IS NULL) AS Language_NULL,
    SUM(Engagement_Score IS NULL) AS Engagement_NULL,
    SUM(Customer_Segment IS NULL) AS Segment_NULL,
    SUM(Date IS NULL) AS Date_NULL
FROM nykaa_campaigns;

-- Check for missing values in the Purplle data.
-- This makes sure important fields are not empty.

SELECT
    SUM(Campaign_ID IS NULL) AS Campaign_ID_NULL,
    SUM(Campaign_Type IS NULL) AS Campaign_Type_NULL,
    SUM(Target_Audience IS NULL) AS Target_Audience_NULL,
    SUM(Duration IS NULL) AS Duration_NULL,
    SUM(Channel_Used IS NULL) AS Channel_NULL,
    SUM(Impressions IS NULL) AS Impressions_NULL,
    SUM(Clicks IS NULL) AS Clicks_NULL,
    SUM(Leads IS NULL) AS Leads_NULL,
    SUM(Conversions IS NULL) AS Conversions_NULL,
    SUM(Revenue IS NULL) AS Revenue_NULL,
    SUM(Acquisition_Cost IS NULL) AS Acquisition_Cost_NULL,
    SUM(ROI IS NULL) AS ROI_NULL,
    SUM(Language IS NULL) AS Language_NULL,
    SUM(Engagement_Score IS NULL) AS Engagement_NULL,
    SUM(Customer_Segment IS NULL) AS Segment_NULL,
    SUM(Date IS NULL) AS Date_NULL
FROM purplle_campaigns;


-- Check the date range of all three brands.
-- This helps confirm that the brands cover a similar period.

SELECT 'Nykaa' AS Brand, MIN(Date) AS Start_Date, MAX(Date) AS End_Date
FROM nykaa_campaigns

UNION ALL

SELECT 'Purplle', MIN(Date), MAX(Date)
FROM purplle_campaigns

UNION ALL

SELECT 'Tira', MIN(Date), MAX(Date)
FROM tira_campaigns;


-- Check minimum values of the main numeric columns.
-- This helps find unusual values before analysis.

SELECT
    MIN(Impressions) AS Min_Impressions,
    MIN(Clicks) AS Min_Clicks,
    MIN(Leads) AS Min_Leads,
    MIN(Conversions) AS Min_Conversions,
    MIN(Revenue) AS Min_Revenue,
    MIN(Acquisition_Cost) AS Min_Acquisition_Cost,
    MIN(ROI) AS Min_ROI,
    MIN(Engagement_Score) AS Min_Engagement
FROM nykaa_campaigns;


-- Check minimum values for Purplle and Tira as well.

SELECT
    'Purplle' AS Brand,
    MIN(Impressions) AS Min_Impressions,
    MIN(Clicks) AS Min_Clicks,
    MIN(Leads) AS Min_Leads,
    MIN(Conversions) AS Min_Conversions,
    MIN(Revenue) AS Min_Revenue,
    MIN(Acquisition_Cost) AS Min_Acquisition_Cost,
    MIN(ROI) AS Min_ROI,
    MIN(Engagement_Score) AS Min_Engagement
FROM purplle_campaigns

UNION ALL

SELECT
    'Tira',
    MIN(Impressions),
    MIN(Clicks),
    MIN(Leads),
    MIN(Conversions),
    MIN(Revenue),
    MIN(Acquisition_Cost),
    MIN(ROI),
    MIN(Engagement_Score)
FROM tira_campaigns;


-- Create one common table for all three brands.
-- This makes comparison easier in SQL and Power BI.

CREATE TABLE marketing_campaigns (
    Brand VARCHAR(20),
    Campaign_ID VARCHAR(30),
    Campaign_Type VARCHAR(100),
    Target_Audience VARCHAR(100),
    Duration INT,
    Channel_Used VARCHAR(255),
    Impressions INT,
    Clicks INT,
    Leads INT,
    Conversions INT,
    Revenue DECIMAL(15,2),
    Acquisition_Cost DECIMAL(15,2),
    ROI DECIMAL(10,2),
    Language VARCHAR(50),
    Engagement_Score DECIMAL(10,2),
    Customer_Segment VARCHAR(100),
    Date VARCHAR(20)
);


-- Quick check of the master table.

select * from marketing_campaigns;


-- Add Nykaa data to the master table.

INSERT INTO marketing_campaigns
SELECT 
    'Nykaa' AS Brand,
    Campaign_ID,
    Campaign_Type,
    Target_Audience,
    Duration,
    Channel_Used,
    Impressions,
    Clicks,
    Leads,
    Conversions,
    Revenue,
    Acquisition_Cost,
    ROI,
    Language,
    Engagement_Score,
    Customer_Segment,
    Date
FROM nykaa_campaigns;


-- Add Purplle data to the master table.

INSERT INTO marketing_campaigns
SELECT 
    'Purplle',
    Campaign_ID,
    Campaign_Type,
    Target_Audience,
    Duration,
    Channel_Used,
    Impressions,
    Clicks,
    Leads,
    Conversions,
    Revenue,
    Acquisition_Cost,
    ROI,
    Language,
    Engagement_Score,
    Customer_Segment,
    Date
FROM purplle_campaigns;


-- Add Tira data to the master table.

INSERT INTO marketing_campaigns
SELECT 
    'Tira',
    Campaign_ID,
    Campaign_Type,
    Target_Audience,
    Duration,
    Channel_Used,
    Impressions,
    Clicks,
    Leads,
    Conversions,
    Revenue,
    Acquisition_Cost,
    ROI,
    Language,
    Engagement_Score,
    Customer_Segment,
    Date
FROM tira_campaigns;

-- Final check of the complete master data.

SELECT *
FROM marketing_campaigns;

-- Compare the overall performance of each brand.
-- This gives us a quick view of which brand performs better.

SELECT
    Brand,
    COUNT(*) AS Total_Campaigns,
    SUM(Impressions) AS Total_Impressions,
    SUM(Clicks) AS Total_Clicks,
    SUM(Leads) AS Total_Leads,
    SUM(Conversions) AS Total_Conversions,
    SUM(Revenue) AS Total_Revenue,
    SUM(Acquisition_Cost) AS Total_Acquisition_Cost,
    AVG(ROI) AS Average_ROI
FROM marketing_campaigns
GROUP BY Brand
ORDER BY Total_Revenue DESC;


-- Compare channel combinations by ROI.
-- This helps find which channel combinations perform better.

SELECT
    Brand,
    Channel_Used,
    COUNT(*) AS Total_Campaigns,
    SUM(Revenue) AS Total_Revenue,
    SUM(Acquisition_Cost) AS Total_Acquisition_Cost,
    SUM(Conversions) AS Total_Conversions,
    AVG(ROI) AS Average_ROI
FROM marketing_campaigns
GROUP BY Brand, Channel_Used
ORDER BY Brand, Average_ROI DESC;


-- Compare different campaign types.
-- This helps identify the better-performing campaign types.

SELECT
    Brand,
    Campaign_Type,
    COUNT(*) AS Total_Campaigns,
    SUM(Revenue) AS Total_Revenue,
    SUM(Acquisition_Cost) AS Total_Cost,
    SUM(Conversions) AS Total_Conversions,
    AVG(ROI) AS Average_ROI
FROM marketing_campaigns
GROUP BY Brand, Campaign_Type
ORDER BY Brand, Average_ROI DESC;


-- Compare customer segments by ROI.
-- This helps identify the better-performing customer groups.

SELECT
    Brand,
    Customer_Segment,
    COUNT(*) AS Total_Campaigns,
    SUM(Revenue) AS Total_Revenue,
    SUM(Conversions) AS Total_Conversions,
    AVG(ROI) AS Average_ROI
FROM marketing_campaigns
GROUP BY Brand, Customer_Segment
ORDER BY Brand, Average_ROI DESC;


-- Compare target audiences by ROI.
-- This shows which audiences are performing better.

SELECT
    Brand,
    Target_Audience,
    COUNT(*) AS Total_Campaigns,
    SUM(Revenue) AS Total_Revenue,
    SUM(Conversions) AS Total_Conversions,
    AVG(ROI) AS Average_ROI
FROM marketing_campaigns
GROUP BY Brand, Target_Audience
ORDER BY Brand, Average_ROI DESC;


-- Look closer at Purplle's College Students segment.
-- This helps us check which target audience performs best within it.

SELECT
    Target_Audience,
    COUNT(*) AS Campaigns,
    SUM(Conversions) AS Total_Conversions,
    SUM(Revenue) AS Total_Revenue,
    AVG(ROI) AS Average_ROI
FROM marketing_campaigns
WHERE Brand = 'Purplle'
  AND Customer_Segment = 'College Students'
GROUP BY Target_Audience
ORDER BY Average_ROI DESC;


-- Check monthly performance of each brand.
-- This helps us see how ROI, revenue and conversions change over time.

SELECT
    Brand,
    YEAR(STR_TO_DATE(Date, '%d-%m-%Y')) AS Year,
    MONTH(STR_TO_DATE(Date, '%d-%m-%Y')) AS Month,
    SUM(Revenue) AS Total_Revenue,
    SUM(Conversions) AS Total_Conversions,
    AVG(ROI) AS Average_ROI
FROM marketing_campaigns
GROUP BY
    Brand,
    YEAR(STR_TO_DATE(Date, '%d-%m-%Y')),
    MONTH(STR_TO_DATE(Date, '%d-%m-%Y'))
ORDER BY
    Brand, Year, Month;


-- Calculate conversion rate for each campaign type.
-- This shows how well leads are converted into customers.

SELECT
    Brand,
    Campaign_Type,
    SUM(Leads) AS Total_Leads,
    SUM(Conversions) AS Total_Conversions,
    SUM(Acquisition_Cost) AS Total_Cost,
    AVG(ROI) AS Average_ROI,
    ROUND(
        SUM(Conversions) * 100.0 / NULLIF(SUM(Leads), 0),
        2
    ) AS Conversion_Rate
FROM marketing_campaigns
GROUP BY Brand, Campaign_Type
ORDER BY Brand, Conversion_Rate DESC;


-- Calculate cost per conversion.
-- This helps compare how efficiently each campaign gets conversions.

SELECT
    Brand,
    Campaign_Type,
    SUM(Conversions) AS Total_Conversions,
    SUM(Acquisition_Cost) AS Total_Cost,
    ROUND(
        SUM(Acquisition_Cost) / NULLIF(SUM(Conversions), 0),
        2
    ) AS Cost_Per_Conversion,
    AVG(ROI) AS Average_ROI
FROM marketing_campaigns
GROUP BY Brand, Campaign_Type
ORDER BY Brand, Cost_Per_Conversion;


-- Calculate ROAS for each campaign type.
-- This compares the revenue generated with the acquisition cost.

SELECT
    Brand,
    Campaign_Type,
    ROUND(
        SUM(Revenue) / NULLIF(SUM(Acquisition_Cost), 0),
        2
    ) AS ROAS,
    AVG(ROI) AS Average_ROI,
    SUM(Revenue) AS Total_Revenue,
    SUM(Acquisition_Cost) AS Total_Cost
FROM marketing_campaigns
GROUP BY Brand, Campaign_Type
ORDER BY Brand, ROAS DESC;


-- Check where MySQL allows CSV exports.

SHOW VARIABLES LIKE 'secure_file_priv';


-- Export the master table to CSV for Power BI.

SELECT
    Brand,
    Campaign_ID,
    Campaign_Type,
    Target_Audience,
    Duration,
    Channel_Used,
    Impressions,
    Clicks,
    Leads,
    Conversions,
    Revenue,
    Acquisition_Cost,
    ROI,
    Language,
    Engagement_Score,
    Customer_Segment,
    Date
FROM marketing_campaigns
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/marketing_campaigns_full.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';