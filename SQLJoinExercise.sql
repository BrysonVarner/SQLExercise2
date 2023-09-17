
/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
SELECT * FROM products
inner join categories on products.CategoryID = categories.CategoryID
WHERE categories.Name LIKE '%computers%';

-- with Aliases and instruction
select P.Name as product, C.Name as Category
From products AS P
inner Join categories as C on C.CategoryID = P.CategoryID
where C.Name = 'Computers';

 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT P.Name as Product, P.Price as Price, R.Rating as Rating From products as P
inner join reviews as R on P.ProductID = R.ProductID
Where R.Rating = 5;

-- to compare join types for myself

SELECT P.Name as Product, P.Price as Price, R.Rating as Rating From products as P
Left join reviews as R on P.ProductID = R.ProductID
Where R.Rating = 5;

/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT * FROM sales
inner Join employees on sales.EmployeeID = employees.EmployeeID;  

-- need help attempts returned errors -- Result of help

SELECT E.FirstName, E.LastName, Sum(S.Quantity) as Total From sales as S
inner Join employees as E on S.EmployeeID = E.EmployeeID
group by E.EmployeeID 
Order By Total desc
Limit 5;

-- 2nd try attampted more accurate sales total query after walkthrough
SELECT E.FirstName, E.LastName, Sum(S.Quantity) as TotalItems, sum(S.PricePerUnit) as Cost, Sum(S.Quantity) * sum(S.PricePerUnit) as Total From sales as S
inner Join employees as E on S.EmployeeID = E.EmployeeID
group by E.EmployeeID 
Order By Total desc
Limit 5;


/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT D.Name as Department, C.Name as Category FROM categories as C
Inner JOIN departments as D on C.DepartmentID = D.DepartmentID
where C.Name = 'Appliances' OR C.Name = 'Games';


/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT P.Name, sum(S.Quantity) as 'Total Items Sold', Sum(S.Quantity * S.PricePerUnit) as 'Total Price Sold' FROM products as P
Inner Join sales as S on P.ProductID = S.ProductID 
where P.ProductID = 97;

-- To locate item id P.Name like did not work in query
select * From products where products.Name Like '%Eagles%';


/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT P.Name as Product, R.Reviewer, R.Rating, R.Comment FROM products as P
inner Join reviews as R on P.ProductID = R.ProductID
Where R.ProductID = 857
order by R.Rating
Limit 1;

-- for me to locate product ID
select * From products where products.Name Like '%TV%';

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */

-- First solo attempt
SELECT e.EmployeeID, e.FirstName, e.LastName, p.Name as 'Item Sold', s.Quantity From employees as e
inner Join sales as s on e.EmployeeID = s.EmployeeID
inner Join products as p on s.ProductID = p.ProductID
order by e.EmployeeID;


-- Other attempt if needed after walkthrough
SELECT e.EmployeeID, e.FirstName, e.LastName, p.Name, sum(s.Quantity) as 'Total Sold' From sales as s
inner Join employees as e on s.EmployeeID = e.EmployeeID
inner Join products as p on s.ProductID = p.ProductID
group by e.EmployeeID, p.ProductID
order by 'Total Sold' desc;