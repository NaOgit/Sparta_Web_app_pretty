DROP TABLE IF EXISTS post;
-- remove table called "post"

CREATE TABLE post (

  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  type VARCHAR(255)
);

INSERT INTO post (name, type) VALUES ('Pokemon#1' , 'Grass');
INSERT INTO post (name, type) VALUES ('Pokemon#2' , 'Fire');
INSERT INTO post (name, type) VALUES ('Pokemon#3' , 'Water');
INSERT INTO post (name, type) VALUES ('Pokemon#4' , 'Bug');

-- template
-- create table for database
