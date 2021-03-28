-- Creating tables for PH-EmployeesDB
create table departments (
	dept_no Varchar(4) not null,
	dept_name Varchar(40) not null,
	primary key (dept_no),
	Unique (dept_name))
	
-- Creatintg table for employees
create table employees(
     emp_no INT NOT NULL,
     birth_date DATE NOT NULL,
     first_name VARCHAR NOT NULL,
     last_name VARCHAR NOT NULL,
     gender VARCHAR NOT NULL,
     hire_date DATE NOT NULL,
     PRIMARY KEY (emp_no)
);
-- Create table for dept managers
CREATE TABLE dept_manager (
	dept_no VARCHAR(4) NOT NULL,
    emp_no INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);

-- Creat table for salaries
	CREATE TABLE salaries (
  	emp_no INT NOT NULL,
  	salary INT NOT NULL,
  	from_date DATE NOT NULL,
  	to_date DATE NOT NULL,
  	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  	PRIMARY KEY (emp_no)
);

-- Create table for Dep_Emp
Create table dept_emp(
	emp_no int not null,
	dept_no varchar not null,
	from_date date not null,
	to_date date not null,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	PRIMARY KEY (emp_no, dept_no)
);
-- Create table for titles
	Create table titles(
	emp_no INT NOT NULL,
	title VARCHAR(50) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY (emp_no, from_date)
);
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