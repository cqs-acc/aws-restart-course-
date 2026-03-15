show databases;
use AnyCompanyGlobal;
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

------------------------------------------------------------------------------------------------------------------------------
--Note this very important change.

-- The query number 3 will output records which have exact string value `Sales Manager` in the `jobTitle` column.
-- Though this is correct, a wrong value was outputted for `Sales Manager` as `Sale Manager`. 

-- Question: How do you modify the `WHERE` clause to select both `Sale and `Sales Manager` values from `jobTitle`? 

-- Answer: Use the `LIKE` comparator to match the required string with the wildcard `%`. 

-- How to use `%`?
-- Since both `Sales Manager and `Sale Manager` string have `Manager` as a common string we will use it for our matching. 

-- Given that `WHERE JobTiltle LIKE '%Manager' : this selects all characters that ends with `Manager` in the character stream

-- Given that `WHERE JobTitle LIKE 'Manager%' : this selects all characters that starts with `Manager in the character stream

-- To cleanly select the exact value required, use;
-- `WHERE jobTitle LIKE '%Manager%' :selects character stream before and after `Manager`. 

--Updated query 3 becomes:
-------------------------------------------------------------------------------------------------------------------------------

SELECT *
FROM employees
WHERE jobTitle LIKE '%Manager%'; -- `%` select all characters that  starts and ends with `Manager`.


-- 4. Present a report on payments made more than 10,000.00. For each of this record deduct 100.oo and display under new heading called amount. 
SELECT customerNumber, checkNumber paymentDate, amount - 100 AS amount
FROM payments
WHERE amount > 10000;

-- 5. List payments made from 2003 and above where the amount is either greater than 10,000 or less than 5,000.
SELECT *
FROM payments
WHERE paymentDate >= '2003-01-01' 
AND (amount > 10000 OR amount < 50000);

-- Another way to write the query number 5 to achieve the same result is:

SELECT *
FROM payments
WHERE paymentDate > '2002-12-31' 
AND (amount > 10000 OR amount < 50000);










