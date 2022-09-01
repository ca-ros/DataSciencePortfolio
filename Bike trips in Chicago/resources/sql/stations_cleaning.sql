-- Import csv files

-- missing_stations.csv
-- Import
COPY bike_trips.stations (
  id, 
  name, 
  docks,
  in_service,
  latitude, 
  longitude, 
  coordinate)
FROM 'D:/Github/divvy-bikeshare/csv files/stations/missing_stations.csv'
DELIMITER ',' CSV HEADER;

-- id_changes_stations.csv
-- Create table
CREATE TABLE bike_trips.id_changes_stations (
  name varchar,
  id bigint);
-- Import
COPY bike_trips.id_changes_stations (name, id)
FROM 'D:/Github/divvy-bikeshare/csv files/stations/id_changes_stations.csv'
DELIMITER ',' CSV HEADER;

-- ID change
UPDATE bike_trips.stations as s
SET id = c.id
FROM bike_trips.id_changes_stations as c
WHERE s.name = c.name;





