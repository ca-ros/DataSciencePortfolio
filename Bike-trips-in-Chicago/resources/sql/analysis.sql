-- group by hour stations_popularity
CREATE TABLE bike_trips.analysis AS
SELECT SUM(count) as total_trips, name, date, hour
FROM (
	SELECT 
	  COUNT(start_station_name) as count, 
	  start_station_name as name, 
	  CAST(start_time as date) as date,
	  EXTRACT(HOUR FROM start_time) as hour
	FROM bike_trips.trips
	WHERE trip_duration > 60
	GROUP BY 
	 date, name, hour
	UNION ALL
	SELECT 
	  COUNT(end_station_name) as count, 
	  end_station_name as name, 
	  CAST(end_time as date) as date,
	  EXTRACT(HOUR FROM end_time) as hour
	FROM bike_trips.trips
	WHERE trip_duration > 60
	GROUP BY 
	 date, name, hour
	) as t
GROUP BY name, date, hour
HAVING name IS NOT NULL
ORDER BY date, hour;

-- start station count
CREATE TABLE start AS
SELECT COUNT(*), start_station_name, start_time, user_type
FROM trips
GROUP BY start_station_name, start_time, user_type
HAVING start_station_name IS NOT NULL
ORDER BY start_time
 

-- end station count
CREATE TABLE ends AS
SELECT COUNT(*), end_station_name, end_time, user_type
FROM trips
GROUP BY end_station_name, end_time, user_type
HAVING end_station_name IS NOT NULL
ORDER BY end_time




