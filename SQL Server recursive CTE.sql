/*
https://www.sqlservertutorial.net/sql-server-basics/sql-server-recursive-cte/

A recursive common table expression (CTE) is a CTE that references itself. 
By doing so, the CTE repeatedly executes, returns subsets of data, 
until it returns the complete result set.

A recursive CTE is useful in querying hierarchical data 
such as organization charts where one employee reports to a manager 
or multi-level bill of materials when a product consists of many components, 
and each component itself also consists of many other components.

The following shows the syntax of a recursive CTE:

*/

WITH expression_name (column_list)
AS
(
    -- Anchor member
    initial_query  
    UNION ALL
    -- Recursive member that references expression_name.
    recursive_query  
)
-- references expression name
SELECT *
FROM   expression_name


/*
The execution order of a recursive CTE is as follows:

First, execute the anchor member to form the base result set (R0), use this result for the next iteration.

Second, execute the recursive member with the input result set from the previous iteration (Ri-1) 
and return a sub-result set (Ri) until the termination condition is met.

Third, combine all result sets R0, R1, … Rn using UNION ALL operator to produce the final result set.
*/

-- A) Simple SQL Server recursive CTE example
-- This example uses a recursive CTE to returns weekdays from Monday to Saturday:

WITH cte_numbers(n, weekday) 
AS (
    SELECT 
        0, 
        DATENAME(DW, 0)
    UNION ALL
    SELECT    
        n + 1, 
        DATENAME(DW, n + 1)
    FROM    
        cte_numbers
    WHERE n < 6
)
SELECT 
    weekday
FROM 
    cte_numbers;

/*
In this table, a staff reports to zero or one manager. 
A manager may have zero or more staffs. 
The top manager has no manager. 
The relationship is specified in the values of the manager_id column. 
If a staff does not report to any staff (in case of the top manager), 
the value in the manager_id is NULL.

This example uses a recursive CTE to get all subordinates 
of the top manager who does not have a manager 
(or the value in the manager_id column is NULL):
*/

WITH cte_org AS (
    SELECT       
        staff_id, 
        first_name,
        manager_id
        
    FROM       
        sales.staffs
    WHERE manager_id IS NULL
    UNION ALL
    SELECT 
        e.staff_id, 
        e.first_name,
        e.manager_id
    FROM 
        sales.staffs e
        INNER JOIN cte_org o 
            ON o.staff_id = e.manager_id
)
SELECT * FROM cte_org;
