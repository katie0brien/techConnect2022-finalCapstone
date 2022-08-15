-- ********************************************************************************
-- This script creates the database users and grants them the necessary permissions
-- ********************************************************************************

CREATE USER city_tours_owner WITH PASSWORD 'city_tours_owner1';

GRANT ALL 
ON ALL TABLES IN SCHEMA public
TO city_tours_owner;

GRANT ALL 
ON ALL SEQUENCES IN SCHEMA public
TO city_tours_owner;

CREATE USER city_tours_appuser WITH PASSWORD 'city_tours_appuser1';

GRANT SELECT, INSERT, UPDATE, DELETE
ON ALL TABLES IN SCHEMA public
TO city_tours_appuser;

GRANT USAGE, SELECT
ON ALL SEQUENCES IN SCHEMA public
TO city_tours_appuser;