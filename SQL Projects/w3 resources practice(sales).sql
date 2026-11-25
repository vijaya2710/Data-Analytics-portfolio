create database sales
use sales
create table salesman(
salesman_id int,
name varchar(50),
city varchar(50),
commission decimal (10,2)
);
insert into salesman(salesman_id,name,city,commission)
values(5001,'jameshoog','newyork',0.15),(5002,'Nail knite','paris',0.13),
(5005,'Pit Alex','London',0.11),
(5006,'Mc lyon','paris',0.14),(5007,'Paul Adam','rome',0.19),
(5003,'Lauson Hen','San Jose',0.12)
create table customer(
customer_id int,
cust_name varchar(50),
city varchar(50),
grade int,
salesman_id int
);
insert into customer(customer_id,cust_name,city,grade,salesman_id)
values(3002,'Nick Ramando','newyork',100,5001),
(3007,'Brad davis','newyork',200,5002),
(3005,'Graham Zusi','california',200,5002),
(3008,'Julian Green','London',300,5002),
(3004,'fabian Johnson','paris',300,5006),
(3009,'Geoff cameron','berlin',100,5003),
(3003,'Jozy Altidor','Moscow',200,5007),
(3001,'Brad gazan','london',0,5005)
--From the following tables write a SQL query to find the salesperson and customer who reside in the same city. Return Salesman, cust_name and city.
select
s.name,
c.cust_name,
s.city
from salesman as s
full join customer as c
on s.salesman_id=c.salesman_id
where s.city=c.city
select *from salesman
select * from customer
create table orders(
ord_no int,
purch_amt decimal(10,2),
ord_date date,
customer_id int,
salesman_id int
)
insert into orders(ord_no,purch_amt,ord_date,customer_id,salesman_id)
values(70001,150.5,'2012-10-05',3005,5002),(70009,270.65,'2012-09-10',3001,5005),
(70002,65.26,'2012-10-05',3002,5001),(70004,110.5,'2012-08-17',3009,5003),
(70007,948.5,'2012-09-10',3005,5002),(70005,2400.6,'2012-07-27',3007,5001),
(70010,1983.43,'2012-10-12',3004,5006)
insert into orders(ord_no,purch_amt,ord_date,customer_id,salesman_id)
values(70008,5760,'2012-09-10',3002,5001)
select * from orders
select * from customer
select * from salesman
--From the following tables write a SQL query to find those orders where the order amount exists between 500 and 2000. Return ord_no, purch_amt, cust_name, city.
select
o.ord_no,
o.purch_amt,
c.cust_name,
c.city
from orders as o
full join customer as c
on o.customer_id=c.customer_id
where o.purch_amt between 500 and 2000
--From the following tables write a SQL query to find the salesperson(s) and the customer(s) he represents. Return Customer Name, city, Salesman, commission.
select
c.cust_name,
c.city,
s.name,
s.commission
from customer as c 
full join salesman as s
on c.salesman_id=s.salesman_id
--From the following tables write a SQL query to find salespeople who received commissions of more than 12 percent from the company. Return Customer Name, customer city, Salesman, commission. 
select
s.name as "salesman",
s.city,
s.commission,
c.cust_name as "customer name"
from salesman as s
inner join customer as c
on c.city=s.city
where s.commission > 0.12
select * from orders
select * from customer
select * from salesman
--From the following tables write a SQL query to find the details of an order. Return ord_no, ord_date, purch_amt, Customer Name, grade, Salesman, commission. Go to the editor
select
o.ord_no,
o.ord_date,
o.purch_amt,
c.cust_name as "customer name",
c.grade,
s.name as "salesman",
s.commission
from orders as o
inner join customer as c
on o.salesman_id = c.salesman_id
inner join salesman as s
on c.salesman_id = s.salesman_id
--Write a SQL statement to join the tables salesman, customer and orders so that the same column of each table appears once and only the relational rows are returned. 
select * from customer
select * from orders
select * from salesman
select
c.cust_name as "customer name",
s.name as "salesman",
o.purch_amt as "amount"
from customer as c
inner join salesman as s
on c.salesman_id = s.salesman_id
inner join orders as o
on s.salesman_id = o.salesman_id
--From the following tables write a SQL query to display the customer name, customer city, grade, salesman, salesman city. The results should be sorted by ascending customer_id.  
select
c.cust_name as "customer name",
c.city as "customer city",
c.grade,
s.name as "salesman",
s.city as "salesman city"
from customer as c
left join salesman as s
on c.salesman_id= s.salesman_id
order by c.customer_id asc
--Write a SQL statement to make a report with customer name, city, order number, order date, and order amount in ascending order according to the order date to determine whether any of the existing customers have placed an order or not.
select
c.cust_name as "customer mane",
c.city,
o.ord_date,
o.ord_no,
o.purch_amt
from customer as c
left join orders as o
on c.customer_id = o.customer_id
order by o.ord_date asc
--Write a SQL statement to generate a list in ascending order of salespersons who work either for one or more customers or have not yet joined any of the customers.
select
s.name as "salesperson",
c.cust_name as "customers"
from salesman as s
left join customer as c
on s.city = c.city
order by c.cust_name asc
select * from customer
select * from salesman
--From the following tables write a SQL query to list all salespersons along with customer name, city, grade, order number, date, and amount. Condition for selecting list of salesmen : 1. Salesmen who works for one or more customer or, 2. Salesmen who not yet join under any customer, Condition for selecting list of customer : 3. placed one or more orders, or 4. no order placed to their salesman
select
s.name as "salesman",
c.cust_name as "customer name",
c.city,
c.grade,
o.ord_no,
o.ord_date,
o.purch_amt
from customer as c
right join orders as o
on o.customer_id = c.customer_id
right join salesman as s
on s.salesman_id = c.salesman_id
--Write a SQL statement to make a list for the salesmen who either work for one or more customers or yet to join any of the customer. The customer may have placed, either one or more orders on or above order amount 2000 and must have a grade, or he may not have placed any order to the associated supplier.
select
c.cust_name,
c.city,
c.grade,
s.name as "salesman",
o.ord_no,
o.ord_date,
o.purch_amt
from customer as c
right join salesman as s
on s.salesman_id = c.customer_id
left join orders as o
on o.customer_id = o.customer_id
where o.purch_amt <=2000
and c.grade is not null 
--For those customers from the existing list who put one or more orders, or which orders have been placed by the customer who is not on the list, create a report containing the customer name, city, order number, order date, and purchase amount
select
c.cust_name as"customer name",
c.city,
o.ord_no,
o.ord_date,
o.purch_amt
from customer as c
left join orders as o
on c.customer_id=o.customer_id
--Write a SQL statement to generate a report with the customer name, city, order no. order date, purchase amount for only those customers on the list who must have a grade and placed one or more orders or which order(s) have been placed by the customer who neither is on the list nor has a grade.
select
c.cust_name as"customer name",
c.city,
c.grade,
o.ord_no,
o.ord_date,
o.purch_amt
from customer as c
full join orders as o
on c.customer_id=o.customer_id
where c.grade is not null
--Write a SQL query to combine each row of the salesman table with each row of the customer table.
select * from salesman
cross join customer
=====================or==================
select
s.salesman_id,
s.name,
s.city,
s.commission,
c.customer_id,
c.cust_name,
c.city,
c.grade,
c.salesman_id
from salesman as s
cross join customer as c
--From the following tables, write a SQL query to find all the orders issued by the salesman 'Paul Adam'. Return ord_no, purch_amt, ord_date, customer_id and salesman_id.
select
o.ord_no,
o.ord_date,
o.purch_amt,
o.customer_id,
s.salesman_id 
from orders as o
full join salesman as s
on o.salesman_id = s.salesman_id
where name = 'paul Adam'
select * from orders
select * from salesman