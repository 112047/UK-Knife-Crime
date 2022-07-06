-- 1) COMPLETE TABLE

SELECT *
FROM UK_Stabbings_Totals$



-- 2) ANNUAL MAX STABBINGS PER MONTH FOR THE DECADE PERIOD

-- GROUPED BY MONTH -- SHOWING MONTHS

WITH Annual_Max_Stabbings AS(
(SELECT TOP 1 Year, Month, MAX (Monthly_Episodes) Max_Stabbings
FROM UK_Stabbings_Totals$
WHERE Year LIKE '%2012 -%'
GROUP BY Year, Month, Monthly_Episodes
ORDER BY MAX (Monthly_Episodes) DESC)
UNION
(SELECT TOP 1 Year, Month, MAX (Monthly_Episodes) Max_Stabbings
FROM UK_Stabbings_Totals$
WHERE Year LIKE '%2013 -%'
GROUP BY Year, Month, Monthly_Episodes
ORDER BY MAX (Monthly_Episodes) DESC)
UNION
(SELECT TOP 1 Year, Month, MAX (Monthly_Episodes) Max_Stabbings
FROM UK_Stabbings_Totals$
WHERE Year LIKE '%2014 -%'
GROUP BY Year, Month, Monthly_Episodes
ORDER BY MAX (Monthly_Episodes) DESC)
UNION
(SELECT TOP 1 Year, Month, MAX (Monthly_Episodes) Max_Stabbings
FROM UK_Stabbings_Totals$
WHERE Year LIKE '%2015 -%'
GROUP BY Year, Month, Monthly_Episodes
ORDER BY MAX (Monthly_Episodes) DESC)
UNION
(SELECT TOP 1 Year, Month, MAX (Monthly_Episodes) Max_Stabbings
FROM UK_Stabbings_Totals$
WHERE Year LIKE '%2016 -%'
GROUP BY Year, Month, Monthly_Episodes
ORDER BY MAX (Monthly_Episodes) DESC)
UNION
(SELECT TOP 1 Year, Month, MAX (Monthly_Episodes) Max_Stabbings
FROM UK_Stabbings_Totals$
WHERE Year LIKE '%2017 -%'
GROUP BY Year, Month, Monthly_Episodes
ORDER BY MAX (Monthly_Episodes) DESC)
UNION
(SELECT TOP 1 Year, Month, MAX (Monthly_Episodes) Max_Stabbings
FROM UK_Stabbings_Totals$
WHERE Year LIKE '%2018 -%'
GROUP BY Year, Month, Monthly_Episodes
ORDER BY MAX (Monthly_Episodes) DESC)
UNION
(SELECT TOP 1 Year, Month, MAX(Monthly_Episodes) Max_Stabbings
FROM UK_Stabbings_Totals$
WHERE Year LIKE '%2019 -%'
GROUP BY Year, Month, Monthly_Episodes
ORDER BY MAX(Monthly_Episodes) DESC)
UNION
(SELECT TOP 1 Year, Month, MAX(Monthly_Episodes) Max_Stabbings
FROM UK_Stabbings_Totals$
WHERE Year LIKE '%2020 -%'
GROUP BY Year, Month, Monthly_Episodes
ORDER BY MAX(Monthly_Episodes) DESC)
UNION
(SELECT TOP 1 Year, Month, MAX(Monthly_Episodes) Max_Stabbings
FROM UK_Stabbings_Totals$
WHERE Year LIKE '%2021 -%'
GROUP BY Year, Month, Monthly_Episodes
ORDER BY MAX(Monthly_Episodes) DESC)
)
SELECT * --Year, Month, MIN(Monthly_Episodes) Min_Stabbings
FROM Annual_Max_Stabbings
ORDER BY Year


-- NOT GROUPED BY MONTH - NOT SHOWING MONTHS

SELECT TOP 10 Year, MAX(Monthly_Episodes) Max_Stabbings
FROM UK_Stabbings_Totals$
GROUP BY Year
ORDER BY Year



