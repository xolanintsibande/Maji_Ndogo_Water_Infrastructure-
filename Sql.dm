01_data_cleaning.sql
SQL
-- DATA CLEANING

-- 1. Fix incorrect pollution classification
UPDATE well_pollution
SET results = 'Contaminated: Biological'
WHERE biological > 0.01
AND results LIKE 'Clean%';

-- 2. Standardize text values
UPDATE well_pollution
SET results = REPLACE(results, 'Clean Bacteria:', 'Bacteria:')
WHERE results LIKE 'Clean Bacteria:%';

-- 3. Remove duplicate visits
DELETE FROM visits
WHERE visit_id NOT IN (
    SELECT MIN(visit_id)
    FROM visits
    GROUP BY location_id, time_of_record
);

-- 4. Handle null values
UPDATE water_source
SET number_of_people_served = 0
WHERE number_of_people_served IS NULL;
02_data_transformation.sql
SQL
-- DATA TRANSFORMATION

-- 1. Total population served per water source
CREATE VIEW water_source_summary AS
SELECT
    type_of_water_source,
    SUM(number_of_people_served) AS total_served
FROM water_source
GROUP BY type_of_water_source;

-- 2. Average queue time per location
CREATE VIEW queue_time_summary AS
SELECT
    location_id,
    ROUND(AVG(queue_time), 2) AS avg_queue_time
FROM visits
GROUP BY location_id;

-- 3. Join core tables for analysis
CREATE VIEW combined_water_data AS
SELECT
    l.province,
    l.town,
    ws.type_of_water_source,
    ws.number_of_people_served,
    v.queue_time
FROM water_source ws
JOIN visits v ON ws.source_id = v.source_id
JOIN location l ON v.location_id = l.location_id;
03_analysis_queries.sql
SQL
-- ANALYSIS QUERIES

-- 1. Water source usage ranking
SELECT
    type_of_water_source,
    SUM(number_of_people_served) AS total_served,
    DENSE_RANK() OVER (ORDER BY SUM(number_of_people_served) DESC) AS rank
FROM water_source
GROUP BY type_of_water_source;

-- 2. Average queue time
SELECT
    ROUND(AVG(queue_time), 2) AS avg_queue_time
FROM visits;

-- 3. Queue time by day
SELECT
    DAYNAME(time_of_record) AS day,
    ROUND(AVG(queue_time), 2) AS avg_queue
FROM visits
GROUP BY day
ORDER BY avg_queue DESC;

-- 4. Regional breakdown
SELECT
    province,
    COUNT(*) AS total_sources
FROM location
GROUP BY province
ORDER BY total_sources DESC;
04_data_validation.sql
SQL
-- DATA VALIDATION

-- 1. Detect inconsistent pollution records
SELECT *
FROM well_pollution
WHERE biological > 0.01
AND results LIKE 'Clean%';

-- 2. Compare survey vs auditor data
SELECT
    s.location_id,
    s.score AS survey_score,
    a.auditor_score
FROM survey_data s
JOIN auditor_report a
ON s.location_id = a.location_id
WHERE s.score != a.auditor_score;

-- 3. Employee error count
SELECT
    employee_name,
    COUNT(*) AS error_count
FROM incorrect_records
GROUP BY employee_name
ORDER BY error_count DESC;
05_project_tracking.sql
SQL
-- PROJECT TRACKING TABLE

CREATE TABLE project_progress (
    project_id INT PRIMARY KEY AUTO_INCREMENT,
    location_id INT,
    issue_type VARCHAR(100),
    recommended_action VARCHAR(255),
    status VARCHAR(50),
    priority_level VARCHAR(50)
);

-- Insert example actions
INSERT INTO project_progress (location_id, issue_type, recommended_action, status, priority_level)
VALUES
(101, 'High Queue Time', 'Install additional taps', 'Pending', 'High'),
(102, 'Contaminated Well', 'Install filtration system', 'In Progress', 'High'),
(103, 'Broken Tap', 'Repair infrastructure', 'Pending', 'Medium');
