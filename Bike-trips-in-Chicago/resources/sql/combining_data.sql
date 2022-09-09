-- Combining Data

-- 2013
-- Create table
CREATE TABLE bike_trips.trips_2013 (
  trip_id bigint, 
  start_time timestamp without time zone, 
  end_time timestamp without time zone, 
  bike_id int, 
  trip_duration int, 
  start_station_id int, 
  start_station_name varchar(50), 
  end_station_id int, 
  end_station_name varchar(50), 
  user_type text, 
  gender text, 
  birth_year int);
  -- Import csv file
COPY bike_trips.trips_2013 (
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
FROM 'D:/Github/divvy-bikeshare/csv files/trips/2013-divvy-tripdata.csv' 
DELIMITER ',' CSV HEADER;

-- 2014
-- Create table
CREATE TABLE bike_trips.trips_2014 (
  trip_id bigint, 
  start_time timestamp without time zone, 
  end_time timestamp without time zone, 
  bike_id int, 
  trip_duration int, 
  start_station_id int, 
  start_station_name varchar(50), 
  end_station_id int, 
  end_station_name varchar(50), 
  user_type text, 
  gender text, 
  birth_year int);
-- Import csv file
COPY bike_trips.trips_2014 (
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
FROM 'D:/Github/divvy-bikeshare/csv files/trips/2014-divvy-tripdata.csv' 
DELIMITER ',' CSV HEADER QUOTE '"' NULL 'NA';

-- 2015
-- Create table
CREATE TABLE bike_trips.trips_2015 (
  trip_id bigint, 
  start_time timestamp without time zone, 
  end_time timestamp without time zone, 
  bike_id int, 
  trip_duration int, 
  start_station_id int, 
  start_station_name varchar(50), 
  end_station_id int, 
  end_station_name varchar(50), 
  user_type text, 
  gender text, 
  birth_year int);
-- Import csv file
COPY bike_trips.trips_2015 (
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
FROM 'D:/Github/divvy-bikeshare/csv files/trips/2015-divvy-tripdata.csv' 
DELIMITER ',' CSV HEADER QUOTE '"' NULL 'NA';

-- 2016
-- Create table
CREATE TABLE bike_trips.trips_2016 (
  trip_id bigint, 
  start_time timestamp without time zone, 
  end_time timestamp without time zone, 
  bike_id int, 
  trip_duration int, 
  start_station_id int, 
  start_station_name varchar(50), 
  end_station_id int, 
  end_station_name varchar(50), 
  user_type text, 
  gender text, 
  birth_year int);
-- Import csv file
COPY bike_trips.trips_2016 (
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
FROM 'D:/Github/divvy-bikeshare/csv files/trips/2016-divvy-tripdata.csv' 
DELIMITER ',' CSV HEADER QUOTE '"' NULL 'NA';

-- 2017
-- Create table
CREATE TABLE bike_trips.trips_2017 (
  trip_id bigint, 
  start_time timestamp without time zone, 
  end_time timestamp without time zone, 
  bike_id int, 
  trip_duration int, 
  start_station_id int, 
  start_station_name varchar(50), 
  end_station_id int, 
  end_station_name varchar(50), 
  user_type text, 
  gender text, 
  birth_year int);
-- Import csv file
COPY bike_trips.trips_2017 (
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
FROM 'D:/Github/divvy-bikeshare/csv files/trips/2017-divvy-tripdata.csv' 
DELIMITER ',' CSV HEADER QUOTE '"' NULL 'NA';

-- 2018
-- Create table
CREATE TABLE bike_trips.trips_2018 (
  trip_id bigint, 
  start_time timestamp without time zone, 
  end_time timestamp without time zone, 
  bike_id int, 
  trip_duration int, 
  start_station_id int, 
  start_station_name varchar(50), 
  end_station_id int, 
  end_station_name varchar(50), 
  user_type text, 
  gender text, 
  birth_year int);
-- Import csv file
COPY bike_trips.trips_2018 (
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
FROM 'D:/Github/divvy-bikeshare/csv files/trips/2018-divvy-tripdata.csv' 
DELIMITER ',' CSV HEADER QUOTE '"' NULL 'NA';

-- 2019
-- Create table
CREATE TABLE bike_trips.trips_2019 (
  trip_id bigint, 
  start_time timestamp without time zone, 
  end_time timestamp without time zone, 
  bike_id int, 
  trip_duration int, 
  start_station_id int, 
  start_station_name varchar(50), 
  end_station_id int, 
  end_station_name varchar(50), 
  user_type text, 
  gender text, 
  birth_year int);
-- Import csv file
COPY bike_trips.trips_2019 (
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
FROM 'D:/Github/divvy-bikeshare/csv files/trips/2019-divvy-tripdata.csv' 
DELIMITER ',' CSV HEADER QUOTE '"' NULL 'NA';

-- 2020
-- Create table
CREATE TABLE bike_trips.trips_2020 (
  trip_id bigint, 
  start_time timestamp without time zone, 
  end_time timestamp without time zone, 
  bike_id int, 
  trip_duration int, 
  start_station_id int, 
  start_station_name varchar(50), 
  end_station_id int, 
  end_station_name varchar(50), 
  user_type text, 
  gender text, 
  birth_year int);
-- Import csv file
COPY bike_trips.trips_2020 (
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
FROM 'D:/Github/divvy-bikeshare/csv files/trips/2020-divvy-tripdata.csv' 
DELIMITER ',' CSV HEADER QUOTE '"' NULL 'NA';

-- 2021
-- Create table
CREATE TABLE bike_trips.trips_2021 (
  trip_id bigint, 
  start_time timestamp without time zone, 
  end_time timestamp without time zone, 
  bike_id int, 
  trip_duration int, 
  start_station_id int, 
  start_station_name varchar(50), 
  end_station_id int, 
  end_station_name varchar(50), 
  user_type text, 
  gender text, 
  birth_year int);
-- Import csv file
COPY bike_trips.trips_2021 (
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
FROM 'D:/Github/divvy-bikeshare/csv files/trips/2021-divvy-tripdata.csv' 
DELIMITER ',' CSV HEADER QUOTE '"' NULL 'NA';

-- trips_p1
CREATE TABLE AS bike_trips.trips_p1
  SELECT * FROM bike_trips.trips_2013
  UNION ALL
  SELECT * FROM bike_trips.trips_2014
  UNION ALL
  SELECT * FROM bike_trips.trips_2015
  UNION ALL
  SELECT * FROM bike_trips.trips_2016
  UNION ALL
  SELECT * FROM bike_trips.trips_2017
  UNION ALL
  SELECT * FROM bike_trips.trips_2018
  UNION ALL
  SELECT * FROM bike_trips.trips_2019;
  
-- trips_p2
CREATE TABLE AS bike_trips.trips_p2
  SELECT * FROM bike_trips.trips_2020
  UNION ALL
  SELECT * FROM bike_trips.trips_2021;
  
  