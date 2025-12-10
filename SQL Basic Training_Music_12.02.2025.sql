/*

CREATED By: Sara Nafaryeh
CREATED DATE: 12/01/2025
DESCRIPTION: this report will dysply properly the customers first and last names wit their email addresses

*/

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

