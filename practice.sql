-- 1. Create a database for your company named for example TechSeeker? 
CREATE DATABASE TechSeeker;
USE TechSeeker;
CREATE TABLE Employ(
id INT PRIMARY KEY,
name VARCHAR(50),
Salary INT NOT NULL
);

INSERT INTO Employ(id, name ,salary) VALUES (1,"Munawar",20000),(2,"Zubair",50000),(3,"Sohail",120000);

SELECT* FROM Employ;


-- 2. Write the Query to find avg salary in each city in ascending order.
CREATE TABLE Employes(
id INT PRIMARY KEY,
name VARCHAR(50),
salary int NOT NULL,
city VARCHAR(50)
);
INSERT INTO Employes(id, name ,salary,city) VALUES (1,"Munawar",20000,"SKD"),(2,"Kamal",40000,"SKD"),(3,"Munawar",60000,"KMG"),(4,"Munawar",20000,"SHG"),(5,"Anjum",200000,"SKD");
SELECT city, AVG(salary) FROM Employes GROUP BY city ORDER BY city ASC; 



-- find the total payment according to each payment method
CREATE TABLE Payment(
customer_id INT PRIMARY KEY,
customer_name VARCHAR(50),
mode VARCHAR(50),
city VARCHAR(50)
);
INSERT INTO Payment(customer_id, Customer_name ,mode,city) VALUES (1,"Munawar","netbanking","SKD"),(2,"Kamal","Netbanking","SKD"),(3,"Irfan","Credit","KMG"),(4,"Ali","Debit","SHG"),(5,"Anjum","Debit","SKD");
SELECT mode, COUNT(mode) FROM Payment GROUP BY mode;

 -- in the course table
-- a. Change the teacher of column “teacher “to “instructor”.
-- b. Delete all the instructor who are greater than 60.
-- 3.Delete the column for phone 

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



SELECT* FROM course;

ALTER TABLE course
CHANGE teacher instructor VARCHAR(50);
SELECT* FROM course;


DELETE FROM course 
WHERE age>60;
SELECT* FROM course;

ALTER TABLE course
DROP COLUMN phone;
SELECT* FROM course;

-- Write SQL Commands to display the right exclusive join;
CREATE TABLE department(
id INT PRIMARY KEY,
name VARCHAR(50)
);
INSERT INTO department(id,name)
VALUES
(2,"COMPUTER SCIENCE"),
(3,"Information Technology"),
(4,"Data Science");

-- For left exclusive 
SELECT*
FROM department as d 
LEFT JOIN course as c
ON d.id=c.id
where d.id;

-- For right exclusive
SELECT*
FROM department as d 
RIGHT JOIN course as c
ON d.id=c.id
where c.id IS NULL;

-- For full exclusive join 
SELECT*
FROM department as d 
LEFT JOIN course as c
ON d.id=c.id
WHERE d.id=NULL
UNION
SELECT*
FROM department as d 
RIGHT JOIN course as c
ON d.id=c.id
WHERE c.id=NULL;



