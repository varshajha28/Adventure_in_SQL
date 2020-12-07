/* Create, Insert, Update, Alter, Constraint, table keys */
CREATE TABLE account(
	user_id SERIAL PRIMARY KEY,
	username VARCHAR(50) UNIQUE NOT NULL,
	password VARCHAR(50) NOT NULL,
	email VARCHAR(250) UNIQUE NOT NULL,
	created_on TIMESTAMP NOT NULL,
	last_login TIMESTAMP
)

CREATE TABLE job(
	job_id SERIAL PRIMARY KEY,
	job_name VARCHAR(200) UNIQUE NOT NULL
)

CREATE TABLE account_job(
	user_id INTEGER REFERENCES account(user_id),
	job_id INTEGER REFERENCES job(job_id),
	hire_date TIMESTAMP	
)

INSERT INTO account(username, password, email, created_on)
VALUES
('Jose', 'password', 'jose@mail.com', CURRENT_TIMESTAMP)

SELECT * FROM account;

INSERT INTO job(job_name)
VALUES
('Astronaut')

SELECT * FROM job;

INSERT INTO job(job_name)
VALUES
('President')

INSERT INTO account_job(user_id, job_id, hire_date)
VALUES
(1, 1,CURRENT_TIMESTAMP)
SELECT * FROM account_job;

UPDATE account
SET last_login = CURRENT_TIMESTAMP

UPDATE account
SET last_login = created_on

UPDATE account_job
SET hire_date = account.created_on
FROM account
WHERE account_job.user_id = account.user_id

UPDATE account
SET last_login = CURRENT_TIMESTAMP
RETURNING email, created_on, last_login

INSERT INTO job(job_name)
VALUES
('Cowboy')

DELETE FROM job
WHERE job_name = 'Cowboy'
RETURNING job_id, job_name

CREATE TABLE information(
	info_id SERIAL PRIMARY KEY,
	title VARCHAR(500) NOT NULL,
	person VARCHAR(50) UNIQUE NOT NULL
)

SELECT * FROM information;
ALTER TABLE information
RENAME TO new_info

SELECT * FROM new_info;

ALTER TABLE new_info
RENAME COLUMN person TO people

ALTER TABLE new_info
ALTER COLUMN people DROP NOT NULL

INSERT INTO new_info(title)
VALUES
('Some new title')

ALTER TABLE new_info
DROP COLUMN IF EXISTS people 

CREATE TABLE employees(
	emp_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	birthdate DATE CHECK (birthdate > '1900-01-01'),
	hire_date DATE CHECK (hire_date > birthdate),
	salary INTEGER CHECK (salary > 0)
)

INSERT INTO employees(first_name, last_name, birthdate, hire_date, salary)
VALUES
('Jose', 'Portilla', '1990-02-23', '2010-04-26', 100)

INSERT INTO employees(first_name, last_name, birthdate, hire_date, salary)
VALUES
('Sammy', 'Joshua', '1990-02-23', '2010-04-26', 100)

SELECT * FROM employees;