-- *****************************************************************************
-- This script contains INSERT statements for populating tables with seed data
-- *****************************************************************************

BEGIN;

-- INSERT statements go here
INSERT INTO app_user(USER_NAME, PASSWORD, FNAME, LNAME, EMAIL, PHONE_NUMBER, ROLE, SALT)
VALUES
        ('johnD', 'randomPassword1', 'John', 'Doe', 'johnDoe@email.com', '0000000000', 'City Visitor', 'randomSalt1'),
        ('janeD', 'randomPassword2', 'Jane', 'Doe', 'janeDoe@email.com', '0000000000', 'City Visitor', 'randomSalt2');

INSERT INTO landmark(ID, LATITUDE, LONGITUDE, NAME, street_address, city, state_or_region, zip_or_postal, country)
VALUES
        ('1', 'ON', '0W', 'MOHAMEDS HOUSE', '123 Main Street', 'Columbus', 'Ohio', 43210, 'USA'),
        ('2', '1N', '1W', 'MOHAMEDS WORK', '222 Main Street', 'Columbus', 'Ohio', 43210, 'USA'),
        ('3', '2N', '2W', 'MOHAMEDS COUNTRY', '333 Main Street', 'Columbus', 'Ohio', 43210, 'USA');

INSERT INTO user_landmark(USER_ID, LANDMARK_ID)
VALUES
        (1,'1'),
        (1,'2'),
        (2,'3');
COMMIT;