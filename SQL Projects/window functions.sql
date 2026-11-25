select * from employees
select * from jobs
select * from departments
select
e.employee_id,
e.first_name,
e.last_name,
d.department_id,
d.department_name,
e.job_id,
j.job_title,
e.salary
from employees e
join departments d
on e.department_id=d.department_id
join jobs j
on e.job_id =j.job_id
====================================================
--rownumber
select
e.employee_id,
e.department_id,
e.salary,
row_number() over (partition by e.department_id order by e.salary desc) as 
rownum
from employees e;
select * from employees
=======================================================
--Rank
select
e.employee_id,
e.department_id,
e.salary,
rank() over (partition by e.department_id order by e.salary desc) as 
ranknum
from employees e;
=======================================================
--DenseRank
select
e.employee_id,
e.department_id,
e.salary,
dense_rank() over (partition by e.department_id order by e.salary desc) as 
denseranknum
from employees e;
========================================================
--department total salary
select
e.employee_id,
e.department_id,
e.salary,
sum(e.salary) over (partition by e.department_id) as depttotalsalary
from employees e;
========================================================
--department averege salary
select
e.employee_id,
e.department_id,
e.salary,
sum(e.salary) over (partition by e.department_id) as deptavgsalary
from employees e;
=========================================================
--lag
select
e.employee_id,
e.department_id,
e.salary,
lag(e.salary) over (partition by e.department_id order by e.salary) as prevsalary
from employees as e;
==========================================================
--lead
select
e.employee_id,
e.department_id,
e.salary,
lead(e.salary) over (partition by e.department_id order by e.salary) as nextsalary
from employees as e;
==========================================================
--first value
select
e.employee_id,
e.department_id,
e.salary,
first_value(e.salary) over (partition by e.department_id order by e.salary) as firstvalue
from employees as e
--syntax
--select*
--from tablename
--first_value(scalar_value)
--over(
--[PARTITION by partition_value]
--order by sort_value [Asc |desc]
--) As columnname
================================================================
--last value
select
e.employee_id,
e.department_id,
e.salary,
last_value(e.salary) over (
partition by e.department_id 
order by e.salary
rows between unbounded preceding and unbounded following)
as lastsalary
from employees as e;
--syntax
--select
   --coloum_name,
   --last_value(column_name)over(
     --partition by category_column
     --order by sort_column
     --rows betweeen unbounded preceding and unbounded following)
     ============================================================
--Ntile
select
e.employee_id,
e.department_id,
e.salary,
NTILE(4) over (partition by e.department_id order by e.salary) as quartilebucket 
from employees as e;

