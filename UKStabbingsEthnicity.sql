-- 1) COMPLETE TABLE

SELECT * 
FROM UK_Stabbings_Ethnicity$



-- 2) MIN ASIAN STABBINGS FOR THE DECADE PERIOD

-- WITH Min_Asian AS ((
SELECT TOP 1 * 
FROM UK_Stabbings_Ethnicity$
WHERE Ethnicity = 'Asian or Asian British' 
GROUP BY Episodes_Per_Ethnicity, Ethnicity, Year, Month, Monthly_Episodes, Annual_Episodes
-- )) SELECT TOP 1 Month, Assaults_Per_Ethnicity, Monthly_Assaults, Annual_Assaults
-- FROM Min_Asian
-- GROUP BY Assaults_Per_Ethnicity, Monthly_Assaults, Annual_Assaults, Month


 
-- 3) MIN BLACK STABBINGS FOR THE DECADE PERIOD

-- WITH Min_Black AS (( 
SELECT TOP 1*
FROM UK_Stabbings_Ethnicity$
WHERE Ethnicity = 'Black or Black British' 
GROUP BY Episodes_Per_Ethnicity, Ethnicity, Year, Month, Monthly_Episodes, Annual_Episodes
-- )) SELECT TOP 1 Month, Assaults_Per_Ethnicity, Monthly_Assaults, Annual_Assaults
-- FROM Min_Black
-- GROUP BY Assaults_Per_Ethnicity, Monthly_Assaults, Annual_Assaults, Month
	


-- 4) MIN WHITE STABBINGS FOR THE DECADE PERIOD

-- WITH Min_White AS((
SELECT TOP 1 *
FROM UK_Stabbings_Ethnicity$
WHERE Ethnicity = 'White' 
GROUP BY Episodes_Per_Ethnicity, Ethnicity, Year, Month, Monthly_Episodes, Annual_Episodes
-- )) SELECT TOP 1 Month, Assaults_Per_Ethnicity, Monthly_Assaults, Annual_Assaults
-- FROM Min_White
-- GROUP BY Assaults_Per_Ethnicity, Monthly_Assaults, Annual_Assaults, Month



-- 5) MAX ASIAN STABBINGS FOR THE DECADE PERIOD

SELECT *
FROM UK_Stabbings_Ethnicity$
WHERE Ethnicity = 'Asian or Asian British' 
GROUP BY Episodes_Per_Ethnicity, Ethnicity, Year, Month, Monthly_Episodes, Annual_Episodes
ORDER BY Episodes_Per_Ethnicity
OFFSET 119 ROWS
FETCH NEXT 1 ROW ONLY



-- 6) MAX BLACK STABBINGS FOR THE DECADE PERIOD

SELECT *
FROM UK_Stabbings_Ethnicity$
WHERE Ethnicity = 'Black or Black British' 
GROUP BY Episodes_Per_Ethnicity, Ethnicity, Year, Month, Monthly_Episodes, Annual_Episodes
ORDER BY Episodes_Per_Ethnicity
OFFSET 119 ROWS
FETCH NEXT 1 ROW ONLY



-- 7) MAX WHITE STABBINGS FOR THE DECADE PERIOD

SELECT *
FROM UK_Stabbings_Ethnicity$
WHERE Ethnicity = 'White' 
GROUP BY Episodes_Per_Ethnicity, Ethnicity, Year, Month, Monthly_Episodes, Annual_Episodes
ORDER BY Episodes_Per_Ethnicity
OFFSET 119 ROWS
FETCH NEXT 1 ROW ONLY



-- 8) MIN STABBINGS PER ETHNICITY FOR THE DECADE PERIOD

(SELECT TOP 1* 
FROM UK_Stabbings_Ethnicity$
WHERE Ethnicity = 'Asian or Asian British' 
GROUP BY Episodes_Per_Ethnicity, Ethnicity, Year, Month, Monthly_Episodes, Annual_Episodes)
UNION
(SELECT TOP 1 *
FROM UK_Stabbings_Ethnicity$
WHERE Ethnicity = 'Black or Black British' 
GROUP BY Episodes_Per_Ethnicity, Ethnicity, Year, Month, Monthly_Episodes, Annual_Episodes)
UNION
(SELECT TOP 1 *
FROM UK_Stabbings_Ethnicity$
WHERE Ethnicity = 'White' 
GROUP BY Episodes_Per_Ethnicity, Ethnicity, Year, Month, Monthly_Episodes, Annual_Episodes)



-- 9) MAX STABBINGS PER ETHNICITY FOR THE DECADE PERIOD

WITH Max_Ethnicities AS( 
(SELECT *  
FROM UK_Stabbings_Ethnicity$
WHERE Ethnicity = 'Asian or Asian British' 
GROUP BY Episodes_Per_Ethnicity, Ethnicity, Year, Month, Monthly_Episodes, Annual_Episodes
ORDER BY Episodes_Per_Ethnicity
OFFSET 119 ROWS
FETCH NEXT 1 ROW ONLY)
UNION
(SELECT *
FROM UK_Stabbings_Ethnicity$
WHERE Ethnicity = 'Black or Black British' 
GROUP BY Episodes_Per_Ethnicity, Ethnicity, Year, Month, Monthly_Episodes, Annual_Episodes
ORDER BY Episodes_Per_Ethnicity
OFFSET 119 ROWS
FETCH NEXT 1 ROW ONLY)
UNION
(SELECT *
FROM UK_Stabbings_Ethnicity$
WHERE Ethnicity = 'White' 
GROUP BY Episodes_Per_Ethnicity, Ethnicity, Year, Month, Monthly_Episodes, Annual_Episodes
ORDER BY Year
OFFSET 119 ROWS
FETCH NEXT 1 ROW ONLY)
)
SELECT *
FROM Max_Ethnicities
GROUP BY Episodes_Per_Ethnicity, Ethnicity, Year, Month, Monthly_Episodes, Annual_Episodes



