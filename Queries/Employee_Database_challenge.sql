select 	employees.emp_no, 
		employees.first_name, 
		employees.last_name,
		titles.title, 
		titles.from_date, 
		titles.to_date
into retirement_titles
from employees
inner join titles
on employees.emp_no = titles.emp_no
where birth_date between '1952-01-01' and '1955-12-31'
order by emp_no;

select * from retirement_titles;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (retirement_titles.emp_no) emp_no,
first_name,
last_name,
title

INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

select * from unique_titles;

select count(title), title
into retiring_titles
from unique_titles
group by title
order by count(title) desc;

select * from retiring_titles

-- combining tables to create preliminary table
select 	employees.emp_no,
		employees.first_name,
		employees.last_name,
		employees.birth_date,
		dept_emp.from_date,
		dept_emp.to_date,
		titles.title
into mentorship_elig_test
from employees
inner join dept_emp on (employees.emp_no = dept_emp.emp_no)
inner join titles on (employees.emp_no = titles.emp_no)
where birth_date between '1965-01-01' and '1965-12-31'
order by emp_no, to_date DESC

select * from mentorship_elig_test

-- create mentorship eligibility table
select distinct on (mentorship_elig_test.emp_no) emp_no, first_name,
					last_name,
					birth_date,
					from_date,
					to_date,
					title
into mentorship_eligibility
from mentorship_elig_test
order by emp_no, to_date DESC


select * from mentorship_eligibility
