--Data Analysis Queries:

--Analysis 1: List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no,
e.last_name,
e.first_name,
e.sex,
s.salary
FROM employees AS e INNER JOIN
salaries AS s ON
e.emp_no = s.emp_no

--Analasis 2: List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name,
last_name, 
hire_date
FROM employees 
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'
ORDER BY 3

--Analysis 3: List the manager of each department with the following information: department number, department name, 
--the manager's employee number, last name, first name.
SELECT d.dept_no,
d.dept_name,
dm.emp_no, 
e.last_name,
e.first_name
FROM departments AS d LEFT JOIN
dept_manager AS dm ON 
d.dept_no = dm.dept_no LEFT JOIN
employees as e ON 
dm.emp_no = e.emp_no

--Analysis 4: List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_no, 
e.last_name, 
e.first_name, 
d.dept_name
FROM departments AS d INNER JOIN
dept_emp AS de ON 
d.dept_no = de.dept_no INNER JOIN
employees AS e ON
de.emp_no = e.emp_no

--Analysis 5: List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, 
last_name, 
sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%'

--Analysis 6: List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no,
e.last_name,
e.first_name,
d.dept_name
FROM departments AS d INNER JOIN
dept_emp AS de ON 
d.dept_no = de.dept_no INNER JOIN
employees AS e ON
de.emp_no = e.emp_no
WHERE d.dept_name = 'Sales'

--Analysis 7: List all employees in the Sales and Development departments, including their employee number, last name, first name, 
--and department name.
SELECT e.emp_no,
e.last_name,
e.first_name,
d.dept_name
FROM departments AS d INNER JOIN
dept_emp AS de ON 
d.dept_no = de.dept_no INNER JOIN
employees AS e ON
de.emp_no = e.emp_no
WHERE d.dept_name IN ('Sales', 'Development')

--Analysis 8: In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT DISTINCT last_name,
COUNT(DISTINCT last_name) AS "Frequency Count"
FROM employees
GROUP BY last_name
ORDER BY 1 DESC



