CREATE DATABASE IF NOT EXISTS notes;

USE notes;

CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';

GRANT ALL PRIVILEGES ON * . * TO 'admin'@'localhost';

FLUSH PRIVILEGES;

CREATE TABLE IF NOT EXISTS thoughts (id INT AUTO_INCREMENT PRIMARY KEY, text VARCHAR(255));




