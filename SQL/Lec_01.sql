SHOW DATABASES;
CREATE DATABASE /*IF NOT EXISTS*/ stark;
USE stark;
SELECT database();
/*
CREATE TABLE employee(
EID   INT PRIMARY KEY, 
FirstName VARCHAR(50) NOT NULL,
LasttName VARCHAR(50) NOT NULL,
Age	INT NOT NULL,
Salary INT NOT NULL,
Location VARCHAR(50) NOT NULL
-- PRIMARY KEY(EID); COMPOSITE PRIMARY KEY used to have multiple primary key in the dbms
);
*/

/* DESCRIBE DESC  employee;*/
/*
SHOW TABLES; 
-- TABLE IS READY
-- 	INSERTION 
INSERT INTO employee VALUES (1,"MOHD","SHARIQ",22,1300000,"KANPUR");
DROP TABLE employee;
 */
 
CREATE TABLE employee(
EID   INT AUTO_INCREMENT, 
FirstName VARCHAR(50) NOT NULL,
LasttName VARCHAR(50) NOT NULL,
Age	INT NOT NULL,
Salary INT NOT NULL,
Location VARCHAR(50) NOT NULL,
PRIMARY KEY(EID)
);
INSERT INTO employee(FirstName,LasttName,Age,Salary,Location) VALUES ("MOHD","SHARIQ",22,1300000,"KANPUR");
INSERT INTO employee(FirstName,LasttName,Age,Salary,Location) VALUES ("AZEEM","SIDDIQUIE",21,100000,"KANPUR");
INSERT INTO employee(FirstName,LasttName,Age,Salary,Location) VALUES ("KUSHAGRA","SHARMA",24,700000,"KANPUR");
INSERT INTO employee(FirstName,LasttName,Age,Salary,Location) VALUES ("MUSKAN","GUPTA",23,2300000,"KANPUR");
INSERT INTO employee(FirstName,LasttName,Age,Salary,Location) VALUES ("SWATI","KUMARI",23,1900000,"KANPUR");

DROP TABLE employee;

SELECT *FROM employee;
SHOW TABLES;
-- FILTERING THE DATA
SELECT *FROM employee WHERE Salary > 100000;
SELECT FirstName,LasttName FROM employee WHERE Salary > 100000;
SELECT *FROM employee WHERE Age >= 22; /* WHERE IS USED FOR FILTERING THE TABLE DATA */

-- UPDATE(DATA MANIPULATION COMMAND,DML)- update the record inside table ie content of table AND ALTER(DATA DEFINITION LANGAUGE,DDL) is used to change the schema of the table ie,description
UPDATE employee SET FirstName = "SWEETY"
WHERE EID = 6;

UPDATE employee SET EID = "5"
WHERE EID = 6;

DESC employee;

DELETE  FROM employee WHERE EID = 5;
SELECT *FROM employee ORDER BY Salary DESC LIMIT  2;