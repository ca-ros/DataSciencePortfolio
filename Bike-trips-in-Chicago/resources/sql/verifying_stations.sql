-- trips_p2
SELECT *
FROM (
	SELECT DISTINCT start_station_name as name, start_station_id as id
	FROM bike_trips.trips_p2
	UNION
	SELECT DISTINCT end_station_name as name, end_station_id as id
	FROM bike_trips.trips_p2) as t
WHERE t.id = '704';



-- ID = 26
SELECT start_lat, start_lng
FROM bike_trips.trips_p2
WHERE start_station_name = 'McClurg Ct & Illinois St'
-- 41.8904, -87.6175
SELECT start_lat, start_lng
FROM bike_trips.trips_p2
WHERE start_station_name = 'New St & Illinois St'
-- 41.890594, -87.6181905

-- ID = 58
SELECT start_lat, start_lng
FROM bike_trips.trips_p2
WHERE start_station_name = 'Marshfield Ave & Cortland St'
-- 41.916, -87.6689
SELECT start_lat, start_lng
FROM bike_trips.trips_p2
WHERE start_station_name = 'Elston Ave & Cortland St'
-- 41.9164725, -87.6666405

-- ID = 99
SELECT start_lat, start_lng
FROM bike_trips.trips_p2
WHERE start_station_name = 'Lake Shore Dr & Ohio St'
-- 41.8926, -87.6145
SELECT start_lat, start_lng
FROM bike_trips.trips_p2
WHERE start_station_name = 'McClurg Ct & Ohio St'
-- 41.89334, -87.61708

-- ID = 437
SELECT start_lat, start_lng
FROM bike_trips.trips_p2
WHERE start_station_name = 'Whipple St & Irving Park Rd'
-- 41.95, -87.7
SELECT start_lat, start_lng
FROM bike_trips.trips_p2
WHERE start_station_name = 'Washtenaw Ave & Ogden Ave'
-- 41.8619, -87.6935

-- ID = 444
SELECT start_lat, start_lng
FROM bike_trips.trips_p2
WHERE start_station_name = 'N Shore Channel Trail & Argyle Ave'
-- 41.97, -87.7
SELECT start_lat, start_lng
FROM bike_trips.trips_p2
WHERE start_station_name = 'Albany Ave & 26th St'
-- 41.8445, -87.702


-- ID = 566
SELECT start_lat, start_lng
FROM bike_trips.trips_p2
WHERE start_station_name = 'Ashland Ave & 69th St'
-- 41.7687, -87.6641
SELECT start_lat, start_lng
FROM bike_trips.trips_p2
WHERE start_station_name = 'Damen Ave & 74th St'
-- 41.759274039	-87.673634291 

-- ID = 625
SELECT start_lat, start_lng
FROM bike_trips.trips_p2
WHERE start_station_name = 'Chicago Ave & Dempster St'
-- 42.0417, -87.6807
SELECT start_lat, start_lng
FROM bike_trips.trips_p2
WHERE start_station_name = 'Dodge Ave & Main St'
-- 42.034632, -87.699188

-- ID = 704
SELECT start_lat, start_lng
FROM bike_trips.trips_p2
WHERE end_station_name = 'Jeffery Blvd & 91st St'
-- 41.729705, -87.575744
SELECT start_lat, start_lng
FROM bike_trips.trips_p2
WHERE start_station_name = 'Avenue O & 134th St'
-- 41.651867, -87.539671


-- ID = TA1305000039
SELECT start_lat, start_lng
FROM bike_trips.trips_p2
WHERE start_station_name = 'Elston Ave & Cortland St'
-- 41.9164725, -87.6666405
SELECT start_lat, start_lng
FROM bike_trips.trips_p2
WHERE start_station_name = 'Marshfield Ave & Cortland St'
-- 41.916, -87.6689



SELECT start_lat, start_lng
FROM bike_trips.trips_p2
WHERE start_station_name = 'WEST CHI-WATSON'
-- 41.89478, -87.73091

SELECT start_lat, start_lng
FROM bike_trips.trips_p2
WHERE start_station_name = 'DIVVY CASSETTE REPAIR MOBILE STATION'
-- 41.88104, -87.61673

SELECT start_lat, start_lng
FROM bike_trips.trips_p2
WHERE start_station_name = 'hubbard_test_lws'
-- 41.89, -87.68

SELECT start_lat, start_lng
FROM bike_trips.trips_p2
WHERE start_station_name = 'DuSable Lake Shore Dr & Ohio St'
-- 41.89257, -87.61449

SELECT start_lat, start_lng
FROM bike_trips.trips_p2
WHERE start_station_name = 'McClurg Ct & Ohio St'
-- 41.89334, -87.61708

SELECT start_lat, start_lng
FROM bike_trips.trips_p2
WHERE start_station_name = 'Throop/Hastings Mobile Station'
-- 41.85156, -87.65911

SELECT start_lat, start_lng
FROM bike_trips.trips_p2
WHERE start_station_name = 'Drake Ave & Fullerton Ave'
-- 41.9244, -87.7154

SELECT start_lat, start_lng
FROM bike_trips.trips_p2
WHERE start_station_name = 'Keeler Ave & Roosevelt Rd'
-- 41.87, -87.73

SELECT start_lat, start_lng
FROM bike_trips.trips_p2
WHERE start_station_name = 'W Armitage Ave & N Sheffield Ave'
-- 41.92, -87.65


SELECT COUNT(*) FROM bike_trips.trips_p2
WHERE start_station_id = '225'

SELECT COUNT(*) FROM bike_trips.trips_p2
WHERE start_station_name = 'W Armitage Ave & N Sheffield Ave'
