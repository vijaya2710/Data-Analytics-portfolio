--write a query to display all columns and all records from the product table.
select * from products
========================================================================
--display the only products and price columns
select productname,price 
from products
========================================================================
--display all products whose price is greater than 2000
select price,productname from products
where price>2000
========================================================================
--display products whose category is 'electronics'
select * from products 
where category ='electronics'
===========================================================
--display products supplied from hyderabad or chennai
select * from products
where supplycity='hyderabad' or supplycity='chennai'
==========================================================
--display productname as product and price as product_price using alliases
select productname as product,price as product_price
from products
=============================================================
--display products whose pricee is between 1000 and 5000
select productname from products 
where price between 1000 and 5000
=============================================================
--dispaly products whose category is electronics or furniture using in
select * from products 
where category in('elctronics','furniture')
============================================================
--dispaly the highest price and lowest price from the products table
select min(price)as highestprice from products
select max(price)as lowestprice from products
===========================================================
--display all products whose price is greater than 3000 and quantity is greater than 5
select * from products
where price > 3000 and quantity >5
===========================================================
--dispaly all products whose price is lessthan 1000 and quantity is greaterthan 50
select *from products
where price < 1000 and quantity >50
============================================================
--display the top 3most expensive products
select Top 3* from products
order by price desc
==============================================================
--display all products in ascending order of price
select *from products 
order by price asc
=============================================================
--dispaly all products in decending order of price
select * from products
order by  price desc
==============================================
--display products in electronics category,order by price from highest to lowest
select productname,category,price from products
where category='electronics'
order by price desc
==============================================
--find the total number of products in the table
select count(product_id) from products
=================================================
--find the average price of all products 
select avg(price) as averageprice from products
===================================================
--find the total quantity of all products
select sum(quantity) from products
=======================================================
--find the total value of inventory using price*quantity
select sum(price*quantity) as totalinventory
from products 
==================================================
--find the number of products in each category
select count(category),category from products
group by category
==================================================
--find the average price of each category
select avg(price),category from products
group by category
====================================================
--find the total quantity available in each category
select sum(quantity),category  from products 
group by category
===================================================
--find the highest price in each category
select max(price),category from products 
group by category
===================================================
--find the lowest price in each category
select min(price),category from products 
group by category
=================================================
--display those categorys having more than 2 products
select count(product_id),category
from products 
group by category
having count(product_id) >2
select * from products
=================================================
--display category where the average price is greater than 2000.
select avg(price),category
from products
group by category
having avg(price) >2000
=======================================================================
--find the total inventory value for each catrgory
select sum(price*quantity)   as totalinventoty,category
from products
group by category

