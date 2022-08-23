-- *****************************************************************************
-- This script contains INSERT statements for populating tables with seed data
-- *****************************************************************************

BEGIN;

-- INSERT statements go here
INSERT INTO app_user(USER_NAME, PASSWORD, FNAME, LNAME, EMAIL, PHONE_NUMBER, ROLE, SALT)
VALUES
        ('johnD', 'randomPassword1', 'John', 'Doe', 'johnDoe@email.com', '0000000000', 'City Visitor', 'randomSalt1'),
        ('janeD', 'randomPassword2', 'Jane', 'Doe', 'janeDoe@email.com', '0000000000', 'City Visitor', 'randomSalt2'),
        ('barb', '3px9aJGVaMz/AF/nE0xILA==', 'Barbie', 'Que', 'sauce@gmail.com', '(423)525-7020', 'City Visitor', 'rqtsXcP6bhSN94/03RwXeloN+hluYiHrFGi3QfVA7U0UBB3YWAyV8RzBXXnpDX5Io8qg31JPaYU8SmWo1DVoKhg/+4zximtT5ltK11t9ZI57S1Ls2HAiVRSDdp1rO9xCFgWtYJUnMP6PIkmYTE8Li8JRzlgxDH0l4xXE7/9fG/k=');

INSERT INTO landmark(ID, LATITUDE, LONGITUDE, NAME, street_address, city, state_or_region, zip_or_postal, country)
VALUES
        ('1', '123', '456', 'MOHAMEDS HOUSE', '123 Main Street', 'Columbus', 'Ohio', 43210, 'USA'),
        ('2', '1111', '1212', 'MOHAMEDS WORK', '222 Main Street', 'Columbus', 'Ohio', 43210, 'USA'),
        ('3', '789', '1010', 'MOHAMEDS COUNTRY', '333 Main Street', 'Columbus', 'Ohio', 43210, 'USA');

INSERT INTO user_landmark(USER_ID, LANDMARK_ID)
VALUES
        (1,'1'),
        (1,'2'),
        (2,'3');

INSERT INTO itinerary(name, from_date, to_date)
VALUES
    ('Mexico','2022-07-16', '2022-07-18'),
    ('California','2022-08-19', '2022-08-25'),
    ('Ohio','2022-07-16','2022-10-16');

INSERT INTO user_itinerary(itinerary_id, user_id)
VALUES
    (1,1),
    (2,1),
    (3,2);

INSERT INTO itinerary_landmark(itinerary_id, landmark_id)
VALUES
    (1,'1'),
    (1,'2'),
    (2,'3');


INSERT INTO user_review(user_id, landmark_id, thumbs_up)
VALUES  (1,1, true),
        (1,2, false),
        (2,2, true),
        (2,3, true),
        (3,2, true);
COMMIT;