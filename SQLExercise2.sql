-- find all products
SELECT * FROM products;
-- find all products that cost $1400
SELECT * from products 
WHERE Price = 1400;
-- find all products that cost $11.99 or $13.99
SELECT * FROM products
where Price = 11.99 OR price = 13.99;
-- find all products that do NOT cost 11.99 - using NOT
SELECT * FROM products
WHERE NOT Price = 11.99;
-- find all products and sort them by price from greatest to least
Select * From products
order by Price desc;
-- find all employees who don't have a middle initial
SELECT * from employees
Where MiddleInitial IS null;
-- find distinct product prices
SELECT DISTINCT Price FROM products;
-- find all employees whose first name starts with the letter ‘j’
SELECT * FROM employees
WHERE FirstName LIKE 'j%';
-- find all Macbooks
SELECT * FROM products
Where Name LIKE '%Macbook%';
-- find all products that are on sale
SELECT * From products
Where OnSale = 1;
-- find the average price of all products
SELECT AVG(Price) FROM products;
-- find all Geek Squad employees who don't have a middle initial
SELECT * from employees
Where MiddleInitial IS null AND Title LIKE '%Geek Squad%';
-- find all products from the products table whose stock level is in the range -- of 500 to 1200. Order by Price from least to greatest. Hint: Use the between keyword
SELECT * FROM products
Where StockLevel between 500 AND 1200
order by Price asc;

-- PRACTICE FOR ME

SELECT * FROM products
LEFT JOIN Sales ON products.ProductID = sales.ProductID;

SELECT * FROM products
Left Join Sales ON products.ProductID = sales .ProductID
where sales.ProductID IS Null;



 

