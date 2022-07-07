-- 1) COMPLETE TABLE

SELECT *
FROM UK_Stabbings_Gender$



-- 2) FEMALE EPISODES ROLL_COUNT FOR THE DECADE PERIOD

SELECT ROW_NUMBER () OVER (PARTITION BY Month ORDER BY Month) Rows, Year, Month, Gender, Episodes_Per_Gender,
SUM(Episodes_Per_Gender) OVER (ORDER BY Month) Roll_Count
FROM UK_Stabbings_Gender$
WHERE GENDER = 'Female' AND Year BETWEEN '2012 - 2013' AND '2021 - 2022'
GROUP BY Year, Month, Gender, Episodes_Per_Gender

-- OR / ALTERNATIVELY

SELECT Year, Month, ROW_NUMBER () OVER (ORDER BY Month) Rows, Gender, Episodes_Per_Gender, 
SUM(Episodes_Per_Gender) OVER (ORDER BY Month) Roll_Count
FROM UK_Stabbings_Gender$ 
WHERE GENDER = 'Female' AND Year  LIKE '%2013' 
GROUP BY Year, Month, Month, Gender, Episodes_Per_Gender

UNION

SELECT Year, Month, ROW_NUMBER () OVER (ORDER BY Month) Rows, Gender, Episodes_Per_Gender, 
SUM(Episodes_Per_Gender) OVER (ORDER BY Month) Roll_Count
FROM UK_Stabbings_Gender$ 
WHERE GENDER = 'Female' AND Year LIKE '%2014' 
GROUP BY Year, Month, Month, Gender, Episodes_Per_Gender

UNION

SELECT Year, Month, ROW_NUMBER () OVER (ORDER BY Month) Rows, Gender, Episodes_Per_Gender, 
SUM(Episodes_Per_Gender) OVER (ORDER BY Month) Roll_Count
FROM UK_Stabbings_Gender$ 
WHERE GENDER = 'Female' AND Year LIKE '%2015' 
GROUP BY Year, Month, Month, Gender, Episodes_Per_Gender

UNION

SELECT Year, Month, ROW_NUMBER () OVER (ORDER BY Month) Rows, Gender, Episodes_Per_Gender, 
SUM(Episodes_Per_Gender) OVER (ORDER BY Month) Roll_Count
FROM UK_Stabbings_Gender$ 
WHERE GENDER = 'Female' AND Year LIKE '%2016' 
GROUP BY Year, Month, Month, Gender, Episodes_Per_Gender

UNION

SELECT Year, Month, ROW_NUMBER () OVER (ORDER BY Month) Rows, Gender, Episodes_Per_Gender, 
SUM(Episodes_Per_Gender) OVER (ORDER BY Month) Roll_Count
FROM UK_Stabbings_Gender$ 
WHERE GENDER = 'Female' AND Year LIKE '%2017' 
GROUP BY Year, Month, Month, Gender, Episodes_Per_Gender

UNION

SELECT Year, Month, ROW_NUMBER () OVER (ORDER BY Month) Rows, Gender, Episodes_Per_Gender, 
SUM(Episodes_Per_Gender) OVER (ORDER BY Month) Roll_Count
FROM UK_Stabbings_Gender$ 
WHERE GENDER = 'Female' AND Year LIKE '%2018' 
GROUP BY Year, Month, Month, Gender, Episodes_Per_Gender

UNION

SELECT Year, Month, ROW_NUMBER () OVER (ORDER BY Month) Rows, Gender, Episodes_Per_Gender, 
SUM(Episodes_Per_Gender) OVER (ORDER BY Month) Roll_Count
FROM UK_Stabbings_Gender$ 
WHERE GENDER = 'Female' AND Year LIKE '%2019' 
GROUP BY Year, Month, Month, Gender, Episodes_Per_Gender

UNION

SELECT Year, Month, ROW_NUMBER () OVER (ORDER BY Month) Rows, Gender, Episodes_Per_Gender, 
SUM(Episodes_Per_Gender) OVER (ORDER BY Month) Roll_Count
FROM UK_Stabbings_Gender$ 
WHERE GENDER = 'Female' AND Year LIKE '%2020' 
GROUP BY Year, Month, Month, Gender, Episodes_Per_Gender

UNION

