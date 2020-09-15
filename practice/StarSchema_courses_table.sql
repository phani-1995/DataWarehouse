show databases;

-- Creating Database
create database starschema;
use starschema;
-- Creating table 
create table Dim_personalDetails(personalid INT primary key,
Name varchar(255), Age INT, PhoneNo Varchar(255));


-- Loading data from local 
LOAD DATA LOCAL INFILE '/home/phani/Desktop/schema.csv' 
INTO TABLE Dim_personalDetails
FIELDS TERMINATED BY ',' 
ENCLOSED BY "'"
LINES TERMINATED BY '\n';

-- creating second table 
create table Dim_educ_Details(course_id INT primary key,
course_name varchar(255), duration INT);

-- Loading data to table 
LOAD DATA LOCAL INFILE '/home/phani/Desktop/course.csv' 
INTO TABLE Dim_educ_Details
FIELDS TERMINATED BY ',' 
ENCLOSED BY "'"
LINES TERMINATED BY '\n';

-- creating third table 
create table Dim_Fee_Details(Fee_id INT primary key,
course_name varchar(255), amount INT);

LOAD DATA LOCAL INFILE '/home/phani/Desktop/fees.csv' 
INTO TABLE Dim_Fee_Details
FIELDS TERMINATED BY ',' 
ENCLOSED BY "'"
LINES TERMINATED BY '\n';

-- Creating fact table

Create table course_fact (personalid INT, course_id INT, amount INT,
FOREIGN KEY (personalid) REFERENCES Dim_personalDetails(personalid),
FOREIGN KEY (course_id) REFERENCES Dim_educ_Details(course_id)
);


-- loading data to fact table from dimenssion tables
insert into course_fact (
SELECT p.personalid, c.course_id, a.amount
FROM Dim_personalDetails as p, Dim_educ_Details as c, Dim_Fee_Details as a 
where p.personalid = c.course_id);

select * from course_fact;

