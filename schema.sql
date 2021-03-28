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
	dept_no int not null,
	from_date date not null,
	to_date date not null);

-- Create table for titles
create table Titles(
emp_no int not null,
title int not null,
from_date date not null,
to_date date not null);

select * from departments;
