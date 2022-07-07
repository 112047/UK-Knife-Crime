-- 1) ENTIRE TABLE

SELECT *
FROM UK_Stabbings_Age$



-- 2) STABBINGS ROLL COUNT PER AGE GROUP PER YEAR FOR THE DECADE PERIOD 


(SELECT ROW_NUMBER () OVER (PARTITION BY Year ORDER BY Month) Rows, Year, Month, Age_Group, Episodes_Per_Age_Group, 
SUM(Episodes_Per_Age_Group) OVER (PARTITION BY Year ORDER BY Month) RollAge, Monthly_Episodes, Annual_Episodes
FROM UK_Stabbings_Age$
WHERE Age_Group BETWEEN '10y-to-19y' AND '50y-to-59y' AND Year BETWEEN '2012 - 2013' AND '2021 - 2022'
GROUP BY Year, Month, Episodes_Per_Age_Group, Age_Group, Monthly_Episodes, Annual_Episodes

-- OR / ALTERNATIVELY


(SELECT ROW_NUMBER () OVER (PARTITION BY Year ORDER BY Month) Rows, Year, Month, Age_Group, Episodes_Per_Age_Group, 
SUM(Episodes_Per_Age_Group) OVER (PARTITION BY Year ORDER BY Month) RollAge, Monthly_Episodes, Annual_Episodes
FROM UK_Stabbings_Age$ 
WHERE Age_Group = '10y-to-19y'
GROUP BY Year, Month, Episodes_Per_Age_Group, Age_Group, Monthly_Episodes, Annual_Episodes)
 
UNION
 
(SELECT ROW_NUMBER () OVER (PARTITION BY Year ORDER BY Month) Rows, Year, Month, Age_Group, Episodes_Per_Age_Group, 
SUM(Episodes_Per_Age_Group) OVER (PARTITION BY Year ORDER BY Month) RollAge, Monthly_Episodes, Annual_Episodes
FROM UK_Stabbings_Age$ 
WHERE Age_Group = '20y-to-29y'
GROUP BY Year, Month, Episodes_Per_Age_Group, Age_Group, Monthly_Episodes, Annual_Episodes)
 
UNION
 
(SELECT ROW_NUMBER () OVER (PARTITION BY Year ORDER BY Month) Rows, Year, Month, Age_Group, Episodes_Per_Age_Group, 
SUM(Episodes_Per_Age_Group) OVER (PARTITION BY Year ORDER BY Month) RollAge, Monthly_Episodes, Annual_Episodes
FROM UK_Stabbings_Age$ 
WHERE Age_Group = '30y-to-39y'
GROUP BY Year, Month, Episodes_Per_Age_Group, Age_Group, Monthly_Episodes, Annual_Episodes)
 
UNION
 
(SELECT ROW_NUMBER () OVER (PARTITION BY Year ORDER BY Month) Rows, Year, Month, Age_Group, Episodes_Per_Age_Group, 
SUM(Episodes_Per_Age_Group) OVER (PARTITION BY Year ORDER BY Month) RollAge, Monthly_Episodes, Annual_Episodes
FROM UK_Stabbings_Age$ 
WHERE Age_Group = '40y-to-49y' 
GROUP BY Year, Month, Episodes_Per_Age_Group, Age_Group, Monthly_Episodes, Annual_Episodes)
 
UNION
 
(SELECT ROW_NUMBER () OVER (PARTITION BY Year ORDER BY Month) Rows, Year, Month, Age_Group, Episodes_Per_Age_Group, 
SUM(Episodes_Per_Age_Group) OVER (PARTITION BY Year ORDER BY Month) RollAge, Monthly_Episodes, Annual_Episodes
FROM UK_Stabbings_Age$ 
WHERE Age_Group = '50y-to-59y' 
GROUP BY Year, Month, Episodes_Per_Age_Group, Age_Group, Monthly_Episodes, Annual_Episodes)
ORDER BY Age_Group, Year, Month, Episodes_Per_Age_Group



-- 3) AGE GROUP AVGS PER YEAR FOR THE DECADE
 
 
 WITH Age_Avgs AS ((
SELECT TOP 10 Year, Age_Group, AVG(Episodes_Per_Age_Group) OVER (PARTITION BY Year ORDER BY Year) Age_Group_Avg
FROM(
SELECT Year, Month, Age_Group, Episodes_Per_Age_Group 
FROM UK_Stabbings_Age$
WHERE Age_Group BETWEEN '10y-to-19y' AND '50y-to-59y' AND Year BETWEEN '2012 - 2013' AND '2021 - 2022'

GROUP BY Year, Month,  Age_Group, Episodes_Per_Age_Group
ORDER BY Month, Year  --) 
   
  
--  OR / ALTERNATIVELY

WITH Age_Avgs AS (
(SELECT TOP 10 Year, Age_Group, AVG(Episodes_Per_Age_Group) OVER (PARTITION BY Year ORDER BY Year) Age_Group_Avg
FROM(
SELECT Year, Month, Age_Group, Episodes_Per_Age_Group 
FROM UK_Stabbings_Age$
WHERE Age_Group = '10y-to-19y')_   -- WHERE Age_Group BETWEEN '10y-to-19y' AND '50y-to-59y' AND Year BETWEEN '2012 - 2013' AND '2021 - 2022'

GROUP BY Year, Month,  Age_Group, Episodes_Per_Age_Group
ORDER BY Month, Year) 
  
UNION  
  
(SELECT TOP 10 Year,  Age_Group, AVG(Episodes_Per_Age_Group) OVER (PARTITION BY Year ORDER BY Year) Age_Group_Avg
FROM(
SELECT Year, Month, Age_Group, Episodes_Per_Age_Group 
FROM UK_Stabbings_Age$
WHERE Age_Group = '20y-to-29y')_
GROUP BY Year, Month,  Age_Group, Episodes_Per_Age_Group
ORDER BY Month, Year)
  
UNION  
  
(SELECT TOP 10 Year,  Age_Group, AVG(Episodes_Per_Age_Group) OVER (PARTITION BY Year ORDER BY Year) Age_Group_Avg
FROM(
SELECT Year, Month, Age_Group, Episodes_Per_Age_Group 
FROM UK_Stabbings_Age$
WHERE Age_Group = '30y-to-39y')_
GROUP BY Year, Month,  Age_Group, Episodes_Per_Age_Group
ORDER BY Month, Year)
  
UNION  
  
(SELECT TOP 10 Year,  Age_Group, AVG(Episodes_Per_Age_Group) OVER (PARTITION BY Year ORDER BY Year) Age_Group_Avg
FROM(
SELECT Year, Month, Age_Group, Episodes_Per_Age_Group 
FROM UK_Stabbings_Age$
WHERE Age_Group = '40y-to-49y')_
GROUP BY Year, Month,  Age_Group, Episodes_Per_Age_Group
ORDER BY Month, Year)
  
UNION  
  
(SELECT TOP 10 Year,  Age_Group, AVG(Episodes_Per_Age_Group) OVER (PARTITION BY Year ORDER BY Year) Age_Group_Avg
FROM(
SELECT Year, Month, Age_Group, Episodes_Per_Age_Group 
FROM UK_Stabbings_Age$
WHERE Age_Group = '50y-to-59y')_
GROUP BY Year, Month,  Age_Group, Episodes_Per_Age_Group
ORDER BY Month, Year)
)
 
SELECT ROW_NUMBER () OVER (PARTITION BY Age_Group ORDER BY Year, Age_Group) Rows , * 
FROM  Age_Avgs



-- 4) AGE GROUP MIN PER YEAR FOR THE DECADE

WITH MinAge AS(
(SELECT ROW_NUMBER () OVER (PARTITION BY Year ORDER BY Year) Rows, Year, Month, Age_Group, MIN(Episodes_Per_Age_Group) MinAge
FROM (
SELECT ROW_NUMBER () OVER (PARTITION BY Year ORDER BY Year) Rows, Year, Month, Age_Group, Episodes_Per_Age_Group
FROM UK_Stabbings_Age$
WHERE Age_Group = '10y-to-19y' 
GROUP BY Year, Month, Age_Group, Episodes_Per_Age_Group)_
WHERE Rows = 1
GROUP BY Year, Month, Age_Group, Episodes_Per_Age_Group)
  
UNION

(SELECT ROW_NUMBER () OVER (PARTITION BY Year ORDER BY Year) Rows, Year, Month, Age_Group, MIN(Episodes_Per_Age_Group) MinAge
FROM (
SELECT ROW_NUMBER () OVER (PARTITION BY Year ORDER BY Year) Rows, Year, Month, Age_Group, Episodes_Per_Age_Group
FROM UK_Stabbings_Age$
WHERE Age_Group = '20y-to-29y' 
GROUP BY Year, Month, Age_Group, Episodes_Per_Age_Group)_
WHERE Rows = 1
GROUP BY Year, Month, Age_Group, Episodes_Per_Age_Group)
  
UNION
  
(SELECT ROW_NUMBER () OVER (PARTITION BY Year ORDER BY Year) Rows, Year, Month, Age_Group, MIN(Episodes_Per_Age_Group) MinAge
FROM (
SELECT ROW_NUMBER () OVER (PARTITION BY Year ORDER BY Year) Rows, Year, Month, Age_Group, Episodes_Per_Age_Group
FROM UK_Stabbings_Age$
WHERE Age_Group = '30y-to-39y' 
GROUP BY Year, Month, Age_Group, Episodes_Per_Age_Group)_
WHERE Rows = 1
GROUP BY Year, Month, Age_Group, Episodes_Per_Age_Group)
  
UNION
  
(SELECT ROW_NUMBER () OVER (PARTITION BY Year ORDER BY Year) Rows, Year, Month, Age_Group, MIN(Episodes_Per_Age_Group) MinAge
FROM (
SELECT ROW_NUMBER () OVER (PARTITION BY Year ORDER BY Year) Rows, Year, Month, Age_Group, Episodes_Per_Age_Group
FROM UK_Stabbings_Age$
WHERE Age_Group = '40y-to-49y' 
GROUP BY Year, Month, Age_Group, Episodes_Per_Age_Group)_
WHERE Rows = 1
GROUP BY Year, Month, Age_Group, Episodes_Per_Age_Group)
  
UNION
  
(SELECT ROW_NUMBER () OVER (PARTITION BY Year ORDER BY Year) Rows, Year, Month, Age_Group, MIN(Episodes_Per_Age_Group) MinAge
FROM (
SELECT ROW_NUMBER () OVER (PARTITION BY Year ORDER BY Year) Rows, Year, Month, Age_Group, Episodes_Per_Age_Group
FROM UK_Stabbings_Age$
WHERE Age_Group = '50y-to-59y' 
GROUP BY Year, Month, Age_Group, Episodes_Per_Age_Group)_
WHERE Rows = 1
GROUP BY Year, Month, Age_Group, Episodes_Per_Age_Group)
)
 
SELECT ROW_NUMBER () OVER (PARTITION BY Year ORDER BY Year) Rows, Year, Month, Age_Group, MinAge 
FROM MinAge
ORDER BY Year, Age_Group ASC, MinAge, Month




-- 5) AGE GROUP MAX PER YEAR FOR THE DECADE

