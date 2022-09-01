-- BACK UP tables
CREATE TABLE bike_trips.trips_p1 AS
SELECT * FROM bike_trips.trips_p1_original;

CREATE TABLE bike_trips.trips_p2 AS
SELECT * FROM bike_trips.trips_p2_original;

CREATE TABLE bike_trips.stations AS
SELECT * FROM bike_trips.stations_original;

-- BACK UP cleaned tables
CREATE TABLE bike_trips.trips_p1_cleaned AS
SELECT * FROM bike_trips.trips_p1

CREATE TABLE bike_trips.trips_p2_cleaned AS
SELECT * FROM bike_trips.trips_p2

CREATE TABLE bike_trips.sattions_cleaned AS
SELECT * FROM bike_trips.stations
  
  
-- extracting duration
SELECT EXTRACT(EPOCH FROM(end_time - start_time))::int as duration FROM bike_trips.trips_p2
WHERE ride_id = 'EACB19130B0CDA4A'


--FOR CHECKING
-- trips_p1
SELECT *
FROM (
	SELECT DISTINCT start_station_name as name, start_station_id as id
	FROM bike_trips.trips_p1
	UNION
	SELECT DISTINCT end_station_name as name, end_station_id as id
	FROM bike_trips.trips_p1) as t
WHERE t.id = 387;

-- trips_p2
SELECT *
FROM (
	SELECT DISTINCT start_station_name as name, start_station_id as id
	FROM bike_trips.trips_p2
	UNION
	SELECT DISTINCT end_station_name as name, end_station_id as id
	FROM bike_trips.trips_p2) as t
WHERE t.id = '704';

-- COUNT
SELECT COUNT(*), start_station_name as name, start_station_id as id
FROM bike_trips.trips_p2
GROUP BY name, id
HAVING start_station_id = '704';


SELECT DISTINCT start_station_name, start_station_id FROM bike_trips.trips_p2
WHERE start_station_name LIKE 'DIVVY%';

-- DELETING DUPLICATE ROWS
DELETE FROM bike_trips.trips_p2_stations AS a 
  USING (
      SELECT MIN(ctid) AS ctid, name
        FROM bike_trips.trips_p2_stations
        GROUP BY name 
	    HAVING COUNT(*) > 1
      ) AS b
  WHERE a.name = b.name 
  AND a.ctid <> b.ctid;

SELECT * FROM bike_trips.trips_p2
order by ride_id

SELECT COUNT(ride_id), rideable_type
FROM bike_trips.trips_p2
GROUP BY rideable_type HAVING COUNT(ride_id) > 1
ORDER BY COUNT(ride_id) DESC;

-- back-up trips_p1
-- since original table has modified column
CREATE TABLE bike_trips.trips_p1 AS
SELECT
  CAST(trip_id AS bigint), 
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
  birthyear
FROM bike_trips.trips_p1_original;


SELECT * FROM bike_trips.trips_p1;

SELECT * FROM bike_trips.trips_p2;

SELECT DISTINCT start_station_id as id, start_station_name as name
FROM bike_trips.trips_p2
UNION
SELECT DISTINCT end_station_id as id, end_station_name as name
FROM bike_trips.trips_p2

SELECT *
FROM (
  SELECT DISTINCT start_station_id as id, start_station_name as name
  FROM bike_trips.trips_p2
  UNION
  SELECT DISTINCT end_station_id as id, end_station_name as name
  FROM bike_trips.trips_p2) as t
ORDER BY CAST(id AS int);


SELECT *, EXTRACT(EPOCH FROM(end_time - start_time))::int as duration 
FROM bike_trips.trips_p2;



CREATE TABLE bike_trips.trips_p1_cleaned AS
SELECT * FROM bike_trips.trips_p1;

CREATE TABLE bike_trips.trips_p2_cleaned AS
SELECT * FROM bike_trips.trips_p2;













