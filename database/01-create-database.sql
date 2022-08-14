-- **************************************************************
-- This script destroys and re-creates the database
--
-- It also drops the users associated with the database
-- **************************************************************

-- The following line terminates any active connections to the database so that it can be destroyed
SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname = 'city_tours';

DROP DATABASE IF EXISTS city_tours;
CREATE DATABASE city_tours;

DROP USER city_tours_owner;
DROP USER city_tours_appuser;