=====================================================================
--dispaly supplier cities having more than 1 product
select count(product_id),supplycity from products
group by supplycity
having count(product_id) >1
--------------------(or)-------------------------------------
select supplycity,count(*) as total_products from products
group by supplycity
having count(*) >1;
======================================================
--find the number of products supplied by each city
select count(product_id),supplycity from products
group by supplycity
=============================================================
--dispaly product category having atoatl quantity greater than 30
select sum(quantity) ,productname,category
from products
group by category,productname
having sum(quantity) >30
==============================================================
--display category where the highest product price is greater than 5000
select sum(price),category
from products
group by category
having sum(price) >5000
=============================================================
--find the number of products whose price is greater than 1000 in each category
select count(product_id),category
from products
where price >1000
group by category
===========================================================
--display supplycities whose average product price is less than 2000
select avg(price),supplycity
from products
group by supplycity
having avg(price) <2000
=============================================================
--find the total inventory value of each supplier city
select sum(price*quantity),supplycity from products
group by supplycity
============================================================
--dispaly category having at least 2 products,sorted by product count in desending order
select count(product_id),category
from products
group by category
having count(product_id) >=2
order by count(product_id) desc
===========================================================
--find the  category with the highest average price
select Top 1 avg(price),category from products
group by category
order by  avg(price) desc
==============================================================
--display products whose price is greater than the average price in the products table
select *from products 
where price >(select avg(price) from products)
==============================================================
--find the second-highest product price in the product table
select max(price) as second_highest_price from products
where price <(select max(price) from products)
=============================================================
--display products whose price is greater than the highest-priced product in the furniture category
select * from products 
where price >(select max(price) from products
where category = 'furniture')
=============================================================
--display products that have the same price as any other product
select * from products
where price in (select price from products
group by price
having count(*) >1)
================================================================
--find the third highest distinct product price
select max(price) from products
where price<(select max(price) from products)
==============================================================
--dispaly products whose names  start with letter 'p'
select productname from products
where productname like 'p%'
==============================================================
--display products whose name end with 'e'
select productname from products 
where productname like '%e'
=============================================================
--dispaly products whose names contain the letter 'o'
select productname from products 
where productname like '%o%'
=============================================================
--display products with aprice between 500 ,3000 excluding the boundary values.
select productname from products
where price >500 and price >3000
============================================================
--dispaly each product name and a new column called price status:
--price greater than 3000 -'expensive'
--otherwise-'afertable'
select *,
case
when price >3000 then 'expensive'
when price <3000 then 'afertable'
end as price_status
from products
==========================================================
--display products supplycity not 'hyderabad'
select * from products
where supplycity not like 'hyderabad'
=====================================================================
--display each category and its total number of prodcuts,but show only categories containing two products
select count(*),category
from products
group by category
having count(*)>=2
======================================================================
--display each product name and its price after a 10% discount
select productname,price,price*0.90 as discounted_price
from products
=======================================================================
--use case to calssify products: price greater than 5000 'High',price greater than 1000 'medium',otherwise 'low'
select * ,
case
when price >5000 then 'high'
when price >1000 then 'medium'
when price <1000 then 'low'
end as price_status
from products
=========================================================================
--dispaly product name in uppercase
select upper(productname) from products
==========================================================================
--display product name and the lenght of the each name
select len(productname) from products
======================================================================
--dispaly products with the lowest price
select productname,price from products
order by  price asc 
======================================================================
--find the total number of distinct supplier cities
select count(distinct supplycity) from products
=====================================================================
--display the three chepeast products
select top 3 productname,price 
from products
order by price asc
=====================================================================
---find products whose quantity is greater than the averege quantity of all products
select * from products
where quantity>(select avg(quantity) from products)
=====================================================================
--dispaly products whose category is not "electronics" and whose price is greater than 1000 (<> not equal)
select productname,category,price from products
where category <> 'electronics' and price >1000 
=======================================================================
--find the category with the greatest total quantity
select  top 1 sum(quantity) ,category from products
group by category
order by sum(quantity) desc
=======================================================================
create table suppliers(
supplier_id int,
suppliercity varchar(50),
contactperson varchar(50)
);
insert into suppliers(supplier_id,suppliercity,contactperson)
values(1,'hyderabad','ravi'),(2,'chennai','priya'),(3,'bangalore','kiran'),
(4,'vijayawada','sita'),(5,'delhi','rahul')
=============================================================================
--display all products along with their supplier contact person using inner join.
select * from products
select * from suppliers
select p.productname,
s.contactperson
from products as p
inner join suppliers as s
on p.supplycity=s.suppliercity
===============================================================================
--dispaly all products and their supplier details,including products without a matching supplier,using left join
select p.productname,
s.contactperson,
s.suppliercity
from products as p 
left join suppliers as s
on p.supplycity=s.suppliercity
select * from products
select * from suppliers
=================================================================================
--dispaly all suppliers and their products including suppliers who have no products,using right join
select p.productname,
s.contactperson,
s.suppliercity
from products as p 
right join suppliers as s
on p.supplycity=s.suppliercity
==================================================================================
--display all products and all  suppliers including unmatching records using full join
select p.productname,
p.category,
p.price,
p.quantity,
s.contactperson,
s.suppliercity
from products as p
full join suppliers as s
on p.supplycity=s.suppliercity
=================================================================================
--dispaly productnames and supplier contactperson only for products supplied from hyderabad
select p.productname,
s.contactperson,
s.suppliercity
from products as p
inner  join suppliers as s
on p.supplycity = s.suppliercity
where p.supplycity='hyderabad'
===============================================================================
--dispaly products whose supplier contact person is priya
select p.productname,
s.contactperson,
s.suppliercity
from products as p
inner join suppliers as s
on p.supplycity=s.suppliercity
where s.suppliercity='priya'
===============================================================================
--find the number of products supplied by each supplier,including suppliers with zero products
select count(p.productname),
s.contactperson,
s.suppliercity
from products as p
left join suppliers as s
on p.supplycity=s.suppliercity
==============================================================================
--display supplier cities that do not have any products
select * from products
select * from suppliers
select s.suppliercity
from suppliers as s
left join products as p
on s.suppliercity=p.supplycity
where p.product_id is null
