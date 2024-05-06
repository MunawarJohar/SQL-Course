-- for creating database 
CREATE DATABASE Firstdatabase;
create database secondDB;

-- for deleting database 
DROP DATABASE Firstdatabase;
DROP DATABASE secondDB;

DROP DATABASE IF EXISTS Firstdatabase;


CREATE DATABASE Schools;

CREATE DATABASE IF NOT EXISTS Schools;


SHOW DATABASES;

-- for using existing database 
USE Schools;
-- Creating our tables 
CREATE TABLE student(
id INT PRIMARY KEY,
name VARCHAR(50),
age INt NOT NULL
);



INSERT INTO student VALUES (1, "Munawar",24);
INSERT INTO student VALUES (2, "Kamal",25);
INSERT INTO student VALUES (3, "Raziq",23);
INSERT INTO student VALUES (4, "Mar z",18);

SELECT* FROM student;
SHOW TABLES;

-- DROP TABLE Student;

-- for inserting multiple rows  
INSERT INTO student(id, name ,age) VALUES (5,"Asghar",26),(6,"Zubair",5),(7,"Sohail",12);

-- for single row insertion
INSERT INTO student VALUES (10, "Munawar",30);



CREATE TABLE Table1(
id INT UNIQUE
);

INSERT INTO Table1 VALUES (11);
-- this show duplication error
INSERT INTO Table1 VALUES (11);

CREATE TABLE table2(
id INT,
name VARCHAR(50),
age INT,
city VARCHAR(50),
-- if we use two attributes as a primary key then combination will be unque 
PRIMARY KEY(id,name) 
);
INSERT INTO  table2(id, name ,age,city) VALUES (1,"Munawar",20,"Skardu"),(2,"Zubair",5,"Karachi"),(2,"Sohail",12,"Skardu"),(3,"Zubair",5,"Karachi");
SELECT* FROM table2; 



CREATE TABLE table3(
id INT,
name VARCHAR(50),
salary INT DEFAULT 30000
);
INSERT INTO table3 VALUES  (id,name,salary),(1,"Munawar",20000),(2,"alam",0);
SELECT* FROM table3;




CREATE DATABASE UniversityDB;
USE UniversityDB;
CREATE TABLE Student(
regno INT PRIMARY KEY,
name VARCHAR(50),
marks INT NOT NULL,
grade VARCHAR(1),
city VARCHAR(20)
);

INSERT INTO Student(regno,name ,marks,grade,city) VALUES 
(1,"Munawar",90,"A","Skardu"),
(2,"Kamal",70,"B","Skardu"),
(3,"Alam",95,"A","Skardu");

INSERT INTO Student(regno,name ,marks,grade,city) VALUES 
(4,"Qadir",100,"A","KMG"),
(5,"Kamal",60,"B","SHG"),
(6,"Hasu",50,"C","Karachi");

SELECT* FROM Student;
SELECT city FROM student;
SELECT DISTINCT city FROM student;

SELECT* FROM student where marks > 65;
SELECT* FROM student where city = "Skardu";

-- two conditions
 
SELECT* FROM student where city = "Skardu" and marks>70;

-- operators 

SELECT* FROM student where city = "Skardu" or marks>60;

SELECT* FROM student marks  WHERE marks BETWEEN 65 AND 90;

SELECT* FROM student WHERE city IN("SKD","KMG","SHG");
--  reverse the condition
SELECT* FROM student WHERE city NOT IN("SKD","KMG","SHG");

SELECT* FROM student WHERE marks>65 LIMIT 3;

-- ORDER BY Clause
SELECT*FROM student ORDER BY marks ASC;

SELECT*FROM student ORDER BY marks DESC LIMIT 3;


-- Aggrestion Functions 
SELECT MAX(marks) FROM student;
SELECT AVG(marks) FROM student;

SELECT MIN(marks) FROM student;

SELECT COUNT(regno) FROM student;

-- GROUP by Clause
SELECT city FROM student GROUP BY city;

SELECT city, COUNT(name) FROM student GROUP BY city;

SELECT city, avg(marks) FROM student GROUP BY city;

SELECT grade, COUNT(regno) FROM student GROUP BY grade ORDER BY grade ASC;


-- Having clause 
SELECT city, count(regno) FROM student GROUP BY city HAVING MAX(marks>90);

-- General order 
SELECT city
FROM student
WHERE grade="A"
GROUP BY city
HAVING MAX(marks)>95
ORDER BY city DESC;

-- table related queries
-- update mode
SET SQL_SAFE_UPDATES=0;

UPDATE student 
SET grade="outstanding"
WHERE grade="A" AND marks=100;
SELECT* FROM student;

-- Delete query 
DELETE FROM student
WHERE marks=70;

-- Foreign key Revisting

