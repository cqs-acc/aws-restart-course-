USE AnyCompanyGlobal;
-- Performing JOIN

select o.orderNumber, o.orderDate, o.customerNumber,  c.customerNumber, c.customerName 
from orders o
right join customers c 
on c.customerNumber = o.customerNumber;  -- `customers` and `orders` table names are aliased as `c` and `o` respectively

-- Note:
-- MySQL do not support full join. And to do a full join, use `UNION` operator to combine left and right joins. 

/*
union
select o.orderNumber, o.orderDate, o.customerNumber,  c.customerNumber, c.customerName 
from orders o
left  join customers c 
on c.customerNumber = o.customerNumber;
*/ 

-- from clause gives you the left table
-- join clause gives you the right table 
-- left, right, full, and inner 