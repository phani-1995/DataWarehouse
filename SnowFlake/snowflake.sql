create database warehouse1;

use warehouse1;

create table Dimcity(city_id INT primary key,
city varchar(45), State_id INT, State_Name Varchar(45));
drop table Dimcity;
AlTER TABLE Dimcity add FOREIGN KEY (State_id) REFERENCES Dimcity(State_id);

create table Dimproperty(property_id INT primary key,
property_place varchar(45), propertySubtypename Varchar(45));

create table property_sales(sales_id INT primary key, propertySubtypename Varchar(45), 
price INT);

create table FactTable(city_id INT, property_id INT, sales_id INT, price INT,
FOREIGN KEY (city_id) REFERENCES Dimcity(city_id),
FOREIGN KEY (property_id) REFERENCES Dimproperty(property_id),
FOREIGN KEY (sales_id) REFERENCES property_sales(sales_id));

drop table FactTable;
LOAD DATA LOCAL INFILE '/home/phani/SnowFlake/datasets/Dimcity.csv' 
INTO TABLE Dimcity
FIELDS TERMINATED BY ',' 
ENCLOSED BY "'"
LINES TERMINATED BY '\n';

LOAD DATA LOCAL INFILE '/home/phani/SnowFlake/datasets/DimProperty.csv' 
INTO TABLE Dimproperty
FIELDS TERMINATED BY ',' 
ENCLOSED BY "'"
LINES TERMINATED BY '\n';


LOAD DATA LOCAL INFILE '/home/phani/SnowFlake/datasets/propertySales.csv' 
INTO TABLE property_sales
FIELDS TERMINATED BY ',' 
ENCLOSED BY "'"
LINES TERMINATED BY '\n';

create table DimState(State_id INT primary key, State_Name Varchar(45));

create table Sales(propertySubtypename varchar(45), price INT);

insert into FactTable(
select c.city_id, p.property_id, s.sales_id, s.price From Dimcity as c, Dimproperty as p, 
property_sales as s where c.city_id =  s.sales_id and s.sales_id = p.property_id);

insert into DimState(
select s.State_id, s.State_Name from Dimcity as s);

insert into Sales(
select p.propertySubtypename, p.price from property_sales as p);

select * from DimState;
