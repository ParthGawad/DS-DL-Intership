create table Emp (
emp_name varchar(30),
emp_no int primary key,
emp_address varchar(50),
salary int not null
);
select * from emp;

insert into emp (emp_name,emp_no,emp_address,salary) values 
('Raj',1,'Mumbai',5000),
('Sam',2,'Delhi',6969),
('Om',3,'UK',9000),
('Max',4,'US',6869);

update Emp Set emp_name = 'ghost' where emp_no = 1;

alter table Emp add column skin_color varchar(10);

create table niggers (
nigga1 varchar(10),
nigga2 varchar(10),
nigga3 varchar(10)
);

drop table niggers;

CREATE TABLE classroom (
rollno int8 PRIMARY KEY,
name varchar(50) NOT NULL,
house char(12) NOT NULL,
grade char(1)
);

INSERT INTO classroom(rollno, name, house,grade) VALUES
(1, 'Sam', 'Akash', 'B'),
(2, 'Ram', 'Agni', 'A'),
(3, 'Shyam', 'Jal', 'B'),
(4, 'Sundar', 'Agni', 'A'),
(5, 'Ram', 'Yayu', 'B');

Select * from classroom;
Select rollno from classroom;
Select Distinct grade from classroom;
select name from classroom where grade = 'A';
SELECT rollno FROM classroom LIMIT 3;
SELECT house FROM classroom ORDER BY name ASC;


CREATE TABLE customer (
customer_id int8 PRIMARY KEY,
first_name varchar(50),
last_name varchar(50), email varchar(100),
address_id int8
);

copy customer (customer_id, first_name, last_name, email, address_id)
FROM 'C:\Program Files\PostgreSQL\17\data\customer.csv'
DELIMITER ','
CSV HEADER;

select * from customer;
SELECT UPPER(first_name) from customer
SELECT LOWER(first_name) from customer
SELECT LENGTH(first_name), first_name from customer
SELECT SUBSTRING(first_name , 1 ,3), first_name from customer
SELECT NOW();
SELECT CONCAT (first_name , last_name), first_name, last_name from customer
SELECT REPLACE (first_name , 'Mary', 'Max'), first_name, last_name from customer
SELECT TRIM(' Hello World ');

SELECT COUNT (*) FROM payment;
SELECT SUM (amount) FROM payment;
SELECT MAX (amount) FROM payment;
SELECT MIN (amount) FROM payment;
SELECT AVG (amount) FROM payment;
SELECT ROUND( AVG (amount) , 2) FROM payment; //ROUND OFF

SELECT mode, SUM(amount) AS total FROM payment GROUP BY ASC
SELECT mode, COUNT(amount) AS total FROM payment GROUP BY mode HAVING COUNT(amount) >= 3