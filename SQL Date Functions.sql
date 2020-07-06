-- Date Function 

-- Return the current date and time:
SELECT CURRENT_TIMESTAMP;

-- Add one year to a date, then return the date:
SELECT DATEADD(year, 1, '2017/08/25') AS DateAdd;

-- Return the difference between two date values, in years:
SELECT DATEDIFF(year, '2017/08/25', '2011/08/25') AS DateDiff;

-- Return a date from it's parts:
SELECT DATEFROMPARTS(2018, 10, 31) AS DateFromParts; -- 2018-10-31

-- Return a specified part of a date:
SELECT DATENAME(year, '2017/08/25') AS DatePartString; -- 2017
SELECT DATEPART(year, '2017/08/25') AS DatePartInt; -- 2017

-- Return the day of the month for a date:
SELECT DAY('2017/08/25') AS DayOfMonth; -- 25

-- Return the month part of a date:
SELECT MONTH('2017/08/25') AS Month;

-- Return the year part of a date:
SELECT YEAR('2017/08/25') AS Year;

-- Return the date and time of the SQL Server:
SELECT SYSDATETIME() AS SysDateTime;