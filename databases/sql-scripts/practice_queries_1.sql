show databases;
use july_restart_ent;
show tables;

-- Selecting all columns from the various tables
select * from customers;
select * from employees;
select * from orderdetails;
select * from orders;
select * from payments;

-- Sample reports from the july_restart_ent database
-- 1.  Give me the records of products which have 136 price exactly.
SELECT *
FROM orderdetails
WHERE priceEach = 136;

-- 2. Give me all employees in San Francisco office.
SELECT *
FROM employees
WHERE officeCode = 1;

--  3. How can you tell if an employee is a sales manager or not?
SELECT *
FROM employees
WHERE jobTitle = 'Sales Manager';

-- 4. Present a report on payments made more than 10,000.00. For each of this record deduct 100.oo and display under new heading called amount. 
SELECT customerNumber, checkNumber paymentDate, amount - 100 AS amount
FROM payments
WHERE amount > 10000;

-- 5. List payments made from 2003 and above where the amount is either greater than 10,000 or less than 5,000.
SELECT *
FROM payments
WHERE paymentDate >= '2003-01-01' 
AND (amount > 10000 OR amount < 50000);

