CREATE DATABASE students;
USE students;

CREATE TABLE student_info (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE
);

INSERT INTO student_info (name, email) VALUES
('Alice', 'alice@example.com'),
('Bob', 'bob@example.com');