SELECT Year, Month, ROW_NUMBER () OVER (ORDER BY Month) Rows, Gender, Episodes_Per_Gender, 
SUM(Episodes_Per_Gender) OVER (ORDER BY Month) Roll_Count
FROM UK_Stabbings_Gender$ 
WHERE GENDER = 'Female' AND Year LIKE '%2021' 
GROUP BY Year, Month, Month, Gender, Episodes_Per_Gender

UNION

SELECT Year, Month, ROW_NUMBER () OVER (ORDER BY Month) Rows, Gender, Episodes_Per_Gender, 
SUM(Episodes_Per_Gender) OVER (ORDER BY Month) Roll_Count
FROM UK_Stabbings_Gender$ 
WHERE GENDER = 'Female' AND Year LIKE '%2022'
GROUP BY Year, Month, Gender, Episodes_Per_Gender

-- 3) MALE EPISODES ROLL_COUNT FOR THE DECADE PERIOD

SELECT ROW_NUMBER () OVER (PARTITION BY Month ORDER BY Month) Rows, Year, Month, Gender, Episodes_Per_Gender,
SUM(Episodes_Per_Gender) OVER (ORDER BY Month) Roll_Count
FROM UK_Stabbings_Gender$
WHERE GENDER = 'Male' AND Year BETWEEN '2012 - 2013' AND '2021 - 2022'
GROUP BY Year, Month, Gender, Episodes_Per_Gender

-- OR / ALTERNATIVELY

SELECT Year, Month, ROW_NUMBER () OVER (ORDER BY Month) Rows, Gender, Episodes_Per_Gender, 
SUM(Episodes_Per_Gender) OVER (ORDER BY Month) Roll_Count
FROM UK_Stabbings_Gender$ 
WHERE GENDER = 'Male' AND Year  LIKE '%2013' 
GROUP BY Year, Month, Gender, Episodes_Per_Gender

UNION

SELECT Year, Month, ROW_NUMBER () OVER (ORDER BY Month) Rows, Gender, Episodes_Per_Gender, 
SUM(Episodes_Per_Gender) OVER (ORDER BY Month) Roll_Count
FROM UK_Stabbings_Gender$ 
WHERE GENDER = 'Male' AND Year LIKE '%2014' 
GROUP BY Year, Month, Gender, Episodes_Per_Gender

UNION

SELECT Year, Month, ROW_NUMBER () OVER (ORDER BY Month) Rows, Gender, Episodes_Per_Gender, 
SUM(Episodes_Per_Gender) OVER (ORDER BY Month) Roll_Count
FROM UK_Stabbings_Gender$ 
WHERE GENDER = 'Male' AND Year LIKE '%2015' 
GROUP BY Year, Month, Gender, Episodes_Per_Gender

UNION

SELECT Year, Month, ROW_NUMBER () OVER (ORDER BY Month) Rows, Gender, Episodes_Per_Gender, 
SUM(Episodes_Per_Gender) OVER (ORDER BY Month) Roll_Count
FROM UK_Stabbings_Gender$ 
WHERE GENDER = 'Male' AND Year LIKE '%2016' 
GROUP BY Year, Month, Gender, Episodes_Per_Gender

UNION

SELECT Year, Month, ROW_NUMBER () OVER (ORDER BY Month) Rows, Gender, Episodes_Per_Gender, 
SUM(Episodes_Per_Gender) OVER (ORDER BY Month) Roll_Count
FROM UK_Stabbings_Gender$ 
WHERE GENDER = 'Male' AND Year LIKE '%2017' 
GROUP BY Year, Month, Gender, Episodes_Per_Gender

UNION

SELECT Year, Month, ROW_NUMBER () OVER (ORDER BY Month) Rows, Gender, Episodes_Per_Gender, 
SUM(Episodes_Per_Gender) OVER (ORDER BY Month) Roll_Count
FROM UK_Stabbings_Gender$ 
WHERE GENDER = 'Male' AND Year LIKE '%2018' 
GROUP BY Year, Month, Gender, Episodes_Per_Gender

UNION

SELECT Year, Month, ROW_NUMBER () OVER (ORDER BY Month) Rows, Gender, Episodes_Per_Gender, 
SUM(Episodes_Per_Gender) OVER (ORDER BY Month) Roll_Count
FROM UK_Stabbings_Gender$ 
WHERE GENDER = 'Male' AND Year LIKE '%2019' 
GROUP BY Year, Month, Gender, Episodes_Per_Gender

