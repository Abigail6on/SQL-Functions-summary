-- String Functions

-- Search for "t" in string "Customer", and return position:
SELECT CHARINDEX('t', 'Customer') AS MatchPosition;

-- Add two strings together:
SELECT CONCAT('W3Schools', '.com');

-- Add 3 strings together:
SELECT 'SQL' + ' is' + ' fun!';

/* The DIFFERENCE() function compares two SOUNDEX values, and returns an integer. 
-- The integer value indicates the match for the two SOUNDEX values, from 0 to 4.
-- 0 indicates weak or no similarity between the SOUNDEX values. 
-- 4 indicates strong similarity or identically SOUNDEX values. 
*/
SELECT DIFFERENCE('Juice', 'Jucy');

-- Format a date:
DECLARE @d DATETIME = '12/01/2018';  
SELECT FORMAT (@d, 'd', 'en-US') AS 'US English Result',  
       FORMAT (@d, 'd', 'no') AS 'Norwegian Result',  
       FORMAT (@d, 'd', 'zu') AS 'Zulu Result';

-- Extract 3 characters from a string (starting from left):
SELECT LEFT('SQL Tutorial', 3) AS ExtractString;

-- Extract 3 characters from a string (starting from right):
SELECT RIGHT('SQL Tutorial', 3) AS ExtractString;

-- Return the length of a string:
SELECT LEN('W3Schools.com');

-- Convert the text to lower-case:
SELECT LOWER('SQL Tutorial is FUN!');

-- Convert the text in "CustomerName" to upper-case:
SELECT UPPER(CustomerName) AS UppercaseCustomerName FROM Customers;

-- Remove characters and spaces from a string:
SELECT TRIM('#! ' FROM '    #SQL Tutorial!    ') AS TrimmedString;

-- Remove leading spaces from a string:
SELECT LTRIM('     SQL Tutorial') AS LeftTrimmedString;

-- Remove trailing spaces from a string:
SELECT RTRIM('SQL Tutorial     ') AS RightTrimmedString;

-- Return the position of a pattern in a string:
SELECT PATINDEX('%schools%', 'W3Schools.com');

-- Replace "T" with "M":
SELECT REPLACE('SQL Tutorial', 'T', 'M');

-- Repeat a string:
SELECT REPLICATE('SQL Tutorial', 5);

-- Reverse a string:
SELECT REVERSE('SQL Tutorial');

-- Return a number as a string:
SELECT STR(185);

-- Delete 3 characters from a string, starting in position 1, and then insert "HTML" in position 1:
SELECT STUFF('SQL Tutorial', 1, 3, 'HTML');

-- Extract 3 characters from a string, starting in position 1:
SELECT SUBSTRING('SQL Tutorial', 1, 3) AS ExtractString;

SELECT SUBSTRING(CustomerName, 1, 5) AS ExtractString FROM Customers;

-- Return the string from the first argument AFTER the characters specified 
-- in the second argument are translated into the characters specified in the third argument:
SELECT TRANSLATE('3*[2+1]/{8-4}', '[]{}', '()()'); --  Results in 3*(2+1)/(8-4)