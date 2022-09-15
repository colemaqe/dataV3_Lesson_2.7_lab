use sakila;
select * from sakila.category;

-- 1 How many films are there for each of the categories in the category table. Use appropriate join to write this query.
select c.category_id, count(f.category_id)
from sakila.category c
join film_category f
on f.category_id = c.category_id
group by f.category_id;

-- 2 Display the total amount rung up by each staff member in August of 2005.
select * from sakila.rental;
select * from sakila.payment;

Select distinct staff_id, sum(amount) from sakila.payment;

select distinct(staff_id), sum(amount) from sakila.payment
WHERE payment_date BETWEEN "2005-08-00" AND "2005-08-31"
group by staff_id;


-- 3 Which actor has appeared in the most films?
SELECT a.actor_id, a.first_name, a.last_name, COUNT(DISTINCT f.film_id)
FROM sakila.film_actor f
JOIN actor a
ON f.actor_id = a.actor_id
GROUP BY f.actor_id
ORDER BY COUNT(DISTINCT f.film_id) DESC;


-- 4 Most active customer (the customer that has rented the most number of films)
SELECT c.customer_id as 'customer_id', c.first_name, c.last_name, COUNT(r.rental_id) as 'number of rentals'
FROM sakila.customer c
JOIN sakila.rental r USING(customer_id)
GROUP BY c.customer_id
ORDER BY COUNT(r.rental_id) DESC;


-- 5 Display the first and last names, as well as the address, of each staff member.
SELECT s.first_name, s.last_name, a.address
FROM sakila.staff s
JOIN sakila.address a
ON a.address_id = s.address_id;

-- 6 List each film and the number of actors who are listed for that film.
SELECT f.title as 'film title', COUNT(fa.actor_id) as 'number of actors'
FROM sakila.film f
JOIN sakila.film_actor fa USING(film_id)
GROUP BY f.title
ORDER BY COUNT(fa.actor_id) DESC;

-- 7 Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
SELECT c.first_name, c.last_name, SUM(p.amount) as 'total payment'
FROM sakila.payment p 
JOIN sakila.customer c USING(customer_id)
GROUP BY c.first_name, c.last_name
ORDER BY LAST_NAME ASC;