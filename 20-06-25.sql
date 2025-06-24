show timezone
select now()
select timeofday()
select current_time
select current_date

select extract (month from payment_date) AS payment_month, payment_date From payment
select extract (year from payment_date) AS payment_month, payment_date From payment
select extract (quarter from payment_date) AS payment_month, payment_date From payment

CREATE TABLE payment (
customer_id BIGINT PRIMARY KEY,
amount BIGINT NOT NULL,
mode VARCHAR(50),
payment_date DATE
);

CREATE TABLE customer (
customer_id BIGINT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
address_id BIGINT
);

INSERT INTO customer (customer_id, first_name, last_name, address_id) VALUES
(1, 'Mary', 'Smith', 5),
(2, 'Linda', 'Williams', 7),
(3, 'Barbara', 'Jones', 8),
(4, 'Madan', 'Mohan', 6);

INSERT INTO payment (customer_id, amount, mode, payment_date) VALUES
(1, 60, 'Cash', '2020-09-24'),
(2, 30, 'Credit Card', '2020-04-27'),
(8, 110, 'Cash', '2021-01-26'),
(10, 70, 'mobile Payment', '2021-02-28'),
(11, 80, 'Cash', '2021-03-01')

SELECT *
FROM customer AS c
INNER JOIN payment AS p
ON c.customer_id = p.customer_id

SELECT *
FROM customer AS c
LEFT JOIN payment AS p
ON c.customer_id = p.customer_id

SELECT *
FROM customer AS c
RIGHT JOIN payment AS p
ON c.customer_id = p.customer_id

SELECT *
FROM customer AS c
FULL OUTER JOIN payment AS p
ON c.customer_id = p.customer_id

Select c.* from customer c left join payment p on c.customer_id = p.customer_id where p.customer_id is null;
Select p.* from payment p left join customer c on p.customer_id = c.customer_id where c.customer_id is null;

CREATE TABLE emp (
empid BIGINT PRIMARY KEY,
empname VARCHAR(50),
manager_id BIGINT,
FOREIGN KEY (manager_id) REFERENCES emp(empid)
);

INSERT INTO emp (empid, empname, manager_id) VALUES
(1, 'Agni', 3),
(2, 'Akash', 4),
(3, 'Dharti', 2),
(4, 'Vayu', 3);

Select t1.empname as employee_name, t2.empname as manager_name from emp as t1 join emp as t2 on t1.manager_id = t2.empid;

CREATE TABLE custA
(
cust_name VARCHAR(30),
cust_amount BIGINT
);

CREATE TABLE custB
(
cust_name VARCHAR(30),
cust_amount BIGINT
);
-- Insert into custA
INSERT INTO custA

(cust_name, cust_amount) VALUES

('Madan Mohan', 2100),
('Gopi Nath', 1200),
('Govind Dev', 5000);

-- Insert into custB
INSERT INTO custB

(cust_name, cust_amount) VALUES

('Gopal Bhat', 1500),
('Madan Mohan', 2100);

SELECT cust_name, cust_amount from custA
UNION
SELECT cust_name, cust_amount from custB

create table test_data (
new_id BIGINT,
new_cat varchar
);

insert into test_data(new_id,new_cat) values
(100,'Agni'),
(200,'Agni'),
(200,'Vayu'),
(300,'Vayu'),
(500,'Vayu'),
(500, 'Dharti'),
(700, 'Dharti');

SELECT new_id, new_cat,
SUM(new_id) OVER( PARTITION BY new_cat ORDER BY new_id ) AS "Total",
AVG(new_id) OVER( PARTITION BY new_cat ORDER BY new_id ) AS "Average",
COUNT(new_id) OVER( PARTITION BY new_cat ORDER BY new_id ) AS "Count",
MIN(new_id) OVER( PARTITION BY new_cat ORDER BY new_id ) AS "Min",
MAX(new_id) OVER( PARTITION BY new_cat ORDER BY new_id ) AS "Max"
FROM test_data

SELECT new_id, new_cat,
SUM(new_id) OVER( ORDER BY new_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS "Total",
AVG(new_id) OVER( ORDER BY new_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS "Average",
COUNT(new_id) OVER( ORDER BY new_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS "Count",
MIN(new_id) OVER( ORDER BY new_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS "Min",
MAX(new_id) OVER( ORDER BY new_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS "Max"
FROM test_data

SELECT new_id,
ROW_NUMBER() OVER(ORDER BY new_id) AS "ROW_NUMBER",
RANK() OVER(ORDER BY new_id) AS "RANK",
DENSE_RANK() OVER(ORDER BY new_id) AS "DENSE_RANK",
PERCENT_RANK() OVER(ORDER BY new_id) AS "PERCENT_RANK"
FROM test_data

SELECT new_id,
FIRST_VALUE(new_id) OVER( ORDER BY new_id) AS "FIRST_VALUE",
LAST_VALUE(new_id) OVER( ORDER BY new_id) AS "LAST_VALUE",
LEAD(new_id) OVER( ORDER BY new_id) AS "LEAD",
LAG(new_id) OVER( ORDER BY new_id) AS "LAG"
FROM test_data