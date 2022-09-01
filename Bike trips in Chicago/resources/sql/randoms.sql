


-- NULL values on trips_p2
SELECT COUNT(*) 
FROM bike_trips.trips_p2
WHERE (start_station_name IS NULL 
AND start_station_id IS NULL)
OR (end_station_name IS NULL
AND end_station_id IS NULL)
-- 1158190 null records

-- trips_p1
SELECT COUNT(*) FROM bike_trips.trips_p1 -- 24,426,783 records
-- trips_p2
SELECT COUNT(*) FROM bike_trips.trips_p2 -- 9,136,746 records
-- total records
SELECT (
  (SELECT COUNT(*) FROM bike_trips.trips_p1)
  +
  (SELECT COUNT(*) FROM bike_trips.trips_p2)
) AS total_records
-- 33,563,529 records


SELECT 
 (SELECT CAST(COUNT(*) AS numeric) 
  FROM bike_trips.trips_p2
  WHERE (start_station_name IS NULL 
  AND start_station_id IS NULL)
  OR (end_station_name IS NULL
  AND end_station_id IS NULL)
  ) /	
 (SELECT CAST(COUNT(*) AS numeric)
  FROM bike_trips.trips_p2) * 100 AS omitted_data

-- finding the percent of omitted data
SELECT round(100 * 
 (SELECT CAST(COUNT(*) AS numeric) 
  FROM bike_trips.trips_p2
  WHERE (start_station_name IS NULL 
  AND start_station_id IS NULL)
  OR (end_station_name IS NULL
  AND end_station_id IS NULL)
  ) /	
 (SELECT CAST(COUNT(*) AS numeric)
  FROM bike_trips.trips_p2)
			 , 2) AS omitted_data_percent



SELECT * FROM bike_trips.trips_p2
WHERE start_station_name = 'WEST CHI-WATSON'

SELECT * FROM bike_trips.trips_p2
WHERE start_station_name = 'WATSON TESTING - DIVVY'

SELECT * FROM bike_trips.stations
ORDER BY id

ALTER TABLE bike_trips.stations
ALTER COLUMN id TYPE bigint



SELECT * FROM bike_trips.stations
WHERE id = 645

SELECT t.id, t.name
FROM (
  SELECT DISTINCT start_station_id as id, start_station_name as name 
  FROM bike_trips.trips_p2
  UNION
  SELECT DISTINCT end_station_id as id, end_station_name as name 
  FROM bike_trips.trips_p2) as t
WHERE NOT EXISTS (
  SELECT id, name
  FROM bike_trips.stations as s
  WHERE CAST(s.id AS varchar) = t.id)
UNION
SELECT t.id, t.name
FROM (
  SELECT DISTINCT start_station_name as name, start_station_id as id 
  FROM bike_trips.trips_p2
  UNION
  SELECT DISTINCT end_station_name as name, end_station_id as id 
  FROM bike_trips.trips_p2)as t
WHERE NOT EXISTS (
  SELECT s.id, s.name
  FROM bike_trips.stations as s
  WHERE s.name = t.name);



SELECT * FROM bike_trips.stations


