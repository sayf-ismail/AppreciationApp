CREATE DATABASE appreciation_app_db;

CREATE TABLE posts(id SERIAL PRIMARY KEY, giver TEXT, receiver TEXT, message TEXT, timestamp TIMESTAMP, image_url TEXT);

INSERT INTO posts(giver, receiver, message, image_url) VALUES('jonsnow', 'danytarg', 'Thanks for saving me from the undead at that lake with all those dragons and stuff...sorry one died!', 'https://i.imgur.com/fTcxtZO.jpg');
