-- *************************************************************************************************
-- This script creates all of the database objects (tables, sequences, etc) for the database
-- *************************************************************************************************

BEGIN;

-- CREATE statements go here
DROP TABLE IF EXISTS app_user;

CREATE TABLE app_user (
  id SERIAL PRIMARY KEY,
  user_name varchar(32) NOT NULL UNIQUE,
  password varchar(32) NOT NULL,
  fname varchar(32) NOT NULL,
  lname varchar(32) NOT NULL,
  email varchar(64) NOT NULL,
  phone_number varchar(13) NOT NULL,
  role varchar(32),
  salt varchar(255) NOT NULL
);

COMMIT;