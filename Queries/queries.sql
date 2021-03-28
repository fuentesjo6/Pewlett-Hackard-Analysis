-- search for employees ready to retire
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

-- select employees born in 1952
select first_name, last_name
from employees
where birth_date BETWEEN '1952-01-01' AND '1952-12-31'

-- select employees born in 1953
select first_name, last_name
from employees
where birth_date BETWEEN '1953-01-01' AND '1953-12-31'

-- select employees born in 1954
select first_name, last_name
from employees
where birth_date BETWEEN '1954-01-01' AND '1954-12-31'

-- select employees born in 1955
select first_name, last_name
from employees
where birth_date BETWEEN '1955-01-01' AND '1955-12-31'

-- Retirement eligible
select first_name, last_name
from employees
where (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

select COUNT(first_name)
from employees
where (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- TRANSFER INTO A TABLE
select first_name, last_name
INTO retirement_info
from employees
where (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

select * from retirement_info;