-- 3) ANNUAL MIN STABBINGS PER MONTH FOR THE DECADE PERIOD

-- GROUPED BY MONTH -- SHOWING MONTHS

WITH Annual_Min_Stabbings AS(
(SELECT TOP 1 Year, Month, MIN(Monthly_Episodes) Min_Stabbings
FROM UK_Stabbings_Totals$
WHERE Year LIKE '%2012 -%'
GROUP BY Year, Month, Monthly_Episodes
ORDER BY MIN(Monthly_Episodes))
UNION
(SELECT TOP 1 Year, Month, MIN(Monthly_Episodes) Min_Stabbings
FROM UK_Stabbings_Totals$
WHERE Year LIKE '%2013 -%'
GROUP BY Year, Month, Monthly_Episodes
ORDER BY MIN(Monthly_Episodes))
UNION
(SELECT TOP 1 Year, Month, MIN(Monthly_Episodes) Min_Stabbings
FROM UK_Stabbings_Totals$
WHERE Year LIKE '%2014 -%'
GROUP BY Year, Month, Monthly_Episodes
ORDER BY MIN(Monthly_Episodes))
UNION
(SELECT TOP 1 Year, Month, MIN(Monthly_Episodes) Min_Stabbings
FROM UK_Stabbings_Totals$
WHERE Year LIKE '%2015 -%'
GROUP BY Year, Month, Monthly_Episodes
ORDER BY MIN(Monthly_Episodes))
UNION
(SELECT TOP 1 Year, Month, MIN(Monthly_Episodes) Min_Stabbings
FROM UK_Stabbings_Totals$
WHERE Year LIKE '%2016 -%'
GROUP BY Year, Month, Monthly_Episodes
ORDER BY MIN(Monthly_Episodes))
UNION
(SELECT TOP 1 Year, Month, MIN(Monthly_Episodes) Min_Stabbings
FROM UK_Stabbings_Totals$
WHERE Year LIKE '%2017 -%'
GROUP BY Year, Month, Monthly_Episodes
ORDER BY MIN(Monthly_Episodes))
UNION
(SELECT TOP 1 Year, Month, MIN(Monthly_Episodes) Min_Stabbings
FROM UK_Stabbings_Totals$
WHERE Year LIKE '%2018 -%'
GROUP BY Year, Month, Monthly_Episodes
ORDER BY MIN(Monthly_Episodes))
UNION
(SELECT TOP 1 Year, Month, MIN(Monthly_Episodes) Min_Stabbings
FROM UK_Stabbings_Totals$
WHERE Year LIKE '%2019 -%'
GROUP BY Year, Month, Monthly_Episodes
ORDER BY MIN(Monthly_Episodes))
UNION
(SELECT TOP 1 Year, Month, MIN(Monthly_Episodes) Min_Stabbings
FROM UK_Stabbings_Totals$
WHERE Year LIKE '%2020 -%'
GROUP BY Year, Month, Monthly_Episodes
ORDER BY MIN(Monthly_Episodes))
UNION
(SELECT TOP 1 Year, Month, MIN(Monthly_Episodes) Min_Stabbings
FROM UK_Stabbings_Totals$
WHERE Year LIKE '%2021 -%'
GROUP BY Year, Month, Monthly_Episodes
ORDER BY MIN(Monthly_Episodes))
)
SELECT * --Year, Month, MIN(Monthly_Episodes) Min_Stabbings
FROM Annual_Min_Stabbings
ORDER BY Year


-- NOT GROUPED BY MONTH - NOT SHOWING MONTHS

SELECT TOP 10 Year, MIN(Monthly_Episodes) Max_Stabbings
FROM UK_Stabbings_Totals$
GROUP BY Year
ORDER BY Year



-- 4) TOTAL STABBINGSS PER YEAR FOR THE DECADE PERIOD

SELECT TOP 10 Year, Annual_Episodes
FROM UK_Stabbings_Totals$
-- WHERE Year BETWEEN '2012 - 2013' AND '2021 - 2022'
GROUP BY Year, Annual_Episodes
ORDER BY Year, Annual_Episodes



