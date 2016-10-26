/* Question 1*/
SELECT * FROM sakila.language;

/* Question 2*/
SELECT first_name,last_name FROM sakila.actor WHERE last_name LIKE '%SON%' ORDER BY first_name;

/* Question 3*/
SELECT * FROM address WHERE district=' ' ORDER BY city_id ASC;

/* Question 4*/
SELECT film.title FROM film INNER JOIN sakila.film_category ON film.film_id=film_category.film_id order by film.title;

/* Question 5*/
SELECT film_category.category_id,COUNT(film_category.film_id) FROM film_category 
INNER JOIN film ON film.film_id=film_category.film_id 
group by film_category.category_id
ORDER BY category_id;

/* Question 6*/
SELECT film_category.category_id,COUNT(film_category.film_id) FROM film_category 
INNER JOIN film ON film.film_id=film_category.film_id 
group by film_category.category_id 
HAVING COUNT(film_category.film_id)>60
ORDER BY category_id;

/* Question 7*/
SELECT film_category.category_id,COUNT(film_category.film_id) FROM film 
INNER JOIN film_category ON film.film_id=film_category.film_id 
group by film_category.category_id 
HAVING (AVG(film.replacement_cost) - AVG(film.rental_rate))>17
ORDER BY category_id;

/* Question 8*/
SELECT film.title,category.name FROM film
INNER JOIN film_category ON film.film_id=film_category.film_id 
INNER JOIN category ON film_category.category_id=category.category_id;

/* Question 9*/
SELECT film.title,category.name FROM film
INNER JOIN film_category ON film.film_id=film_category.film_id 
INNER JOIN category ON film_category.category_id=category.category_id
group by category.category_id
HAVING (AVG(film.replacement_cost) - AVG(film.rental_rate))>17;

/* Question 10*/
SELECT actor.actor_id,actor.first_name,actor.last_name,count(film.film_id) FROM film
INNER JOIN film_actor ON film.film_id=film_actor.film_id 
INNER JOIN actor ON film_actor.film_id=actor.actor_id
group by actor.actor_id
order by count(film.film_id);

/* Question 11*/
SELECT actor.actor_id,actor.first_name,actor.last_name,count(film.film_id) FROM film
INNER JOIN film_actor ON film.film_id=film_actor.film_id 
INNER JOIN actor ON film_actor.film_id=actor.actor_id
group by actor.actor_id
HAVING MIN(film.length)=150
order by count(film.film_id);

/* Question 12*/
SELECT film.title,category.name,language_id FROM film 
INNER JOIN film_category ON film.film_id=film_category.film_id 
INNER JOIN category ON film_category.category_id=category.category_id
HAVING category.name="Documentary" AND language_id="1";

/* Question 13*/
SELECT film.film_id,film.title from film
where film.film_id NOT IN
	(SELECT inventory.film_id from inventory)
    order by film.film_id;