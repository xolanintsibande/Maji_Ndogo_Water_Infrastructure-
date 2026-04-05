-- Maji Ndogo Water Infrastructure
-- Exploration Notes

-- Objective
-- Understand dataset structure, validate data quality, and identify initial patterns

--------------------------------------------------
-- 1. Inspect Tables
--------------------------------------------------

SHOW TABLES;

DESCRIBE water_source;
DESCRIBE visits;
DESCRIBE location;
DESCRIBE water_quality;
DESCRIBE well_pollution;
DESCRIBE employee;

--------------------------------------------------
-- 2. Row Counts
--------------------------------------------------

SELECT COUNT(*) AS total_water_sources FROM water_source;
SELECT COUNT(*) AS total_visits FROM visits;
SELECT COUNT(*) AS total_locations FROM location;
SELECT COUNT(*) AS total_pollution_records FROM well_pollution;

--------------------------------------------------
-- 3. Water Source Distribution
--------------------------------------------------

SELECT 
    type_of_water_source,
    COUNT(*) AS count_sources
FROM water_source
GROUP BY type_of_water_source
ORDER BY count_sources DESC;

--------------------------------------------------
-- 4. Population Served by Source
--------------------------------------------------

SELECT 
    type_of_water_source,
    SUM(number_of_people_served) AS total_people
FROM water_source
GROUP BY type_of_water_source
ORDER BY total_people DESC;

--------------------------------------------------
-- 5. Queue Time Overview
--------------------------------------------------

SELECT 
    ROUND(AVG(queue_time), 2) AS avg_queue_time,
    MIN(queue_time) AS min_queue,
    MAX(queue_time) AS max_queue
FROM visits;

--------------------------------------------------
-- 6. Queue Time by Day
--------------------------------------------------

SELECT 
    DAYNAME(time_of_record) AS day,
    ROUND(AVG(queue_time), 2) AS avg_queue_time
FROM visits
GROUP BY day
ORDER BY avg_queue_time DESC;

--------------------------------------------------
-- 7. Queue Time by Hour
--------------------------------------------------

SELECT 
    HOUR(time_of_record) AS hour,
    ROUND(AVG(queue_time), 2) AS avg_queue_time
FROM visits
GROUP BY hour
ORDER BY hour;

--------------------------------------------------
-- 8. Identify Duplicate Visits
--------------------------------------------------

SELECT 
    location_id,
    COUNT(*) AS visit_count
FROM visits
GROUP BY location_id
HAVING COUNT(*) > 1;

--------------------------------------------------
-- 9. Pollution Data Check
--------------------------------------------------

SELECT *
FROM well_pollution
WHERE biological > 0.01
AND results LIKE 'Clean%';

--------------------------------------------------
-- 10. Regional Distribution
--------------------------------------------------

SELECT 
    province,
    COUNT(*) AS total_locations
FROM location
GROUP BY province
ORDER BY total_locations DESC;

--------------------------------------------------
-- 11. Insight Summary
--------------------------------------------------
-- Shared taps serve largest population
-- Queue times exceed 120 minutes on average
-- Pollution data contains misclassified records
-- Some locations have repeated visits
