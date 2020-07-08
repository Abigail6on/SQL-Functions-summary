-- WHERE statement 
SELECT * FROM Customers
WHERE Country='Mexico';

-- AND, OR, NOT 
SELECT * FROM Customers
WHERE Country='Germany' AND City='Berlin'; -- AND

SELECT * FROM Customers
WHERE City='Berlin' OR City='München'; -- OR

SELECT * FROM Customers
WHERE NOT Country='Germany'; -- NOT 

SELECT * FROM Customers
WHERE Country='Germany' AND (City='Berlin' OR City='München');

SELECT * FROM Customers
WHERE NOT Country='Germany' AND NOT Country='USA';

-- ORDER BY
SELECT * FROM Customers
ORDER BY Country DESC; -- DESC descending; ASC ascending

SELECT * FROM Customers
ORDER BY Country ASC, CustomerName DESC; -- ORDER BY multiple columns 

-- INSERT INTO
-- Insert Data Only in Specified Columns
INSERT INTO Customers (CustomerName, City, Country)
VALUES ('Cardinal', 'Stavanger', 'Norway');

--IS NULL
SELECT CustomerName, ContactName, Address
FROM Customers
WHERE Address IS NULL;
-- IS NOT NULL
SELECT CustomerName, ContactName, Address
FROM Customers
WHERE Address IS NOT NULL;

-- UPDATE
UPDATE Customers
SET ContactName = 'Alfred Schmidt', City= 'Frankfurt'
WHERE CustomerID = 1;

-- DELETE
DELETE FROM Customers WHERE CustomerName='Alfreds Futterkiste';

--TOP
-- selects the first three records from the "Customers" table
SELECT TOP 3 * FROM Customers;

-- MIN
SELECT MIN(Price) AS SmallestPrice
FROM Products;
--MAX
SELECT MAX(Price) AS LargestPrice
FROM Products;

-- COUNT
SELECT COUNT(ProductID)
FROM Products;
-- AVG
SELECT AVG(Price)
FROM Products;
-- SUM
SELECT SUM(Quantity)
FROM OrderDetails;

-- LIKE
-- selects all customers with a CustomerName starting with "a":
SELECT * FROM Customers
WHERE CustomerName LIKE 'a%';
-- selects all customers with a CustomerName ending with "a":
SELECT * FROM Customers
WHERE CustomerName LIKE '%a';
-- selects all customers with a CustomerName that have "or" in any position:
SELECT * FROM Customers
WHERE CustomerName LIKE '%or%';
-- selects all customers with a CustomerName that have "r" in the second position:
SELECT * FROM Customers
WHERE CustomerName LIKE '_r%';
-- selects all customers with a CustomerName that starts with "a" 
-- and are at least 3 characters in length:
SELECT * FROM Customers
WHERE CustomerName LIKE 'a__%';
-- selects all customers with a ContactName that starts with "a" and ends with "o":
SELECT * FROM Customers
WHERE ContactName LIKE 'a%o';
-- NOT LIKE
-- selects all customers with a CustomerName that does NOT start with "a":
SELECT * FROM Customers
WHERE CustomerName NOT LIKE 'a%';

-- Wildcard
-- selects all customers with a City starting with "ber":
SELECT * FROM Customers
WHERE City LIKE 'ber%';
-- selects all customers with a City containing the pattern "es": 
SELECT * FROM Customers
WHERE City LIKE '%es%';
-- selects all customers with a City starting with any character, followed by "ondon":
SELECT * FROM Customers
WHERE City LIKE '_ondon';
-- selects all customers with a City starting with "L",
-- followed by any character, followed by "n", followed by any character, followed by "on":
SELECT * FROM Customers
WHERE City LIKE 'L_n_on';
-- selects all customers with a City starting with "b", "s", or "p":
SELECT * FROM Customers
WHERE City LIKE '[bsp]%';
-- selects all customers with a City starting with "a", "b", or "c":
SELECT * FROM Customers
WHERE City LIKE '[a-c]%';
-- select all customers with a City NOT starting with "b", "s", or "p":
SELECT * FROM Customers
WHERE City LIKE '[!bsp]%';

-- IN 
-- selects all customers that are located in "Germany", "France" or "UK":
SELECT * FROM Customers
WHERE Country IN ('Germany', 'France', 'UK');
-- selects all customers that are NOT located in "Germany", "France" or "UK":
SELECT * FROM Customers
WHERE Country NOT IN ('Germany', 'France', 'UK');
-- selects all customers that are from the same countries as the suppliers:
SELECT * FROM Customers
WHERE Country IN (SELECT Country FROM Suppliers);

