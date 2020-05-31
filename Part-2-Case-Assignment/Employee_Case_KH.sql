--create departments table
CREATE TABLE departments(
	dept_no VARCHAR,
	dept_name VARCHAR,
	PRIMARY KEY (dept_no)
);

--create department employee table
CREATE TABLE dept_emp(
	emp_no VARCHAR,
	dept_no VARCHAR,
	FOREIGN KEY (emp_no) REFERENCES employee(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
	);

--create department manager table
CREATE TABLE dept_manager(
	dept_no VARCHAR,
	emp_no VARCHAR,
	FOREIGN KEY (emp_no) REFERENCES employee(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
	);

--create employee table
CREATE TABLE employee(
	emp_no VARCHAR,
	emp_title VARCHAR,
	birth_date DATE,
	first_name VARCHAR,
	last_name VARCHAR,
	sex CHAR(1),
	hire_date DATE,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title) REFERENCES title(title_id)
);

--create salaries table
CREATE TABLE salaries(
	emp_no VARCHAR,
	salary VARCHAR,
	FOREIGN KEY(emp_no) REFERENCES employee(emp_no));

--create titles table
CREATE TABLE title(
	title_id VARCHAR,
	title VARCHAR,
	PRIMARY KEY (title_id)
);


SELECT * FROM employee;
SELECT * FROM departments;
SELECT * FROM title;
SELECT * FROM salaries;
SELECT * FROM dept_manager;
SELECT * FROM dept_emp;
-----------------------------
--List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT
	e.emp_no,
	first_name,
	last_name,
	sex,
	salary
FROM employee  as e
INNER JOIN salaries s ON s.emp_no = e.emp_no;

--List first name, last name, and hire date for employees who were hired in 1986.
SELECT
	first_name,
	last_name,
	hire_date
FROM employee
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

--List the manager of each department with the following information: 
---department number, department name, the manager's employee number, last name, first name.
SELECT
	d.dept_no,
	dept_name,
	e.emp_no as "emp_manager_no",
	last_name,
	first_name
FROM employee e
INNER JOIN dept_emp de ON de.emp_no = e.emp_no
INNER JOIN departments d ON d.dept_no = de.dept_no
WHERE e.emp_no IN
	(SELECT emp_no FROM dept_manager);

--List the department of each employee with the following information: 
---employee number, last name, first name, and department name.
SELECT
	e.emp_no,
	last_name,
	first_name,
	dept_name
FROM employee e
INNER JOIN dept_emp de ON de.emp_no = e.emp_no
INNER JOIN departments d ON d.dept_no = de.dept_no;

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT
	first_name,
	last_name,
	sex
FROM employee
WHERE first_name = 'Hercules' AND last_Name LIKE 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT
	e.emp_no,
	last_name,
	first_name,
	dept_name
FROM employee e
INNER JOIN dept_emp de ON de.emp_no = e.emp_no
INNER JOIN departments d ON d.dept_no = de.dept_no
WHERE dept_name = 'Sales';	

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT
	e.emp_no,
	last_name,
	first_name,
	dept_name
FROM employee e
INNER JOIN dept_emp de ON de.emp_no = e.emp_no
INNER JOIN departments d ON d.dept_no = de.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT
	last_name,
	COUNT(last_name)
FROM employee
GROUP BY last_name
ORDER BY COUNT DESC;


Bonus (Optional)