UNION

SELECT Year, Month, ROW_NUMBER () OVER (ORDER BY Month) Rows, Gender, Episodes_Per_Gender, 
SUM(Episodes_Per_Gender) OVER (ORDER BY Month) Roll_Count
FROM UK_Stabbings_Gender$ 
WHERE GENDER = 'Male' AND Year LIKE '%2020' 
GROUP BY Year, Month, Gender, Episodes_Per_Gender

UNION

SELECT Year, Month, ROW_NUMBER () OVER (ORDER BY Month) Rows, Gender, Episodes_Per_Gender, 
SUM(Episodes_Per_Gender) OVER (ORDER BY Month) Roll_Count
FROM UK_Stabbings_Gender$ 
WHERE GENDER = 'Male' AND Year LIKE '%2021' 
GROUP BY Year, Month, Gender, Episodes_Per_Gender

UNION

SELECT Year, Month, ROW_NUMBER () OVER (ORDER BY Month) Rows, Gender, Episodes_Per_Gender, 
SUM(Episodes_Per_Gender) OVER (ORDER BY Month) Roll_Count
FROM UK_Stabbings_Gender$ 
WHERE GENDER = 'Male' AND Year LIKE '%2022' 
GROUP BY Year, Month, Gender, Episodes_Per_Gender



-- 4) ANNUAL EPISODES FOR DISTINCT YEAR (2012 - 2013) & GENDER (FEMALE)

WITH Female_Annuals AS(
(SELECT Year, Month, Gender, Episodes_Per_Gender--, SUM(Episodes_Per_Gender) OVER (ORDER BY Month) Annuals
FROM UK_Stabbings_Gender$
WHERE Gender = 'Female' AND Year LIKE '%2012 -%' 
GROUP BY Year, Month, Gender, Episodes_Per_Gender))
SELECT Year, Gender, SUM(Episodes_Per_Gender) Annuals
FROM Female_Annuals
GROUP BY Year, Gender
ORDER BY Year



-- 5) ANNUAL EPISODES FOR DISTINCT YEAR (2012 - 2013) & GENDER (MALE)

WITH Male_Annuals AS(
(SELECT Year, Month, Gender, Episodes_Per_Gender--, SUM(Episodes_Per_Gender) OVER (ORDER BY Month) Annuals
FROM UK_Stabbings_Gender$
WHERE Gender = 'Male' AND Year LIKE '%2012 -%' 
GROUP BY Year, Month, Gender, Episodes_Per_Gender))
SELECT Year, Gender, SUM(Episodes_Per_Gender) Annuals
FROM Male_Annuals
GROUP BY Year, Gender
ORDER BY Year



-- 6) TOTAL SUMS OF Episodes PER GENDER FOR THE DECADE PERIOD

-- WITH Sums AS (
(SELECT 'Female' Gender, SUM(Episodes_Per_Gender) Gender_Sums
FROM UK_Stabbings_Gender$
WHERE Gender = 'Female')
UNION
(SELECT 'Male' 'Male', SUM(Episodes_Per_Gender) Male_Sum
FROM UK_Stabbings_Gender$
WHERE Gender = 'Male')
--) SELECT * FROM Sums


-- OR / ALTERNATIVELY


WITH Sums AS (
(SELECT Year, Month, Gender, Episodes_Per_Gender, 
SUM(Episodes_Per_Gender) Gen_Sums --OVER (PARTITION BY Month ORDER BY Month) Month_Roll_Count 
FROM UK_Stabbings_Gender$ 
WHERE GENDER = 'Female' AND Year BETWEEN '2012' AND '2022' 
GROUP BY Year, Month, Gender, Episodes_Per_Gender) 
UNION
(SELECT Year, Month, Gender, Episodes_Per_Gender, 
SUM(Episodes_Per_Gender) -- OVER (PARTITION BY Month ORDER BY Month) Month_Roll_Count 
FROM UK_Stabbings_Gender$ 
WHERE GENDER = 'Male' AND Year BETWEEN '2012' AND '2022' 
GROUP BY Year, Month, Gender, Episodes_Per_Gender) 
)
SELECT Gender, SUM(Episodes_Per_Gender) AS Genders_Sums
FROM Sums
GROUP BY Gender



