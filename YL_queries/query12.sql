/*
    How many stations are within 1km of Meyerson Hall?

    Your query should have a single record with a single attribute, the number
    of stations (num_stations).
*/

-- Enter your SQL query here
WITH near_distance AS (
   SELECT
       id AS station_id,
       geog AS station_geog,
       ROUND(ST_Distance(
           ST_SetSRID(ST_MakePoint(-75.192584, 39.952415), 4326)::geography,
           geog, true) / 1000) AS distance
   FROM indego.indego_station_statuses
)

SELECT
	COUNT(*) AS num_stations
FROM near_distance
WHERE distance <= 1;

-- Result: 32