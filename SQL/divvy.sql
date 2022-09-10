
-- stored function
CREATE OR REPLACE FUNCTION trips_part(part varchar(30))
  RETURNS VOID
  LANGUAGE plpgsql AS
$func$
BEGIN
  EXECUTE format('
    CREATE TABLE IF NOT EXISTS %I (
      ride_id bigint,
      bike_type text,
      bike_id int,  
      start_time timestamp without time zone, 
      end_time timestamp without time zone, 
      trip_duration int, 
      start_station_id int, 
      start_station_name varchar(50), 
      end_station_id int, 
      end_station_name varchar(50), 
      user_type text, 
      gender text, 
      birth_year int
      )', 'trips_' || part);
END
$func$;


-- Create table trips_p1
SELECT trips_part('p1');
-- Create table trips_p2
SELECT trips_part('p2');


-- Import p1
COPY trips_p1 (
  trip_id, 
  start_time, 
  end_time, 
  bike_id, 
  trip_duration, 
  start_station_id, 
  start_station_name, 
  end_station_id, 
  end_station_name, 
  user_type, 
  gender, 
  birth_year) 
FROM 'D:/Github/large csv files/divvy-bikeshare/trips_p1_dirty.csv' 
DELIMITER ',' CSV HEADER QUOTE '"' NULL 'NA';


-- Import p2
COPY trips_p2 (
  ride_id,
  bike_type, 
  start_time, 
  end_time, 
  start_station_name, 
  start_station_id, 
  end_station_name, 
  end_station_id,
  start_lat,
  start_lng,
  end_lat,
  end_lng, 
  user_type) 
FROM 'D:/Github/large csv files/divvy-bikeshare/trips_p2_dirty.csv' 
DELIMITER ',' CSV HEADER QUOTE '"' NULL 'NA';


-- Remove unnecessary columns
ALTER TABLE trips_p2
  DROP COLUMN start_lat,
  DROP COLUMN start_lng,
  DROP COLUMN end_lat,
  DROP COLUMN end_lng;


-- stations table
CREATE TABLE stations (
  id bigint,
  name varchar,
  docks int,
  in_service text,
  latitude numeric,
  longitude numeric,
  coordinate point);

COPY stations (
  id,
  name,
  docks,
  in_service,
  latitude,
  longitude,
  coordinate)
FROM 'D:/Github/divvy-bikeshare/csv files/stations/Stations.csv'
DELIMITER ',' CSV HEADER;


-- using CTE to extract dirty data from trips_p1
WITH distinct_stations (id, name) AS
  (SELECT DISTINCT start_station_id as id, start_station_name as name 
  FROM trips_p1
  UNION
  SELECT DISTINCT end_station_id as id, end_station_name as name
  FROM trips_p1)
  
SELECT * FROM distinct_stations as t
WHERE NOT EXISTS (
  SELECT id, name
  FROM stations as s
  WHERE s.id = t.id)
UNION
SELECT * FROM distinct_stations as t
WHERE NOT EXISTS (
  SELECT id, name
  FROM stations as s
  WHERE s.name = t.name);


-- id_changes_p1
CREATE TABLE id_changes_p1 (
  old_name varchar, 
  new_id int);

COPY id_changes_p1 (old_name, new_id)
FROM 'D:/Github/divvy-bikeshare/csv files/stations/id_changes_p1.csv' 
DELIMITER ',' CSV HEADER;


-- name_changes_p1
CREATE TABLE name_changes_p1 (
  old_name varchar, 
  new_name varchar);

COPY name_changes_p1 (old_name, new_name)
FROM 'D:/Github/divvy-bikeshare/csv files/stations/name_changes_p1.csv' 
DELIMITER ',' CSV HEADER;


-- cleaning trips_p1
UPDATE trips_p1 as s
SET start_station_id = c.new_id
FROM id_changes_p1 as c
WHERE s.start_station_name = c.old_name;

UPDATE trips_p1 as s
SET end_station_id = c.new_id
FROM id_changes_p1 as c
WHERE s.end_station_name = c.old_name;

UPDATE trips_p1 as s
SET start_station_name = c.new_name
FROM name_changes_p1 as c
WHERE s.start_station_name = c.old_name;

UPDATE trips_p1 as s
SET end_station_name = c.new_name
FROM name_changes_p1 as c
WHERE s.end_station_name = c.old_name;


-- using CTE to extract dirty data from trips_p2
WITH distinct_stations (id, name) AS
  (SELECT DISTINCT start_station_id as id, start_station_name as name 
  FROM trips_p2
  UNION
  SELECT DISTINCT end_station_id as id, end_station_name as name
  FROM trips_p2)
  
SELECT * FROM distinct_stations as t
WHERE NOT EXISTS (
  SELECT id, name
  FROM stations as s
  WHERE CAST(s.id AS varchar) = t.id)
UNION
SELECT * FROM distinct_stations as t
WHERE NOT EXISTS (
  SELECT id, name
  FROM stations as s
  WHERE s.name = t.name);


-- id_changes_p2
CREATE TABLE id_changes_p2 (
  old_name varchar,
  new_id bigint);
  
COPY id_changes_p2 (old_name, new_id)
FROM 'D:/Github/divvy-bikeshare/csv files/stations/id_changes_p2.csv' 
DELIMITER ',' CSV HEADER NULL 'null';


-- name_changes_p2
CREATE TABLE name_changes_p2 (
  old_name varchar,
  new_name varchar);

COPY name_changes_p2 (old_name, new_name)
FROM 'D:/Github/divvy-bikeshare/csv files/stations/name_changes_p2.csv' 
DELIMITER ',' CSV HEADER NULL 'null';


-- cleaning trips_p2
UPDATE trips_p2
SET start_station_id = CASE
  WHEN start_station_id = 'WL-008' THEN '57'
  WHEN start_station_id = '13221' THEN '61'
  WHEN start_station_id = '20215' THEN '732'
  END
WHERE start_station_id IN ('WL-008', '13221', '20215');

UPDATE trips_p2 as s
SET start_station_id = CAST(c.new_id AS varchar)
FROM id_changes_p2 as c
WHERE s.start_station_name = c.old_name;

UPDATE trips_p2
SET end_station_id = CASE
  WHEN end_station_id = 'WL-008' THEN '57'
  WHEN end_station_id = '13221' THEN '61'
  WHEN end_station_id = '20215' THEN '732'
  END
WHERE end_station_id IN ('WL-008', '13221', '20215');

UPDATE trips_p2 as s
SET end_station_id = CAST(c.new_id AS varchar)
FROM id_changes_p2 as c
WHERE s.end_station_name = c.old_name;

UPDATE trips_p2
SET start_station_name = CASE
  WHEN start_station_id = '57' THEN 'Clinton St & Roosevelt Rd'
  WHEN start_station_id = '61' THEN 'Wood St & Milwaukee Ave'
  WHEN start_station_id = '732' THEN 'Hegewisch Metra Station'
  END
WHERE start_station_id IN ('57', '61', '732');

UPDATE trips_p2 as s
SET start_station_name = c.new_name
FROM name_changes_p2 as c
WHERE s.start_station_name = c.old_name;

UPDATE trips_p2
SET end_station_name = CASE
  WHEN end_station_id = '57' THEN 'Clinton St & Roosevelt Rd'
  WHEN end_station_id = '61' THEN 'Wood St & Milwaukee Ave'
  WHEN end_station_id = '732' THEN 'Hegewisch Metra Station'
  END
WHERE end_station_id IN ('57', '61', '732');

UPDATE trips_p2 as s
SET end_station_name = c.new_name
FROM name_changes_p2 as c
WHERE s.end_station_name = c.old_name;



-- Combining trips_p1 & trips_p2
CREATE TABLE trips AS
SELECT 
  CAST(trip_id AS varchar) AS ride_id,
  CAST(null AS varchar) AS rideable_type,
  bike_id,
  start_time,
  end_time,
  trip_duration,
  CAST(start_station_id AS bigint),
  start_station_name,
  CAST(end_station_id AS bigint),
  end_station_name,
  user_type,
  gender,
  birth_year
FROM trips_p1
UNION ALL
SELECT
  ride_id,
  rideable_type,
  CAST(null AS int) AS bike_id,
  start_time,
  end_time,
  EXTRACT(EPOCH FROM(end_time - start_time))::int as trip_duration,
  CAST(start_station_id AS bigint),
  start_station_name,
  CAST(end_station_id AS bigint),
  end_station_name,
  user_type,
  CAST(null AS text) AS gender,
  CAST(null AS int) AS birth_year
FROM trips_p2;



-- Exploring Null values
-- trips_p1: 24,426,783
SELECT COUNT(*) FROM trips_p1;

-- trips_p2: 9,136,746
SELECT COUNT(*) FROM trips_p2;

-- total: 33,563,529
SELECT COUNT(*) FROM trips;

-- total NULL records: 1,158,190
SELECT CAST(COUNT(*) AS numeric) 
  FROM trips_p2
  WHERE (start_station_name IS NULL 
  AND start_station_id IS NULL)
  OR (end_station_name IS NULL
  AND end_station_id IS NULL);


-- percent of null values
-- trips_p1
SELECT round(100 * 
 (SELECT CAST(COUNT(*) AS numeric) 
  FROM trips_p1
  WHERE (start_station_name IS NULL 
  AND start_station_id IS NULL)
  OR (end_station_name IS NULL
  AND end_station_id IS NULL)
  ) /	
 (SELECT CAST(COUNT(*) AS numeric)
  FROM trips_p1)
			 , 2) AS NULL_values_percent
-- none


-- trips_p2
SELECT round(100 * 
 (SELECT CAST(COUNT(*) AS numeric) 
  FROM trips_p2
  WHERE (start_station_name IS NULL 
  AND start_station_id IS NULL)
  OR (end_station_name IS NULL
  AND end_station_id IS NULL)
  ) /	
 (SELECT CAST(COUNT(*) AS numeric)
  FROM trips_p2)
			 , 2) AS NULL_values_percent
-- 12.68% of data is NULL

-- entire dataset
SELECT round(100 * 
 (SELECT CAST(COUNT(*) AS numeric) 
  FROM trips_p2
  WHERE (start_station_name IS NULL 
  AND start_station_id IS NULL)
  OR (end_station_name IS NULL
  AND end_station_id IS NULL)
  ) /	
 (SELECT CAST(COUNT(*) AS numeric)
  FROM trips)
			 , 2) AS omitted_data_percent
-- 3.45% of data is NULL



-- Removing invalid data
DELETE FROM trips
WHERE trip_duration < 60


-- cleaning stations table
-- add missing data
COPY stations (
  id, 
  name, 
  docks,
  in_service, 
  latitude, 
  longitude, 
  coordinate)
FROM 'D:/Github/divvy-bikeshare/csv files/stations/missing_stations.csv'
DELIMITER ',' CSV HEADER;


-- Create table
CREATE TABLE id_changes_stations (
  name varchar,
  id bigint);
-- Import
COPY id_changes_stations (name, id)
FROM 'D:/Github/divvy-bikeshare/csv files/stations/id_changes_stations.csv'
DELIMITER ',' CSV HEADER;

UPDATE stations as s
SET id = c.new_id
FROM id_changes_stations as c
WHERE s.name = c.old_name;