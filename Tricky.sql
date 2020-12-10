/*Create an SQL query that shows the TOP 3 authors who sold the most books in total!*/
SELECT authors.author_name, SUM(books.sold_copies) AS sold_sum
FROM authors
JOIN books
ON books.book_name = authors.book_name
GROUP BY authors.author_name
ORDER BY sold_sum DESC
LIMIT 3;

/*Write an SQL query to find out how many users inserted more than 1000 but less than 2000 images in their presentations!*/

SELECT COUNT(*) FROM
  (SELECT user_id, COUNT(event_date_time) AS image_per_user
  FROM event_log
  GROUP BY user_id) AS image_per_user
WHERE image_per_user < 2000 AND image_per_user > 1000;

/* Print every department where the average salary per employee is lower than $500!*/

SELECT department_name, AVG(salaries.salary) AS avg_salaries
FROM employees
JOIN salaries
ON employees.employee_id = salaries.employee_id
GROUP BY department_name
HAVING AVG(salaries.salary) < 500;
