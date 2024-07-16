--1. List the employee number, last name, first name, sex, and salary of each employee 

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
LEFT JOIN salaries
ON employees.emp_no = salaries.emp_no;

--2. List the first name, last name, and hire date for the employees who were hired in 1986

SELECT employees.first_name, employees.last_name, employees.hire_date
FROM employees
WHERE hire_date IN (
	SELECT hire_date FROM employees
	WHERE EXTRACT(YEAR FROM hire_date) = 1986);
	
--3. List the manager of each department along with their department number, department name, employee number, last name, and first name 

SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM dept_manager
LEFT JOIN employees
ON dept_manager.emp_no = employees.emp_no
LEFT JOIN departments
ON dept_manager.dept_no = departments.dept_no;

--4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name 

SELECT dept_emp.dept_no, employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
LEFT JOIN employees
ON dept_emp.emp_no = employees.emp_no
LEFT JOIN departments
ON dept_emp.dept_no = departments.dept_no;

--5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE first_name = 'Hercules'  
AND LEFT(last_name,1) = 'B';

--sales department no is 'd007
SELECT dept_emp.dept_no, employees.emp_no, employees.last_name, employees.first_name
FROM employees
INNER JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
AND dept_emp.dept_no = 'd007';

SELECT dept_emp.dept_no, departments.dept_name, employees.emp_no, employees.last_name, employees.first_name
FROM employees
INNER JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
LEFT JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name IN ('Sales', 'Development')

--8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)

SELECT employees.last_name, COUNT(*) AS frequency_counts
FROM employees
GROUP BY last_name
ORDER BY frequency_counts DESC;

