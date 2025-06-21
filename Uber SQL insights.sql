CREATE DATABASE IF NOT EXISTS uber_analysis;
USE uber_analysis;
SELECT * FROM uber_analysis.uber;
-- OBJECTIVE 1- CHART 1
SELECT 
    Cleaned_Pickup_Point,
    Cleaned_Status,
    COUNT(`Request id`) AS total_requests
FROM 
    uber_analysis.uber
GROUP BY 
    Cleaned_Pickup_Point,
    Cleaned_Status
ORDER BY 
    Cleaned_Pickup_Point,
    Cleaned_Status;
-- OBJECTIVE 1- CHART 2
USE uber_analysis;
SELECT 
    Cleaned_Pickup_Point,
    COUNT(`Request id`) AS cancelled_trips
FROM 
    uber_analysis.uber
WHERE 
    Cleaned_Status = 'Cancelled'
GROUP BY 
    Cleaned_Pickup_Point;
-- OBJECTIVE 2- CHART 1
USE uber_analysis;
SELECT 
    u.`DAY TYPE` AS day_type,
    u.Cleaned_Status,
    COUNT(*) AS status_count,
    ROUND(
        COUNT(*) / total.total_requests * 100, 2
    ) AS percentage
FROM 
    uber_analysis.uber u
JOIN (
    SELECT `DAY TYPE`, COUNT(*) AS total_requests
    FROM uber_analysis.uber
    GROUP BY `DAY TYPE`
) AS total
ON u.`DAY TYPE` = total.`DAY TYPE`
GROUP BY 
    u.`DAY TYPE`, u.Cleaned_Status
ORDER BY 
    u.`DAY TYPE`, u.Cleaned_Status;
-- OBJECTIVE 2- CHART 2
USE uber_analysis;
SELECT 
    `DAY TYPE`,
    COUNT(`Request id`) AS cancelled_trips
FROM 
    uber_analysis.uber
WHERE 
    Cleaned_Status = 'Cancelled'
GROUP BY 
    `DAY TYPE`
ORDER BY 
    cancelled_trips DESC;
-- OBJECTIVE 3- CHART 1
USE uber_analysis;
SELECT 
    `Request Hour`,
    COUNT(`Request id`) AS completed_trips
FROM 
    uber_analysis.uber
WHERE 
    Cleaned_Status = 'Trip Completed'
GROUP BY 
    `Request Hour`
ORDER BY 
    `Request Hour`;
-- OBJECTIVE 3- CHART 2
USE uber_analysis;
SELECT 
    `Request Hour`,
    COUNT(`Request id`) AS no_cars_available_count
FROM 
    uber_analysis.uber
WHERE 
    Cleaned_Status = 'No Cars Available'
GROUP BY 
    `Request Hour`
ORDER BY 
    `Request Hour`;