CREATE OR REPLACE FUNCTION trips_part(part varchar(30))
  RETURNS VOID
  LANGUAGE plpgsql AS
$func$
BEGIN
  EXECUTE format('
    CREATE TABLE IF NOT EXISTS %I (
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
      birth_year int
      )', 'trips_' || part);
END
$func$;


SELECT trips_part('ewankosss')

SELECT trips_copy('ewankosss')
FROM 'D:/Github/large csv files/divvy-bikeshare/trips_p1.csv' 
DELIMITER ',' CSV HEADER QUOTE '"' NULL 'NA';