-- 10) ROW COUNT DISTINCT MIN STABBINGS PER MONTH ACROSS ALL ETHNICITIES FOR THE DECADE PERIOD

SELECT ROW_NUMBER () OVER (PARTITION BY Month ORDER BY Year) Rows, Year, Month, Ethnicity, Episodes_Per_Ethnicity, 
MIN(Episodes_Per_Ethnicity) OVER (PARTITION BY Month ORDER BY Year) Min_Eth
FROM UK_Stabbings_Ethnicity$
WHERE Year IS NOT NULL 
GROUP BY Episodes_Per_Ethnicity, Ethnicity, Year, Month
ORDER BY Year



-- 11) ROW COUNT DISTINCT MAX STABBINGS PER MONTH ACROSS ALL ETHNICITIES FOR THE DECADE PERIOD

SELECT ROW_NUMBER () OVER (PARTITION BY Month ORDER BY Year) Rows, Year, Month, Ethnicity, Episodes_Per_Ethnicity, 
MAX(Episodes_Per_Ethnicity) OVER (PARTITION BY Month ORDER BY Year) Max_Eth
FROM UK_Stabbings_Ethnicity$
WHERE Year IS NOT NULL 
GROUP BY Episodes_Per_Ethnicity, Ethnicity, Year, Month
ORDER BY Year 



-- 12) MIN COMBINED STABBINGS PER MONTH FOR DECADE PERIOD ACROSS ALL ETHNICITIES

WITH Ethnic_Min AS (
(SELECT ROW_NUMBER () OVER (PARTITION BY Year ORDER By Month) Rows, Year, Month, Ethnicity, Episodes_Per_Ethnicity, Monthly_Episodes, Annual_Episodes 
FROM UK_Stabbings_Ethnicity$
WHERE Year IS NOT NULL  AND Ethnicity = 'Asian or Asian British' 
GROUP BY Year, Month, Ethnicity, Episodes_Per_Ethnicity, Monthly_Episodes, Annual_Episodes)
UNION
(SELECT ROW_NUMBER () OVER (PARTITION BY Year ORDER By Month) Rows, Year, Month, Ethnicity, Episodes_Per_Ethnicity, Monthly_Episodes, Annual_Episodes
FROM UK_Stabbings_Ethnicity$
WHERE Year IS NOT NULL  AND Ethnicity = 'Black or Black British' 
GROUP BY Year, Month, Ethnicity, Episodes_Per_Ethnicity, Monthly_Episodes, Annual_Episodes)
UNION
(SELECT ROW_NUMBER () OVER (PARTITION BY Year ORDER By Month) Rows, Year, Month, Ethnicity, Episodes_Per_Ethnicity, Monthly_Episodes, Annual_Episodes
FROM UK_Stabbings_Ethnicity$
WHERE Year IS NOT NULL  AND Ethnicity = 'White' 
GROUP BY Year, Month, Ethnicity, Episodes_Per_Ethnicity, Monthly_Episodes, Annual_Episodes)
) 
SELECT ROW_NUMBER () OVER (PARTITION BY Year ORDER By Month) Rows, Year, Month, MIN(Episodes_Per_Ethnicity) Min_Stabbings, Monthly_Episodes, Annual_Episodes
FROM Ethnic_Min
GROUP BY Year, Month, Monthly_Episodes, Annual_Episodes
ORDER BY Year



-- 13) MAX COMBINED STABBINGS PER MONTH FOR DECADE PERIOD ACROSS ALL ETHNICITIES

WITH Ethnic_Max AS (
(SELECT ROW_NUMBER () OVER (PARTITION BY Year ORDER By Month) Rows, Year, Month, Ethnicity, Episodes_Per_Ethnicity, Monthly_Episodes, Annual_Episodes 
FROM UK_Stabbings_Ethnicity$
WHERE Year IS NOT NULL  AND Ethnicity = 'Asian or Asian British' 
GROUP BY Year, Month, Ethnicity, Episodes_Per_Ethnicity, Monthly_Episodes, Annual_Episodes)
UNION
(SELECT ROW_NUMBER () OVER (PARTITION BY Year ORDER By Month) Rows, Year, Month, Ethnicity, Episodes_Per_Ethnicity, Monthly_Episodes, Annual_Episodes
FROM UK_Stabbings_Ethnicity$
WHERE Year IS NOT NULL  AND Ethnicity = 'Black or Black British' 
GROUP BY Year, Month, Ethnicity, Episodes_Per_Ethnicity, Monthly_Episodes, Annual_Episodes)
UNION
(SELECT ROW_NUMBER () OVER (PARTITION BY Year ORDER By Month) Rows, Year, Month, Ethnicity, Episodes_Per_Ethnicity, Monthly_Episodes, Annual_Episodes
FROM UK_Stabbings_Ethnicity$
WHERE Year IS NOT NULL  AND Ethnicity = 'White' 
GROUP BY Year, Month, Ethnicity, Episodes_Per_Ethnicity, Monthly_Episodes, Annual_Episodes)
) 
SELECT ROW_NUMBER () OVER (PARTITION BY Year ORDER By Month) Rows, Year, Month, MAX(Episodes_Per_Ethnicity) Max_Stabbings, Monthly_Episodes, Annual_Episodes
FROM Ethnic_Max
GROUP BY Year, Month, Monthly_Episodes, Annual_Episodes
ORDER BY Year

