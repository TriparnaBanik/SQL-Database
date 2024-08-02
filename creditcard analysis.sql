create database creditcard_db;

use creditcard_db;

select *
from customers;

/* 1.create a new column new_salary(INT DATA TYPE)
2.Replace comma in annual salary with NULL string
3.Cast() to convert the number stored as Text into Number */

alter table customers
add column new_salary integer;

set sql_safe_updates= 0;

update customers
set new_salary= CAST(Replace(AnnualSalary,",","") as unsigned);

/* List the number of customers from each region and city.*/ (Multiple grouping)
select r.region, cr.city, count(*) as total
from customers c inner join region r on c.region= r.region
group by r.region, c.city;


-- 1.  Find the position of first "a" in name of each customer.
select name, locate("a", name, 1)
from customers;

-- 2.    Display the customers' entire name but the last character.
select name, mid(name, length(name)-1)
from customers;
Eg: Prateek -> Pratee
-- 3.    Display the last two characters of the customers’ name
select name, right (name,2)
from customers;
-- 4.    Select names containing a single “e”.  
