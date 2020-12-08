CREATE DATABASE appreciation_app_db;

CREATE TABLE posts(id SERIAL PRIMARY KEY, giver TEXT, receiver TEXT, message TEXT, timestamp TIMESTAMP, image_url TEXT);

CREATE TABLE users(id SERIAL PRIMARY KEY, user_handle TEXT, email TEXT, user_image_URL TEXT, password_digest TEXT);

INSERT INTO posts(giver, receiver, message, image_url) VALUES('jonsnow', 'danytarg', 'Thanks for saving me from the undead at that lake with all those dragons and stuff...sorry one died!', 'https://i.imgur.com/fTcxtZO.jpg');

INSERT INTO posts(giver, receiver, message, timestamp, image_url) VALUES('voldemort', 'harryp', 'Join me! We are the same, you and I... :D', current_timestamp, 'https://i.imgur.com/dsuEYpS.jpg');



INSERT INTO users(user_handle, email, user_image_URL) VALUES('@jonsnow', 'js@got.com', 'https://www.flaticon.com/premium-icon/icons/svg/2202/2202112.svg');
INSERT INTO users(user_handle, email, user_image_URL) VALUES('@voldemort', 'he-who-must-not-be-named@hp.com', 'https://www.flaticon.com/svg/static/icons/svg/2332/2332786.svg');

UPDATE posts SET image_url='https://media4.giphy.com/media/LLxwPAjfpLak8/200.gif' WHERE id=2;


UPDATE posts SET user_id=1 WHERE id=1;