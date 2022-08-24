-- *************************************************************************************************
-- This script creates all of the database objects (tables, sequences, etc) for the database
-- *************************************************************************************************

BEGIN;

-- CREATE statements go here
DROP TABLE IF EXISTS user_itinerary, user_landmark, itinerary_landmark,app_user, landmark,  itinerary CASCADE;

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
  id SERIAL PRIMARY KEY,
  latitude varchar(25),
  longitude varchar(25),
  name varchar(50) NOT NULL,
  street_address varchar(100) NULL,
  city varchar(25) NULL,
  state_or_region varchar(50) NULL,
  zip_or_postal varchar(50) NULL,
  country varchar(50) NULL,
  travel_notes varchar(5000) NULL,
  thumbs_up boolean default FALSE,
  image_name varchar(25) NULL
);

CREATE TABLE user_landmark (
  user_id int,
  landmark_id int,
  FOREIGN KEY (user_id) REFERENCES app_user(id),
  FOREIGN KEY (landmark_id) REFERENCES landmark(id),
  PRIMARY KEY (user_id, landmark_id)
);

CREATE TABLE itinerary (
    id SERIAL PRIMARY KEY,
    name varchar(56),
    from_date date,
    to_date date
);

CREATE TABLE itinerary_landmark (
    itinerary_id int,
    landmark_id int,
    FOREIGN KEY (itinerary_id) REFERENCES itinerary(id),
    FOREIGN KEY (landmark_id) REFERENCES landmark(id),
    PRIMARY KEY (itinerary_id, landmark_id)
);

CREATE TABLE user_itinerary (
    itinerary_id int,
    user_id int,
    FOREIGN KEY (itinerary_id) REFERENCES itinerary(id),
    FOREIGN KEY (user_id) REFERENCES app_user(id),
    PRIMARY KEY (itinerary_id, user_id)
);
COMMIT;