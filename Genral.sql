SELECT * FROM actor;
SELECT first_name FROM actor;
SELECT first_name, last_name FROM actor;
SELECT first_name, last_name, email FROM customer;
SELECT DISTINCT (release_year) FROM film;
SELECT DISTINCT (rental_rate) FROM film;
SELECT DISTINCT (rating) FROM film;
SELECT COUNT (*) FROM payment;
SELECT COUNT (DISTINCT amount) FROM payment;
SELECT  * FROM customer
WHERE first_name = 'Jared';
SELECT title FROM film
WHERE rental_rate > 4 AND replacement_cost >= 19.99
AND rating = 'R';

SELECT COUNT (*) FROM film
WHERE rental_rate > 4 AND replacement_cost >= 19.99
AND rating = 'R';

SELECT COUNT (*) FROM film
WHERE rating = 'R' OR rating = 'PG-13';

SELECT COUNT (*) FROM film
WHERE rating != 'R';

/* Challenge 1 */
SELECT email FROM customer
WHERE first_name = 'Nancy' 
AND last_name = 'Thomas';

SELECT description FROM film
WHERE title = 'Outlaw Hanky';

SELECT phone FROM address
WHERE address = '259 Ipoh Drive';

/* Order By and Limit */
SELECT store_id, first_name, last_name FROM customer
ORDER BY store_id DESC, first_name ASC;

SELECT * FROM payment
WHERE amount != 0.00
ORDER BY payment_date DESC
LIMIT 5;

/* Challenge Order By and Limit */
SELECT customer_id FROM payment
ORDER BY payment_date ASC
LIMIT 10;

SELECT title, length FROM film
ORDER By length ASC
LIMIT 5;

SELECT COUNT(title) FROM film
WHERE length <= 50;

/* Between, IN, Like and ILike */
Select * from payment
where amount between 8 and 9

SELECT * FROM payment
WHERE payment_date BETWEEN '2007-02-01' AND '2007-02-15'

SELECT DISTINCT amount FROM payment
ORDER BY amount;

SELECT COUNT(*) FROM payment
WHERE amount IN (0.99, 1.98, 1.99);

SELECT COUNT(*) FROM payment
WHERE amount NOT IN (0.99, 1.98, 1.99);

SELECT * FROM customer
WHERE first_name IN ('John','Jake', 'Julie');

SELECT * FROM customer
WHERE first_name LIKE 'J%' AND last_name LIKE 'S%';

SELECT * FROM customer
WHERE first_name LIKE 'A%' AND last_name NOT LIKE 'B%'
ORDER BY last_name;

/* General Challenge */
SELECT COUNT(*) FROM Payment
WHERE amount > 5;

SELECT COUNT(*) FROM actor
WHERE first_name LIKE 'P%';

SELECT COUNT(DISTINCT district) FROM address;
SELECT DISTINCT district FROM address;

SELECT COUNT(*) FROM film
WHERE rating = 'R' 
AND replacement_cost BETWEEN 5 AND 15;

SELECT COUNT(*) FROM film
WHERE title LIKE '%Truman%' ;