CREATE TABLE Dept(
id INT PRIMARY KEY,
name VARCHAR(50)
);

INSERT INTO Dept(id,name)
VALUES
(202,"COMPUTER SCIENCE"),
(203,"Information Technology"),
(204,"Data Science");

SELECT* FROM Dept;

-- Cascading for Foreign key
CREATE TABLE INSTRUCTOR(
id INT PRIMARY KEY,
instructor_name VARCHAR(50),
dept_id INT,
FOREIGN KEY (dept_id) REFERENCES dept(id)
ON UPDATE CASCADE
ON DELETE CASCADE
);


INSERT INTO INSTRUCTOR(id,instructor_name,dept_id)
VALUES
(202,"Munawar Johar",202),
(203,"Zulfiqar",203),
(204,"Saira Batool",204);

SELECT* FROM INSTRUCTOR;



-- Alter 
ALTER TABLE student
ADD COLUMN age INt NOT NULL DEFAULT 20;
SELECT* FROM student;


-- Change age 
ALTER TABLE student
CHANGE age std_age INT;
SELECT* FROM student;

-- DROP Table
ALTER TABLE student
DROP COLUMN age;
SELECT* FROM student;

-- RENAME
ALTER TABLE student
RENAME TO STUDENTS;
SELECT* FROM STUDENTS;
-- again Rename the table name
ALTER TABLE STUDENTS
RENAME TO student;
SELECT* FROM student;


-- TRUNCATE command Delete the whole record from table but table is exist.
-- DROP command delete the whole reocord including with table 
TRUNCATE studentss;

-- JOINS in SQL 
-- INNER Join
CREATE TABLE department(
id INT PRIMARY KEY,
name VARCHAR(50)
);

INSERT INTO department(id,name)
VALUES
(2,"COMPUTER SCIENCE"),
(3,"Information Technology"),
(4,"Data Science");

CREATE TABLE course(
id INT PRIMARY KEY,
teacher VARCHAR(50),
age INT,
email VARCHAR(50),
phone INT);

INSERT INTO course(id, teacher ,age,email,phone) 
VALUES (1,"Munawar",30,"munawar@gmail.com",03555791615),
 (2,"Saira Batool",32,"saira@gmail.com",03555231610),
(3,"John",77,"john@gmail.com",03335331210),
 (4,"Kamal hassan",61,"kamal@gmail.com",03135431220),
(5,"Alex",64,"alex@gmail.com",023135433440);
-- inner join result
SELECT* 
FROM department as d
INNER JOIN course as c
ON d.id=c.id;
-- d and c is called alias 


-- LEFT JOIN 
SELECT*
FROM department as d 
LEFT JOIN course as c
ON d.id=c.id;

-- RIGHT JOIN 
SELECT*
FROM department as d 
RIGHT JOIN course as c
ON d.id=c.id;

-- FULL JOIN
SELECT*
FROM department as d 
LEFT JOIN course as c
ON d.id=c.id
UNION
SELECT*
FROM department as d 
RIGHT JOIN course as c
ON d.id=c.id;

-- SELF JOIN
CREATE TABLE Employee(
id INT PRIMARY KEY,
name VARCHAR(50),
suppervisor_id INT
);
INSERT INTO Employee(id,name,suppervisor_id)
VALUES
(2,"Kamal",3),
(3,"Munawar",2),
(4,"John",3);

SELECT e.name as Suppervisor_name, emp.name
FROM Employee as e 
JOIN Employee as emp
ON e.id=emp.suppervisor_id;

-- Union 
SELECT name FROM Employee
UNION ALL
SELECT name FROM Employee;

-- SQL Sub Queries
-- Get names of all students who age more than average.
-- Find the avg of class
-- Find the names of students with age > avg

SELECT* FROM student;
SELECT AVG(age)
FROM student;

SELECT name, age
FROM student
WHERE age>(SELECT AVG(age) FROM student);

-- Find the names of all students with even id.
-- Find the even ids of students
-- Find the names of students with even id.
-- step 1
SELECT id 
FROM student
WHERE id%2=0;

-- step 2
SELECT name 
FROM student
WHERE id IN(2,4,6);

-- using sub query
SELECT name ,id
FROM student
WHERE id IN( 
SELECT id
FROM student
WHERE id%2=0);

-- sub Query using FROM
-- Find the max age from student the name is Munawar's
-- step 1. Find the student of Munawar
-- step 2. Find their max age using the sublit in step 1.
SELECT MAX(age)
FROM (SELECT* FROM student WHERE name="Munawar") as newtable;

-- Another method 
SELECT MAX(age)
FROM student
WHERE name="Munawar";


-- MYSQL VIEWS
-- Skip id and age from course table creating view 
CREATE VIEW view1 AS
SELECT teacher,email,phone FROM course;

SELECT* FROM view1;