-- 7) FEMALE TOTAL STABBINGS FOR THE DECADE PERIOD

SELECT SUM(Episodes_Per_Gender) Female_Sum
FROM UK_Stabbings_Gender$
WHERE Gender = 'Female'


-- OR / ALTERNATIVELY

WITH Female_Totals AS (
SELECT Year, Month, Gender, Episodes_Per_Gender, SUM(Episodes_Per_Gender) Gen_Sum
FROM UK_Stabbings_Gender$
WHERE Gender = 'Female'
GROUP BY Year, Month, Gender, Episodes_Per_Gender)
SELECT Gender, SUM(Gen_Sum) Female_Totals
FROM Female_Totals
GROUP BY Gender



-- 8) MALE TOTAL STABBINGS FOR THE DECADE PERIOD

SELECT SUM(Episodes_Per_Gender) Male_Sum
FROM UK_Stabbings_Gender$
WHERE Gender = 'Male'


-- OR / ALTERNATIVE

WITH Male_Totals AS (
SELECT Year, Month, Gender, Episodes_Per_Gender, SUM(Episodes_Per_Gender) Gen_Sum
FROM UK_Stabbings_Gender$
WHERE Gender = 'Male'
GROUP BY Year, Month, Gender, Episodes_Per_Gender)
SELECT Gender, SUM(Gen_Sum) Male_Totals
FROM Male_Totals
GROUP BY Gender



-- 9) FE/MALE MONTHLY PERCENTAGES

(SELECT ROW_NUMBER () OVER (PARTITION BY Year ORDER BY Year) Rows, Year, Month, Gender, Episodes_Per_Gender, Monthly_Episodes, 
ROUND((Episodes_Per_Gender/Monthly_Episodes)*100, 2) Monthly_Percentage 
FROM UK_Stabbings_Gender$                                                                                                                 
WHERE Gender = 'FEMALE'                                                                                                                    
GROUP BY  Year, Month, Gender, Episodes_Per_Gender, Monthly_Episodes, Annual_Episodes)
UNION
(SELECT ROW_NUMBER () OVER (PARTITION BY Year ORDER BY Year) Rows, Year, Month, Gender, Episodes_Per_Gender, Monthly_Episodes, 
ROUND((Episodes_Per_Gender/Monthly_Episodes)*100, 2) Monthly_Percentage  
FROM UK_Stabbings_Gender$
WHERE Gender = 'MALE'                                                                                                  
GROUP BY  Year, Month, Gender, Episodes_Per_Gender, Monthly_Episodes)
ORDER BY Year,Month 




-- 10) FEMALE ANNUAL PERCENTAGE

WITH Females AS ((
SELECT Year, Month, Gender, Episodes_Per_Gender, Monthly_Episodes, Annual_Episodes, SUM(Monthly_Episodes - Episodes_Per_Gender) Female
FROM UK_Stabbings_Gender$
WHERE Gender = 'Male' AND YEAR IS NOT  NULL
GROUP BY Year, Month, Gender, Episodes_Per_Gender, Monthly_Episodes, Annual_Episodes ))
SELECT Year, Annual_Episodes, SUM(Monthly_Episodes - Episodes_Per_Gender) Female, ROUND((SUM(Female)/Annual_Episodes)*100, 2) Female_Annual_Percentage
FROM Females
GROUP BY Year, Annual_Episodes
ORDER BY Year



-- 11) MALE ANNUAL PERCENTAGES 

WITH Males AS ((
SELECT Year, Month, Gender, Episodes_Per_Gender, Monthly_Episodes, Annual_Episodes, SUM(Monthly_Episodes - Episodes_Per_Gender) Male
FROM UK_Stabbings_Gender$
WHERE Gender = 'Female' AND YEAR IS NOT  NULL
GROUP BY Year, Month, Gender, Episodes_Per_Gender, Monthly_Episodes, Annual_Episodes ))
SELECT Year, Annual_Episodes, SUM(Monthly_Episodes - Episodes_Per_Gender) Male, ROUND((SUM(Male)/Annual_Episodes)*100, 2) Male_Annual_Percentage
FROM Males
GROUP BY Year, Annual_Episodes
ORDER BY Year

