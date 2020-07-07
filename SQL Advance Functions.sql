-- SQL Advance Functions

-- Convert a value to an int datatype:
SELECT CAST(25.65 AS int); -- 25
-- Convert a value to a datetime datatype:
SELECT CAST('2017-08-25' AS datetime); -- 2017-08-25 00:00:00.000 (ISO format)

-- Convert an expression to int:
SELECT CONVERT(int, 25.65); -- 25

-- Return the first non-null value in a list:
SELECT COALESCE(NULL, NULL, NULL, 'W3Schools.com', NULL, 'Example.com'); -- W3Schools.com

-- Return "YES" if the condition is TRUE, or "NO" if the condition is FALSE:
SELECT IIF(500<1000, 'YES', 'NO'); -- YES
-- Return 5 if the condition is TRUE, or 10 if the condition is FALSE:
SELECT IIF(500<1000, 5, 10); -- 5

-- Return "MORE" if the condition is TRUE, or "LESS" if the condition is FALSE:
SELECT OrderID, Quantity, IIF(Quantity>10, 'MORE', 'LESS')
FROM OrderDetails;

-- Return the specified value IF the expression is NULL, otherwise return the expression:
SELECT ISNULL(NULL, 'W3Schools.com'); -- W3Schools.com
SELECT ISNULL('Hello', 'W3Schools.com'); -- Hello

-- Tests whether the expression is numeric:
SELECT ISNUMERIC(4567);

-- Compare two expressions:
SELECT NULLIF(25, 25); -- return nothng means the two expressions are equal
SELECT NULLIF('Hello', 'world'); -- Hello
