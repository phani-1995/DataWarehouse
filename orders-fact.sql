create database Warehouse;
use Warehouse;
create table customer_dim(cust_ID INT primary key, cust_num varchar(255),
 cust_name varchar(255), cust_city varchar(255));
 
LOAD DATA LOCAL INFILE '/home/phani/Star Schema/datasets/customer.csv' 
INTO TABLE customer_dim
FIELDS TERMINATED BY ',' 
ENCLOSED BY "'"
LINES TERMINATED BY '\n';

create table order_dim(order_id INT primary key, order_no INT, order_amt INT,
eff_date DATE, exp_date DATE);


LOAD DATA LOCAL INFILE '/home/phani/Star Schema/datasets/orders.csv' 
INTO TABLE order_dim
FIELDS TERMINATED BY ',' 
ENCLOSED BY "'"
LINES TERMINATED BY '\n';

create table product_dim(prd_id INT primary key, prd_name varchar(255),
prd_grp varchar(255));

LOAD DATA LOCAL INFILE '/home/phani/Star Schema/datasets/products.csv' 
INTO TABLE product_dim
FIELDS TERMINATED BY ',' 
ENCLOSED BY "'"
LINES TERMINATED BY '\n';

create table date_dim(dt_id INT primary key, dt DATE, Quater varchar(255));

LOAD DATA LOCAL INFILE '/home/phani/Star Schema/datasets/Date.csv' 
INTO TABLE date_dim
FIELDS TERMINATED BY ',' 
ENCLOSED BY "'"
LINES TERMINATED BY '\n';

create table sales_order_fact(cust_ID INT, order_id INT, prd_id INT, dt_id INT, order_amt double,
FOREIGN KEY (cust_ID) REFERENCES customer_dim(cust_ID),
FOREIGN KEY (order_id) REFERENCES order_dim(order_id), 
FOREIGN KEY (prd_id) REFERENCES product_dim(prd_id),
FOREIGN KEY (dt_id) REFERENCES date_dim(dt_id));


INSERT INTO sales_order_fact(
select c.cust_ID, o.order_id, p.prd_id, d.dt_id, o.order_amt From customer_dim as c, order_dim as o, product_dim as p,
date_dim as d Where c.cust_ID = o.order_id AND p.prd_id = d.dt_id);

select * from sales_order_fact;