-- 5) TOTAL STABBINGSS FOR FIRST FIVE YEARS OF THE DECADE PERIOD

WITH Tops AS (
SELECT TOP 10 (Annual_Episodes) AS Top_
FROM UK_Stabbings_Totals$
WHERE Year BETWEEN '2012 - 2013' AND '2016 - 2017'
GROUP BY Year, Annual_Episodes)
SELECT SUM(Top_) AS Top_Annuals
FROM Tops



-- 6) TOTAL STABBINGSS FOR LAST FIVE YEARS OF THE DECADE PERIOD

WITH Bottom AS (
SELECT TOP 10 (Annual_Episodes) AS Bottoms
FROM UK_Stabbings_Totals$
WHERE Year BETWEEN '2017 - 2018' AND '2021 - 2022'
GROUP BY Year, Annual_Episodes)
SELECT SUM(Bottoms) AS Bottom_Annuals
FROM Bottom



-- 7) TOP-V-BOTTOM TOTALS FOR THE DECADE PERIOD

CREATE DATABASE TVB
USE TVB
--DROP TABLE IF EXISTS
CREATE TABLE Top_v_Bottoms(
Year NVARCHAR (255),
Annual_Episodes FLOAT);
--Year_Bottom NVARCHAR (255),
--Annual_Episodes_Bottom FLOAT);
INSERT INTO Top_v_Bottom VALUES ('2012 - 2013', 3888) --, '2017 - 2018', 5053)
INSERT INTO Top_v_Bottom VALUES ('2013 - 2014', 3730) --, '2018 - 2019', 5149)
INSERT INTO Top_v_Bottom VALUES ('2014 - 2015', 3643) --, '2019 - 2020', 4757)
INSERT INTO Top_v_Bottom VALUES ('2015 - 2016', 4119) --, '2020 - 2021', 4091)
INSERT INTO Top_v_Bottom VALUES ('2016 - 2017', 4434) --, '2021 - 2022', 4108)
INSERT INTO Top_v_Bottom VALUES ('2017 - 2018', 5053)
INSERT INTO Top_v_Bottom VALUES ('2018 - 2019', 5149)
INSERT INTO Top_v_Bottom VALUES ('2019 - 2020', 4757)
INSERT INTO Top_v_Bottom VALUES ('2020 - 2021', 4091)
INSERT INTO Top_v_Bottom VALUES ('2021 - 2022', 4108)

SELECT * FROM Top_v_Bottom

SELECT * FROM Tops_v_Bottoms



-- 8) TOP VS BOTTOM HEAVY ANNUAL STABBINGS FOR DECADE PERIOD - (BOTTOM-HEAVY)

SELECT SUM(Annual_Episodes_Top) Top_, SUM(Annual_Episodes_Bottom) Bottom_
FROM Tops_v_Bottoms



-- 9) DIFFERENCE BETWEEN TOP AND BOTTOM YEARS OF THE DECADE PERIOD

SELECT (SUM(Annual_Episodes_Bottom) - SUM(Annual_Episodes_Top)) Annual_Difference
FROM Tops_v_Bottoms



-- 10) SUM BETWEEN TOP AND BOTTOM YEARS OF THE DECADE PERIOD

SELECT (SUM(Annual_Episodes_Bottom) + SUM(Annual_Episodes_Top)) Annual_Sum
FROM Tops_v_Bottoms

-- OR AN ALTERTANATIVE CODE

WITH Totals AS(
(SELECT TOP 10 Year, Annual_Episodes
FROM UK_Stabbings_Totals$
GROUP BY Year, Annual_Episodes))
SELECT SUM(Annual_Episodes) Annual_Sum
FROM Totals



-- 11) PERCENTAGE DIFFERENCE TOP VS BOTTOM YEARS OF THE DECADE PERIOD

