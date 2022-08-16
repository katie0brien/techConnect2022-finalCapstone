-- *****************************************************************************
-- This script contains INSERT statements for populating tables with seed data
-- *****************************************************************************

BEGIN;

-- INSERT statements go here
INSERT INTO app_user(USER_NAME, PASSWORD, FNAME, LNAME, EMAIL, PHONE_NUMBER, ROLE, SALT)
VALUES
        ('johnD', 'randomPassword1', 'John', 'Doe', 'johnDoe@email.com', '0000000000', 'City Visitor', 'randomSalt1'),
        ('janeD', 'randomPassword2', 'Jane', 'Doe', 'janeDoe@email.com', '0000000000', 'City Visitor', 'randomSalt2');

INSERT INTO landmark(ID, LATITUDE, LONGITUDE, NAME)
VALUES
        ('1', 'ON', '0W', 'MOHAMEDS HOUSE'),
        ('2', '1N', '1W', 'MOHAMEDS WORK'),
        ('3', '2N', '2W', 'MOHAMEDS COUNTRY');

INSERT INTO user_landmark(USER_ID, LANDMARK_ID)
VALUES
        (1,'1'),
        (1,'2'),
        (2,'3');
COMMIT;