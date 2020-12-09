/* Assessment 1 */
SELECT customer_id, SUM(amount) FROM payment
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount) >= 110 ;

SELECT COUNT(*) FROM film
WHERE title LIKE 'J%';

SELECT first_name, last_name  FROM customer
WHERE first_name LIKE 'E%'
AND address_id < 500
ORDER BY customer_id DESC
LIMIT 1;


/* Assesment -2  */
SELECT * FROM cd.facilities;

SELECT name, membercost FROM cd.facilities;

SELECT * FROM cd.facilities WHERE membercost >0;

SELECT facid, name, membercost, monthlymaintenance FROM cd.facilities
WHERE membercost >0 AND  membercost< (monthlymaintenance/50.0);

SELECT * FROM cd.facilities
WHERE name LIKE '%Tennis%';

SELECT * FROM cd.facilities
WHERE facid IN (1,5);

SELECT memid, surname, firstname, joindate  FROM cd.members
WHERE EXTRACT(YEAR FROM joindate) >= 2012 AND EXTRACT(MONTH FROM joindate) >= 9;

SELECT DISTINCT surname  FROM cd.members
ORDER BY surname
LIMIT 10;

SELECT joindate  FROM cd.members
ORDER BY joindate DESC
LIMIT 1;

SELECT COUNT(*) FROM cd.facilities WHERE guestcost > 10;

SELECT facid, SUM(slots) AS Total_slot FROM cd.bookings
WHERE EXTRACT(YEAR FROM starttime) = 2012 AND EXTRACT(MONTH FROM starttime) >= 9
GROUP BY facid
ORDER BY SUM(slots);

SELECT facid, SUM(slots) AS Total_slot FROM cd.bookings
GROUP BY facid
HAVING SUM(slots) >1000
ORDER BY SUM(slots) DESC;

SELECT cd.bookings.starttime AS start, cd.facilities.name FROM cd.bookings 
INNER JOIN cd.facilities ON
cd.bookings.facid = cd.facilities.facid
WHERE cd.facilities.facid IN (0,1) 
AND cd.bookings.starttime >= '2012-09-21'
AND cd.bookings.starttime <= '2012-09-22'
ORDER BY cd.bookings.starttime ;

SELECT * FROM cd.bookings;
SELECT cd.bookings.starttime, cd.members.firstname, cd.members.surname FROM cd.bookings
INNER JOIN cd.members ON
cd.members.memid = cd.bookings.memid 
WHERE cd.members.firstname = 'David' 
AND cd.members.surname = 'Farrell';

/*Assessment -3*/
CREATE TABLE students(
	student_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	home_room INTEGER ,
	phone VARCHAR(50) UNIQUE NOT NULL,
	email VARCHAR(250) UNIQUE NOT NULL,
	grad_year INTEGER
	
)

CREATE TABLE teachers(
	teacher_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	home_room INTEGER,
	dept_name VARCHAR(200),
	phone VARCHAR(50) UNIQUE,
	email VARCHAR(250) UNIQUE
	)
	
INSERT INTO students(first_name,
	last_name,
	home_room ,
	phone,
	email,
	grad_year )
VALUES
('Mark', 'Watney', 5, '777-555-1234','mark.watney@mail.com',2035)

INSERT INTO teachers(first_name,last_name, home_room , dept_name ,email,phone)
VALUES 
('Jonas','Salk',5,'Biology','jsalk@school.org','7755554321');