SELECT ROUND((SUM(Annual_Episodes_Top)/(SUM(Annual_Episodes_Bottom) + SUM(Annual_Episodes_Top)))*100, 2) Top_Percent
FROM Tops_v_Bottoms

SELECT ROUND((SUM(Annual_Episodes_Bottom)/(SUM(Annual_Episodes_Bottom) + SUM(Annual_Episodes_Top)))*100, 2) Bottom_Percent
FROM Tops_v_Bottoms



-- 12) MAX WINTER STABBINGS FOR THE DECADE PERIOD

WITH Seasons AS (
(SELECT Year, Month, SUM(Monthly_Episodes) Seasons_Totals
FROM UK_Stabbings_Totals$
WHERE Month IN ('December', 'January', 'February')
GROUP BY Month, Year)) --AS Seasons)
SELECT  SUM(Seasons_Totals) Winter_Stabbings
FROM Seasons



-- 13) MAX SPRING STABBINGS FOR THE DECADE PERIOD

WITH Seasons AS (
(SELECT Year, Month, SUM(Monthly_Episodes) Seasons_Totals
FROM UK_Stabbings_Totals$
WHERE Month IN ('March', 'April', 'May')
GROUP BY Month, Year)) --AS Seasons)
SELECT  SUM(Seasons_Totals) Spring_Stabbings
FROM Seasons



-- 14) MAX SUMMER STABBINGS FOR THE DECADE PERIOD

WITH Seasons AS (
(SELECT Year, Month, SUM(Monthly_Episodes) Seasons_Totals
FROM UK_Stabbings_Totals$
WHERE Month IN ('June', 'July', 'August')
GROUP BY Month, Year)) --AS Seasons)
SELECT  SUM(Seasons_Totals) Summer_Stabbings
FROM Seasons




-- 15) MAX FALL STABBINGS FOR THE DECADE PERIOD

WITH Seasons AS (
(SELECT Year, Month, SUM(Monthly_Episodes) Seasons_Totals
FROM UK_Stabbings_Totals$
WHERE Month IN ('September', 'October', 'November')
GROUP BY Month, Year)) --AS Seasons)
SELECT  SUM(Seasons_Totals) Fall_Stabbings
FROM Seasons



-- 16) SEASONS' TABLE

--DROP TABLE IF EXISTS
CREATE TABLE Season (
Seasons NVARCHAR (255),
Winter FLOAT,
Spring FLOAT,
Summer FLOAT,
Fall FLOAT,
Totals FLOAT
);
INSERT INTO Season VALUES ('Decade_Episodes', 10033, 10352, 11861, 10726, 42972)
INSERT INTO Seasons VALUES ('Winter', 10033)
INSERT INTO Seasons VALUES ('Spring', 10352)
INSERT INTO Seasons VALUES ('Summer', 11861)
INSERT INTO Seasons VALUES ('Fall', 10726);
-- UPDATE Seasons SET Season = 'WINTER' WHERE Decade_Stabbings = 10033
-- UPDATE Seasons SET Season = 'SPRING' WHERE Decade_Stabbings = 10352
-- UPDATE Seasons SET Season = 'SUMMER' WHERE Decade_Stabbings = 11861
-- UPDATE Seasons SET Season = 'FALL' WHERE Decade_Stabbings = 10726

SELECT *
FROM Seasons


SELECT SUM(Decade_Stabbings)
FROM Seasons


SELECT *
FROM Season



-- 17) RATIO OF TOTAL SEASONAL STABBINGS FOR THE DECADE

(SELECT 'Winter' Seasons, ROUND((Winter/Totals)*100, 2) AS Percentage
FROM Season)
UNION
(SELECT 'Spring' 'Spring', ROUND((Spring/Totals)*100, 2) AS Percentage
FROM Season)
UNION
(SELECT 'Summer' 'Summer', ROUND((Summer/Totals)*100, 2) AS Percentage
FROM Season)
UNION
(SELECT 'Fall' 'Fall' , ROUND((Fall/Totals)*100, 2) AS Percentage
FROM Season)

