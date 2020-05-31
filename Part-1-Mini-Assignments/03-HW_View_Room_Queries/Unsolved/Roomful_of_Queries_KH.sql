SELECT * FROM inventory;
SELECT * FROM film;
--Write a query to get the number of copies of a film title that exist in the inventory.
--Your challenge is to use a subquery (a query embedded within another query) instead of a join.
--Create a view named title_count from the above query.

CREATE VIEW title_count AS
SELECT 
	title,
	COUNT(inventory.film_id)
FROM film
INNER JOIN inventory ON inventory.film_id = film.film_id
WHERE film.film_id IN
	(SELECT film_id FROM inventory)
GROUP BY title
ORDER BY COUNT DESC;

--Query the newly created view to find all the titles that have 7 copies
SELECT * FROM title_count WHERE count=7;