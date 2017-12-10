DROP DATABASE IF EXISTS cs166_raymond;
CREATE DATABASE cs166_raymond;
USE cs166_raymond;

CREATE TABLE login (
  fullname  VARCHAR(128) DEFAULT NULL,
  user  VARCHAR(32) NOT NULL,
  pass VARCHAR(64) NOT NULL,
  salt VARCHAR(32) NOT NULL,
  PRIMARY KEY (user)
);

CREATE TABLE blogs (
 blog_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
 user VARCHAR(32) NOT NULL,
 title VARCHAR(32),
 body TEXT,
 date DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 FOREIGN KEY (user)
	REFERENCES login(user) ON DELETE CASCADE ON UPDATE CASCADE,
 PRIMARY KEY (blog_id)	
);


-- Test database for SQL Injection demo
CREATE DATABASE cs166_test;
USE cs166_test;

-- For simplicity, no SALT column for this test database
CREATE TABLE login (
  fullname  VARCHAR(128) DEFAULT NULL,
  user  VARCHAR(32) NOT NULL,
  pass VARCHAR(64) NOT NULL,
  PRIMARY KEY (user)
);

CREATE TABLE blogs (
 blog_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
 user VARCHAR(32) NOT NULL,
 title VARCHAR(32),
 body TEXT,
 date DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 FOREIGN KEY (user)
	REFERENCES login(user) ON DELETE CASCADE ON UPDATE CASCADE,
 PRIMARY KEY (blog_id)	
);

INSERT INTO login(fullname, user, pass) VALUES('Estelle Bright', 'estelle', sha2('secret', 256));
INSERT INTO login(fullname, user, pass) VALUES('Joshua Bright', 'joshua', sha2('secret', 256));
INSERT INTO login(fullname, user, pass) VALUES('Kevin Graham', 'kevin', sha2('secret', 256));
INSERT INTO login(fullname, user, pass) VALUES('Renne Anderson', 'renne', sha2('secret', 256));
INSERT INTO login(fullname, user, pass) VALUES('Kevin Jones', 'kevin', sha2('secret', 256));
INSERT INTO login(fullname, user, pass) VALUES('Olivier Lenheim', 'olivier', sha2('secret', 256));
INSERT INTO login(fullname, user, pass) VALUES('Rean Schwarzer', 'rean', sha2('secret', 256));


INSERT INTO blogs(user, title, body) VALUES('rean', 'Eight Leaves One Blade', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus eget leo pretium, consectetur lacus eu, auctor lorem. Donec varius ligula sit amet massa elementum faucibus. Morbi luctus malesuada pretium. Morbi facilisis, nisl ut viverra gravida, lorem dui aliquam dui, sed ultrices magna elit at eros. Curabitur ac mattis justo. Nunc ornare neque et neque commodo, et dictum ante luctus. Aliquam molestie odio neque, vel semper arcu malesuada sit amet. Vestibulum est purus, bibendum id ipsum at, commodo porta tellus. Vestibulum eros turpis, cursus fringilla erat id, euismod imperdiet orci. Phasellus consequat ultrices orci, non blandit nisi dictum quis. Morbi et nulla quam. Nullam nec mauris et elit maximus eleifend. Nullam tortor nunc, condimentum sit amet urna a, tincidunt pellentesque magna. Nunc molestie, urna non tempor porttitor, orci erat aliquet ligula, et iaculis leo lorem non diam.');
INSERT INTO blogs(user, title, body) VALUES('estelle', 'The Bright Family', 'Wow, they are so bright');
INSERT INTO blogs(user, title, body) VALUES('kevin', 'Healthy Food and You', 'An apple a day keeps the doctor away');
INSERT INTO blogs(user, title, body) VALUES('Joshua', 'Java Programming for Dummies', 'Lorem ipsum dolor sit amet');


-- Create new user account for sql injection demo
CREATE USER 'injection'@'localhost' IDENTIFIED BY 'injection';
GRANT ALL ON cs166_test.* TO 'injection'@'localhost';
FLUSH PRIVILEGES;