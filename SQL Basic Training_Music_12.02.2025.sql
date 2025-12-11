--Select * from Invoice where 1=0;

--------------------------------------------------
--CREATED By: Sara Nafaryeh
--CREATED DATE: 12/01/2025
--DESCRIPTION: this report will display properly the customers first and last names with their email addresses
--------------------------------------------------

SELECT
	FirstName as [Customer First Name], -- add an aliese/ renaming te column Name
	LastName as "Customer Last Name", 
	Email as EMAIL -- no [] or "" since its just one word
FROM
	Customer

ORDER by
	 --LastName ASC, FirstName DESC
	 FirstName, LastName DESC
	-- LastName DESC
	
LIMIT --have to put it after order by
	10



-------------------------------------------------
--CREATED By: Sara Nafaryeh
--CREATED DATE: 12/01/2025
--DESCRIPTION: This report with display how many invoices we have that are exactly $1.98 or $3.96 
---------------------------------------------


SELECT
	InvoiceDate,
	BillingAddress,
	BillingCity,
	total
FROM
	Invoice
WHERE
	total IN (1.98, 3.96)

ORDER by
	 InvoiceDate DESC
	--total ASC


	
-------------------------------------------------

---------------------------------------------

SELECT
	InvoiceDate,
	BillingAddress,
	BillingCity,
	total
FROM
	Invoice
WHERE
	--BillingCity = 'Brussels'							--DESCRIPTION: This report will calcuate how many Invoices were billed to Brussels 
	BillingCity in ('Brussels', 'Orlando' , 'Paris')	-- follow up question, how many invoices billed to Brussels, Orlando or Paris
order by
	BillingCity ASC
	
Select * from Invoice where 1=0;



-------------------------------------------------
-- Wild Card character % , inconjuction to the LIKE opperator; % i do not care what comes next
---------------------------------------------

SELECT
	InvoiceDate,
	BillingAddress,
	BillingCity,
	total
FROM
	Invoice
WHERE
	--BillingCity = 'Brussels'   						--This report will calcuate how many Invoices were billed to Brussels 
	--BillingCity in ('Brussels', 'Orlando' , 'Paris')  --next question: How many invoices billed to Brussels, Orlando or Paris
	--BillingCity like 'B%'								--next question: How many Invoice were billed in cities that start with B?
	BillingCity like '%B%'  							
order by
	BillingCity ASC



--------------------------------------------
-- Filtering and analyze using dates & time, 
--		AND OR statements
------------------------------------------
SELECT 
	InvoiceDate,
	BillingAddress,
	BillingCity,
	total

FROM
	Invoice
WHERE 
	--InvoiceDate = '2010-05-22 00:00:00'  					-- GOAL: How many invoices were billed on 2010-05-22 00:00:00?
	--date(InvoiceDate) = '2010-05-22'						-- using the date function to get the date we want without use time part
	--date(InvoiceDate) > '2010-05-22' AND total < 3.00		-- get all INV that are billed after 2010-05-22 and have total of less than 3.00
	--BillingCity like 'p%' or BillingCity like 'd%'			-- the billing city starts with P or starts with D
	
	-- PEMDAS ( Parenthese, Expoents, Multiple/Division, Add/ Sub
	total > 1.98 and(BillingCity like 'p%' or BillingCity like 'd%')		-- get all INV that are greater than 1.98 from any city whose name starts with P or starts with D?
	
ORDER by
	total aSC, BillingCity ASC




-----------------------------------------------------------------------------------------------------
-- Case Study 			GOAL: want as many customers as possible to spend between $7.00 and $15.00
--
-- Sales Categories:
-- Baseline Purchase -  B/t 0.99 -  1.99
-- Low Purchase 		B/t 2.00 -  6.99
-- Target Purchase		B/t 7.00 - 15.00
-- Top Performer 		Above 15
-- when using a condition / catigory to sort based on totals column
------------------------------------------------------------------------------------------

SELECT
	InvoiceDate,
	BillingAddress,
	BillingCity,
	total,
	
	CASE
	WHEN total <2.00 THEN 'Base Purchase'
	WHEN total BETWEEN 2.00 AND 6.99 THEN 'Low Purchase'
	when total BETWEEN 7.00 AND 15.00 THEN 'Target Purchase'
	ELSE 'Top Performer'
	END AS Purchase_Type 
FROM
	Invoice
ORDER BY
	Purchase_Type
*/	

/*
-----------------------------------------------
-- Code Challenge: Categorize traks by price

-- Purpose: White a SQL query that selects track names, composers, and unit prices, and categories each track based on its price
--------------------------------------------

SELECT
	Name as [Track Name],
	Composer,
	UnitPrice as [Price],
	
	CASE
		WHEN UnitPrice <= 0.99 then 'Budget'
		WHEN UnitPrice BETWEEN 1.00 and 1.49 then 'Regular'
		WHEN UnitPrice BETWEEN 1.50 and 1.99 THEN 'Premium'
		else 'Excluseive'
	end as PriceCategory
FROM
	Track
order by
    unitprice ASC;






