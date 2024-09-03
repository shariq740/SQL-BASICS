CREATE DATABASE roster;
USE roster;
SHOW DATABASES;
SELECT * FROM roster;
DROP TABLE IF EXISTS `Member`;
DROP TABLE IF EXISTS `User`;
DROP TABLE IF EXISTS `Course`;

CREATE TABLE `User` (
    user_id     INTEGER NOT NULL AUTO_INCREMENT,
    name        VARCHAR(128) UNIQUE,
    PRIMARY KEY(user_id)
);


CREATE TABLE `Course` (
    course_id     INTEGER NOT NULL AUTO_INCREMENT,
    title         VARCHAR(128) UNIQUE,
    PRIMARY KEY(course_id)
); 
CREATE TABLE `Member` (
    user_id       INTEGER,
    course_id     INTEGER,
    role          INTEGER,

    CONSTRAINT FOREIGN KEY (user_id) REFERENCES `User` (user_id)
      ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FOREIGN KEY (course_id) REFERENCES `Course` (course_id)
      ON DELETE CASCADE ON UPDATE CASCADE,

    PRIMARY KEY (user_id, course_id)
) ;


INSERT INTO `User` (name) VALUES 
('Coel'), ('Angela'), ('Darryn'), ('Jarell'), ('Vaimante'),
('Maanisha'), ('Jemma'), ('Joshiah'), ('Kaitlin'), ('Oz'),
('Muriel'), ('Morgan'), ('Murrun'), ('Una'), ('Zunaira');


INSERT INTO `Course` (title) VALUES 
('si106'), ('si110'), ('si206');


INSERT INTO `Member` (user_id, course_id, role) VALUES 
((SELECT user_id FROM `User` WHERE name='Coel'), (SELECT course_id FROM `Course` WHERE title='si106'), 1),
((SELECT user_id FROM `User` WHERE name='Angela'), (SELECT course_id FROM `Course` WHERE title='si106'), 0),
((SELECT user_id FROM `User` WHERE name='Darryn'), (SELECT course_id FROM `Course` WHERE title='si106'), 0),
((SELECT user_id FROM `User` WHERE name='Jarell'), (SELECT course_id FROM `Course` WHERE title='si106'), 0),
((SELECT user_id FROM `User` WHERE name='Vaimante'), (SELECT course_id FROM `Course` WHERE title='si106'), 0),
((SELECT user_id FROM `User` WHERE name='Maanisha'), (SELECT course_id FROM `Course` WHERE title='si110'), 1),
((SELECT user_id FROM `User` WHERE name='Jemma'), (SELECT course_id FROM `Course` WHERE title='si110'), 0),
((SELECT user_id FROM `User` WHERE name='Joshiah'), (SELECT course_id FROM `Course` WHERE title='si110'), 0),
((SELECT user_id FROM `User` WHERE name='Kaitlin'), (SELECT course_id FROM `Course` WHERE title='si110'), 0),
((SELECT user_id FROM `User` WHERE name='Oz'), (SELECT course_id FROM `Course` WHERE title='si110'), 0),
((SELECT user_id FROM `User` WHERE name='Muriel'), (SELECT course_id FROM `Course` WHERE title='si206'), 1),
((SELECT user_id FROM `User` WHERE name='Morgan'), (SELECT course_id FROM `Course` WHERE title='si206'), 0),
((SELECT user_id FROM `User` WHERE name='Murrun'), (SELECT course_id FROM `Course` WHERE title='si206'), 0),
((SELECT user_id FROM `User` WHERE name='Una'), (SELECT course_id FROM `Course` WHERE title='si206'), 0),
((SELECT user_id FROM `User` WHERE name='Zunaira'), (SELECT course_id FROM `Course` WHERE title='si206'), 0);


SELECT `User`.name, `Course`.title, `Member`.role
FROM `User` 
JOIN `Member` ON `User`.user_id = `Member`.user_id 
JOIN `Course` ON `Member`.course_id = `Course`.course_id
ORDER BY `Course`.title, `Member`.role DESC, `User`.name;

SELECT roster;
