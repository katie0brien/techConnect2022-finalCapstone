-- *************************************************************************************************
-- This script creates all of the database objects (tables, sequences, etc) for the database
-- *************************************************************************************************

BEGIN;

-- CREATE statements go here
DROP TABLE IF EXISTS app_user, landmark, user_landmark;

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

CREATE TABLE landmark (
  id varchar(50) PRIMARY KEY,
  latitude varchar(25),
  longitude varchar(25),
  name varchar(50) NOT NULL UNIQUE,
  street_address varchar(100) UNIQUE,
  city varchar(25),
  state_or_region varchar(50),
  zip_or_postal int,
  country varchar(50)
);

CREATE TABLE user_landmark (
  user_id int,
  landmark_id varchar(50),
  FOREIGN KEY (user_id) REFERENCES app_user(id),
  FOREIGN KEY (landmark_id) REFERENCES landmark(id),
  PRIMARY KEY (user_id, landmark_id)
);

COMMIT;