WITH MaxAge AS(
(SELECT ROW_NUMBER () OVER (PARTITION BY Year ORDER BY Year) Rows, Year, Month, Age_Group, MAX(Episodes_Per_Age_Group) MaxAge
FROM (
SELECT ROW_NUMBER () OVER (PARTITION BY Year ORDER BY Year) Rows, Year, Month, Age_Group, Episodes_Per_Age_Group
FROM UK_Stabbings_Age$
WHERE Age_Group = '10y-to-19y' 
GROUP BY Year, Month, Age_Group, Episodes_Per_Age_Group)_
WHERE Rows = 10
GROUP BY Year, Month, Age_Group, Episodes_Per_Age_Group)
UNION
(SELECT ROW_NUMBER () OVER (PARTITION BY Year ORDER BY Year) Rows, Year, Month, Age_Group, MAX(Episodes_Per_Age_Group) MaxAge
FROM (
SELECT ROW_NUMBER () OVER (PARTITION BY Year ORDER BY Year) Rows, Year, Month, Age_Group, Episodes_Per_Age_Group
FROM UK_Stabbings_Age$
WHERE Age_Group = '20y-to-29y' 
GROUP BY Year, Month, Age_Group, Episodes_Per_Age_Group)_
WHERE Rows = 10
GROUP BY Year, Month, Age_Group, Episodes_Per_Age_Group)
UNION
(SELECT ROW_NUMBER () OVER (PARTITION BY Year ORDER BY Year) Rows, Year, Month, Age_Group, MAX(Episodes_Per_Age_Group) MaxAge
FROM (
SELECT ROW_NUMBER () OVER (PARTITION BY Year ORDER BY Year) Rows, Year, Month, Age_Group, Episodes_Per_Age_Group
FROM UK_Stabbings_Age$
WHERE Age_Group = '30y-to-39y' 
GROUP BY Year, Month, Age_Group, Episodes_Per_Age_Group)_
WHERE Rows = 10
GROUP BY Year, Month, Age_Group, Episodes_Per_Age_Group)
UNION
(SELECT ROW_NUMBER () OVER (PARTITION BY Year ORDER BY Year) Rows, Year, Month, Age_Group, MAX(Episodes_Per_Age_Group) MaxAge
FROM (
SELECT ROW_NUMBER () OVER (PARTITION BY Year ORDER BY Year) Rows, Year, Month, Age_Group, Episodes_Per_Age_Group
FROM UK_Stabbings_Age$
WHERE Age_Group = '40y-to-49y' 
GROUP BY Year, Month, Age_Group, Episodes_Per_Age_Group)_
WHERE Rows = 10
GROUP BY Year, Month, Age_Group, Episodes_Per_Age_Group)
UNION
(SELECT ROW_NUMBER () OVER (PARTITION BY Year ORDER BY Year) Rows, Year, Month, Age_Group, MAX(Episodes_Per_Age_Group) MaxAge
FROM (
SELECT ROW_NUMBER () OVER (PARTITION BY Year ORDER BY Year) Rows, Year, Month, Age_Group, Episodes_Per_Age_Group
FROM UK_Stabbings_Age$
WHERE Age_Group = '50y-to-59y' 
GROUP BY Year, Month, Age_Group, Episodes_Per_Age_Group)_
WHERE Rows = 10
GROUP BY Year, Month, Age_Group, Episodes_Per_Age_Group)
) 
SELECT ROW_NUMBER () OVER (PARTITION BY Year ORDER BY Year) Rows, Year, Month, Age_Group, MaxAge 
FROM MaxAge
ORDER BY Year, Age_Group ASC, MaxAge, Month



-- 6) MONTHLY AND ANUUAL PERCENTAGES FOR ALL AGE GROUPS FOR THE DECADE

SELECT ROW_NUMBER () OVER (PARTITION BY Year ORDER BY Year) Rows, 
Year, Month, Age_Group, Episodes_Per_Age_Group, Monthly_Episodes, 
ROUND((Episodes_Per_Age_Group/Monthly_Episodes)*100, 2) MonthlyPercent,
Annual_Episodes, ROUND((Monthly_Episodes/Annual_Episodes)*100, 2) AnnualPercent 
FROM UK_Stabbings_Age$
WHERE Year IS NOT NULL
GROUP BY Year, Month, Age_Group, Episodes_Per_Age_Group, Monthly_Episodes, Annual_Episodes







