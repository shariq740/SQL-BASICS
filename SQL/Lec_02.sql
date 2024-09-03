CREATE DATABASE fellow;
SHOW DATABASES;
USE fellow;
SELECT database();
SHOW TABLES;
CREATE TABLE COUSRSES(
CouseID INT AUTO_INCREMENT,
CouseName VARCHAR(50) NOT NULL,
Duration VARCHAR(50) NOT NULL,
Fee VARCHAR(50) NOT NULL,
PRIMARY KEY(CouseID )
);

desc COUSRSES;

ALTER TABLE COUSRSES 
MODIFY COLUMN FEE INT NOT NULL; 


ALTER TABLE COUSRSES 
RENAME COLUMN CouseID TO CourseID; 

ALTER TABLE COUSRSES RENAME COURSES; 
desc COURSES;

INSERT INTO Courses(CouseName,Duration,Fee) VALUES("THE COMPLETE EXCEL MASTERY COURSES",3,1499);
INSERT INTO Courses(CouseName,Duration,Fee) VALUES("DSA FOR UNTERVIEW PREPRATION",2,4999);
INSERT INTO Courses(CouseName,Duration,Fee) VALUES("SQL BOOTCAMP",1,2999);

SELECT *FROM Courses;


CREATE TABLE LEARNER(
LearnerID int AUTO_INCREMENT,
FirstName varchar(50) NOT NULL ,
LastName varchar(50) NOT NULL ,
Learner_Phone_Number varchar(15) NOT NULL ,
Learner_Email varchar(50) NOT NULL ,  
Learner_Enroll_DATE TIMESTAMP NOT NULL ,
Selected_Course INT NOT NULL ,
Year_Of_Experience INT NOT NULL ,
Learner_Company varchar(50),
SOJ varchar(50) NOT NULL ,
Batch_Date TIMESTAMP NOT NULL ,
Location varchar(50) NOT NULL ,
PRIMARY KEY(LearnerID)  , -- must not be null and must be unique
UNIQUE KEY(Learner_Email) , -- can be null but can't   be unique
FOREIGN KEY (Selected_Course) REFERENCES Courses(CourseID)
);

DESC LEARNER;

INSERT INTO LEARNER (FirstName,LastName,Learner_Phone_Number,Learner_Email,Learner_Enroll_DATE,Selected_Course,Year_Of_Experience,Learner_Company,SOJ,Batch_Date,Location) 
VALUES("Akash", "Mishra", '9998887776', "akash@gmail.com", '2024-01-21', 1, 4, "Amazon", "LinkedIn", '2024-02-29', "Bengaluru");

INSERT INTO LEARNER (FirstName,LastName,Learner_Phone_Number,Learner_Email,Learner_Enroll_DATE,Selected_Course,Year_Of_Experience,Learner_Company,SOJ,Batch_Date,Location) 
VALUES("Rishikesh","Joshi","9950192388", "carjkop@gmail.com", '2024-03-19', 3, 2, "HCL", "Youtube", '2024-03-25', "Chennai");

INSERT INTO LEARNER (FirstName,LastName,Learner_Phone_Number,Learner_Email,Learner_Enroll_DATE,Selected_Course,Year_Of_Experience,Learner_Company,SOJ,Batch_Date,Location) 
VALUES("Jeevan","Hegde", "9657856732","jeevanhegdek@yahoo.co.in", '2024-01-15', 2, 0, "", "Linkedin", '2024-01-16', "Noida");

INSERT INTO LEARNER (FirstName,LastName,Learner_Phone_Number,Learner_Email,Learner_Enroll_DATE,Selected_Course,Year_Of_Experience,Learner_Company,SOJ,Batch_Date,Location) 
VALUES("Akhil","George","7689558930", "akhil.george.8743@gmail.com", '2024-03-13', 3, 4, "Accenture", "Community", '2024-03-25', "Bengaluru");

INSERT INTO LEARNER (FirstName,LastName,Learner_Phone_Number,Learner_Email,Learner_Enroll_DATE,Selected_Course,Year_Of_Experience,Learner_Company,SOJ,Batch_Date,Location) 
VALUES("Sidhish","Kumar","6475765443", "sidhishkumar@gmail.com",'2024-01-10', 1, 4, "Meta", "Youtube", '2024-03-29', "Bengaluru");

INSERT INTO LEARNER (FirstName,LastName,Learner_Phone_Number,Learner_Email,Learner_Enroll_DATE,Selected_Course,Year_Of_Experience,Learner_Company,SOJ,Batch_Date,Location) 
VALUES("NagaSai","Sreedhar","9182937061", "saisreedhar2001@gmail.com", '2024-03-17', 3, 4, "TCS", "Community", '2024-03-25', "Mumbai");


-- DISPLAY NO OF ENROLLMENT ON SITE

SELECT COUNT(*) as num_of_enrollments
FROM LEARNER;

-- display no of enrollment for course id 3

SELECT COUNT(LearnerID)  as for_id_3 
FROM LEARNER
WHERE Selected_Course=3;	

-- count enrollment with jan

SELECT COUNT(*) as enroll_in_jan FROM LEARNER
WHERE Learner_Enroll_DATE LIKE '%-01-%'
;



-- DAY 3 AGGREGATION AND GROUPING
-- COUNT THE NO OF STUDENTS WHO JOINED COURSE VIA

SELECT *FROM LEARNER;

SELECT SOJ , COUNT(*) as source_of_joining
FROM LEARNER GROUP BY SOJ;

SELECT SOJ , LOCATION, COUNT(*) as source_of_joining
FROM LEARNER GROUP BY SOJ,LOCATION;

-- CORRESPONDING TO EACH COURSE HOW MANY STUDENTS HAVE EROLLED

SELECT Selected_Course, COUNT(*) as course_strength FROM LEARNER GROUP BY Selected_Course;

-- get output reggarding maximum no of years 