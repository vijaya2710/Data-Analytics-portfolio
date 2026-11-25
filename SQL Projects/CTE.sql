WITH AvgSalaryByDept AS (
    SELECT department_id, AVG(Salary) AS AvgSalary
    FROM Employees
    GROUP BY department_id
)
SELECT *
FROM AvgSalaryByDept;




--Recursive cte
WITH
  cteReports (EmpID, FirstName, LastName, MgrID, EmpLevel)
  AS
  (
    SELECT employee_id, First_Name, Last_Name, Manager_ID, 1
    FROM Employees
    WHERE Manager_ID IS NULL
    UNION ALL
    SELECT e.employee_id, e.First_Name, e.Last_Name, e.Manager_ID, 
      r.EmpLevel + 1
    FROM Employees e
      INNER JOIN cteReports r
        ON e.manager_id = r.EmpID
  )

SELECT
  FirstName + ' ' + LastName AS FullName, 
  EmpLevel,
  (SELECT FirstName + ' ' + LastName FROM Employees 
    WHERE Employee_ID = cteReports.MgrID) AS Manager
FROM cteReports 
ORDER BY EmpLevel, MgrID

=====

use test
select * from products


with products_cte as(
select * from products
)
select * from products_cte where quantity in (select  quantity from products_cte where quantity =20)