select *from products;
-- limit 10;
select productCode, productName, quantityInStock
from products
where productName like '%ford%';

-- REGEXP ([], ^, |, -)
-- Evaluation of regexp
-- a[hndv] = (ah), (an), (ad), and (av)

select productCode, productName, quantityInStock
from products
where productName regexp 'F[eo]'; -- Fe, Fo, Fa, or fe, fo, fa

select productCode, productName, quantityInStock
from products
where productName regexp '19[6]';

-- Products whose stock values are less than 5000
select productCode, productName, quantityInStock
from products
where quantityInStock between 4724 and 9997;

select productCode, productName, quantityInStock
from products
-- where quantityInStock between 4724 and 9997
where quantityInStock >= 4724 and quantityInStock <= 9997
limit 6;

select productCode, productName, quantityInStock
from products
where quantityInStock between 4724 and 9997
limit 6;

select productCode, productName, productLine, quantityInStock
from products
where productLine in ('Classic Cars', 'Ships');
-- limit 25;

select *from customers limit 10;