--BETWEEN 
-- selects all products with a price BETWEEN 10 and 20:
SELECT * FROM Products
WHERE Price BETWEEN 10 AND 20;
-- selects all products with a price BETWEEN 10 and 20. In addition; 
-- do not show products with a CategoryID of 1,2, or 3:
SELECT * FROM Products
WHERE Price BETWEEN 10 AND 20
AND CategoryID NOT IN (1,2,3);
-- selects all products with a ProductName BETWEEN Carnarvon Tigers and Mozzarella di Giovanni:
SELECT * FROM Products
WHERE ProductName BETWEEN 'Carnarvon Tigers' AND 'Mozzarella di Giovanni'
ORDER BY ProductName;
-- selects all orders with an OrderDate BETWEEN '01-July-1996' and '31-July-1996':
SELECT * FROM Orders
WHERE OrderDate BETWEEN '1996-07-01' AND '1996-07-31';

-- NOT BETWEEN 
-- To display the products outside the range of the previous example, use NOT BETWEEN:
SELECT * FROM Products
WHERE Price NOT BETWEEN 10 AND 20;

-- Alias
-- The following SQL statement creates two aliases, 
-- one for the CustomerName column and one for the ContactName column. 
SELECT 
CustomerName AS Customer, 
ContactName AS [Contact Person]
FROM Customers;
-- The following SQL statement creates an alias named "Address" that combine four columns
SELECT 
CustomerName, 
Address + ', ' + PostalCode + ' ' + City + ', ' + Country AS Address
FROM Customers;
-- selects all the orders from the customer with CustomerID=4 
SELECT o.OrderID, o.OrderDate, c.CustomerName
FROM Customers AS c, Orders AS o
WHERE c.CustomerName='Around the Horn' AND c.CustomerID=o.CustomerID;

--JOIN
-- INNER JOIN 
-- SQL statement (that contains an INNER JOIN), that selects records that have matching values in both tables:
SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate
FROM Orders
INNER JOIN Customers ON Orders.CustomerID=Customers.CustomerID;
-- SQL FULL OUTER JOIN
SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
FULL OUTER JOIN Orders ON Customers.CustomerID=Orders.CustomerID
ORDER BY Customers.CustomerName;
-- The following SQL statement returns the cities (only distinct values) from both the "Customers" and the "Suppliers" table:
SELECT City FROM Customers
UNION
SELECT City FROM Suppliers
ORDER BY City;
-- The following SQL statement returns the cities (duplicate values also) from both the "Customers" and the "Suppliers" table:
SELECT City FROM Customers
UNION ALL
SELECT City FROM Suppliers
ORDER BY City; -- including duplicates

-- GROUP BY 
-- The following SQL statement lists the number of customers in each country:
SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country;
-- The following SQL statement lists the number of customers in each country, sorted high to low:
SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
ORDER BY COUNT(CustomerID) DESC;
-- The following SQL statement lists the number of orders sent by each shipper:
SELECT Shippers.ShipperName, COUNT(Orders.OrderID) AS NumberOfOrders FROM Orders
LEFT JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID
GROUP BY ShipperName;

-- HAVING 
-- The HAVING clause was added to SQL because the WHERE keyword could not be used with aggregate functions.
-- The following SQL statement lists the number of customers in each country. Only include countries with more than 5 customers:
SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
HAVING COUNT(CustomerID) > 5;
-- The following SQL statement lists the number of customers in each country, 
-- sorted high to low (Only include countries with more than 5 customers):
SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
HAVING COUNT(CustomerID) > 5
ORDER BY COUNT(CustomerID) DESC;

-- EXISIST
-- The following SQL statement returns TRUE and lists the suppliers with a product price less than 20:
SELECT SupplierName
FROM Suppliers
WHERE EXISTS 
(SELECT ProductName FROM Products 
WHERE Products.SupplierID = Suppliers.supplierID AND Price < 20);

-- CASE
-- The following SQL goes through conditions and returns a value when the first condition is met:
SELECT OrderID, Quantity,
CASE
    WHEN Quantity > 30 THEN 'The quantity is greater than 30'
    WHEN Quantity = 30 THEN 'The quantity is 30'
    ELSE 'The quantity is under 30'
END AS QuantityText
FROM OrderDetails;
-- The following SQL will order the customers by City. However, if City is NULL, then order by Country:
SELECT CustomerName, City, Country
FROM Customers
ORDER BY
(CASE
    WHEN City IS NULL THEN Country
    ELSE City
END);

-- ISNULL()
-- The SQL Server ISNULL() function lets you return an alternative value when an expression is NULL:
SELECT ProductName, UnitPrice * (UnitsInStock + ISNULL(UnitsOnOrder, 0))
FROM Products;

-- Stored Procedure
-- The following SQL statement creates a stored procedure named "SelectAllCustomers" 
-- that selects all records from the "Customers" table:
CREATE PROCEDURE SelectAllCustomers
AS
SELECT * FROM Customers
GO;
-- Execute the stored procedure above as follows:
EXEC SelectAllCustomers;
-- selects Customers from a particular City from the "Customers" table:
CREATE PROCEDURE SelectAllCustomers @City nvarchar(30)
AS
SELECT * FROM Customers WHERE City = @City
GO;
-- Execute the stored procedure above as follows:
EXEC SelectAllCustomers @City = 'London';