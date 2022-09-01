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


