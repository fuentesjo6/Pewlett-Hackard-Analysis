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

-- RECREATE THE TABLE FOR RETIRING EMP and showin it
SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
SELECT * FROM retirement_info

-- Joining deparements and dept_manager tables
SELECT departments.dept_name,
	dept_manager.emp_no,
	dept_manager.from_date,
	dept_manager.to_date
FROM departments
INNER JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no;


-- same as above with aliases
SELECT d.dept_name,
	dm.emp_no,
	dm.from_date,
	dm.to_date
FROM departments as d
INNER JOIN dept_manager as dm
ON d.dept_no = dm.dept_no;

-- Joining retirement_info and dept_emp tables
SELECT retirement_info.emp_no,
    retirement_info.first_name,
	retirement_info.last_name,
    dept_emp.to_date
FROM retirement_info
LEFT JOIN dept_emp
ON retirement_info.emp_no = dept_emp.emp_no;

-- same as above with aliases
SELECT ri.emp_no,
    ri.first_name,
	ri.last_name,
    de.to_date
FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no;

select * from dept_manager;


select ri.emp_no,
	ri.first_name,
	ri.last_name,
	de.to_date
	into current_emp
	from retirement_info as ri
	left join dept_emp as de
	on ri.emp_no = de.emp_no
	where de.to_date = ('9999-01-01');

select * from current_emp;

-- Employee count by department number
SELECT COUNT(ce.emp_no), de.dept_no
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;
 -- this will give me the result grouped by dept_no and also in order of dept_no

-- creating new list of general employee info but with their salaries
select * from salaries
order by to_date desc;

select emp_no,first_name, last_name, gender
into emp_info
from employees
where (birht_date between '1952-01-01' and '1955-12-31')
and (hire_date between '1985-01-01' and '1988-12-31');

select e.emp_no, e.first_name, e.last_name, e.gender, s.salary, de.to_date
into employee_info
from employees as e
inner join salaries as s
on (e.emp_no = s.emp_no)
inner join dept_emp as de
on (e.emp_no = de.emp_no)
where (birth_date between '1952-01-01' and '1955-12-31')
and (hire_date between '1985-01-01' and '1988-12-31')
and (de.to_date = '9999-01-01');


