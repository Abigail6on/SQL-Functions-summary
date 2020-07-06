-- Numeric Functions

-- Return the absolute value of a number:
SELECT Abs(-243.5) AS AbsNum;

-- Return the cosine of a number:
SELECT COS(2);

-- Return the tangent of a number:
SELECT TAN(1.75);

-- Return the arc cosine of a number:
SELECT ACOS(0.25);

-- Return the sine of a number:
SELECT SIN(2);

-- Return the cotangent of a number:
SELECT COT(6);

-- Return the arc sine of a number:
SELECT ASIN(0.25);

-- Return the arc tangent of a number:
SELECT ATAN(2.5);

-- Return the arc tangent of two values:
SELECT ATN2(0.50, 1);

-- Convert a radian value into degrees:
-- 将弧度值转换为度：
SELECT DEGREES(1.5);

-- Return the average value for the "Price" column in the "Products" table:
SELECT AVG(Price) AS AveragePrice FROM Products;

-- Return the smallest integer value that is greater than or equal to a number:
SELECT CEILING(25.75) AS CeilValue; -- 26

-- Return the largest integer value that is equal to or less than 25.75:
SELECT FLOOR(25.75) AS FloorValue;

--Return the number of products in the "Products" table:
SELECT COUNT(ProductID) AS NumberOfProducts FROM Products;

-- Return e raised to the power of 1:
SELECT EXP(1);

-- Return the natural logarithm of 2:
SELECT LOG(2);
-- Return the natural logarithm of 2 to a specified base (4):
SELECT LOG(2, 4); -- 0.5

-- Return the base-10 logarithm of 2:
SELECT LOG10(2);

-- Find the price of the most expensive product in the "Products" table:
SELECT MAX(Price) AS LargestPrice FROM Products;

-- Find the price of the cheapest product in the "Products" table:
SELECT MIN(Price) AS SmallestPrice FROM Products;

-- Return 4 raised to the second power:
SELECT POWER(4, 2); -- 16

-- Return the square of a number:
SELECT SQUARE(64);

-- Return the square root of a number:
SELECT SQRT(64);

-- Convert a degree value into radians:
-- 将度值转换为弧度：
SELECT RADIANS(180);

-- Return a random decimal number 
-- (no seed value - so it returns a completely random number >= 0 and <1):
SELECT RAND();

-- Round the number to 2 decimal places:
SELECT ROUND(235.415, 2) AS RoundValue;

-- Return the sign of a number:
SELECT SIGN(255.5); -- 1.0

-- Return the sum of the "Quantity" field in the "OrderDetails" table:
SELECT SUM(Quantity) AS TotalItemsOrdered FROM OrderDetails;

-- 