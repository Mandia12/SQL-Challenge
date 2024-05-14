-- List the employee number, last name, first name, sex, and salary of each employee.
select e.Emp_no as "Employee No", e.last_name as "Last Name", e.first_name as "First Name", e.sex as "Sex", s.salary as "Salary"
from Employees e
join Salaries s on
	s.emp_no = e.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986.
select first_name as "First Name", last_name as "Last Name", hire_date as "Date Hired"
from Employees
where hire_date >= '1986-01-01' and hire_date < '1987-01-01';

-- List the manager of each department along with their department number, department name, 
-- employee number, last name, and first name.
select dm.dept_no as "Department No", d.dept_name as "Department", e.emp_no as "Employee No", e.last_name as "Last Name", e.first_name as "First Name"
from employees e
join dept_manager dm
on (e.emp_no = dm.emp_no)
join departments d
on (dm.dept_no = d.dept_no);


-- List the department number for each employee along with that employee’s employee number,
-- last name, first name, and department name.
select de.dept_no as "Department No", e.emp_no as "Employee No", e.last_name as "Last Name", e.first_name as "First Name", d.dept_name as "Department"
from employees e
join dept_emp de
on (e.emp_no = de.emp_no)
join departments d
on (de.dept_no = d.dept_no);

-- List first name, last name, and sex of each employee whose first name is Hercules and whose
-- last name begins with the letter B.
select first_name as "First Name", last_name as "Last Name", sex as "Sex"
from employees
where first_name = 'Hercules' and last_name like 'B%';

-- List each employee in the Sales department, including their employee number, last name,
-- and first name.
select emp_no as "Employee No", last_name as "Last Name", first_name as "First Name"
from employees
where emp_no in
	(select emp_no
	from dept_emp
	where dept_no in 
		(select dept_no
		from departments
		where dept_name = 'Sales')
	);

-- List each employee in the Sales and Development departments, including their employee number,
-- last name, first name, and department name.
select e.emp_no as "Employee No", e.last_name as "Last Name", e.first_name as "First Name", d.dept_name as "Department"
from employees e
join dept_emp de
on (e.emp_no = de.emp_no)
join departments d
on (de.dept_no = d.dept_no)
where d.dept_name = 'Sales' or d.dept_name = 'Development';

-- List the frequency counts, in descending order, of all the employee last names 
-- (that is, how many employees share each last name).
select last_name as "Last Name", count(last_name) as "Last Name Count"
from employees
group by "Last Name"
order by "Last Name Count" desc;
