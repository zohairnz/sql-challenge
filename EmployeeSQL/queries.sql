-- 1. List the employee number, last name, first name, sex, and salary of each employee.
SELECT emp.emp_no, emp.last_name, emp.first_name, emp.sex, sal.salary
FROM employees AS emp
INNER JOIN salaries AS sal
ON emp.emp_no = sal.emp_no;

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT emp.first_name, emp.last_name, emp.hire_date
FROM employees AS emp
WHERE emp.hire_date LIKE '%1986%';

-- 3. List the manager of each department along with their department number, department name, 
-- employee number, last name, and first name.

SELECT dm.dept_no, dep.dept_name, emp.emp_no, emp.last_name, emp.first_name
FROM dept_manager AS dm
INNER JOIN departments AS dep
ON dm.dept_no = dep.dept_no
INNER JOIN employees AS emp
ON emp.emp_no = dm.emp_no;

-- 4. List the department number for each employee along with that employee’s employee number, 
-- last name, first name, and department name.

SELECT de.dept_no, emp.emp_no, emp.last_name, emp.first_name, dep.dept_name
FROM dept_emp AS de
INNER JOIN departments AS dep
ON de.dept_no = dep.dept_no
INNER JOIN employees AS emp
ON emp.emp_no = de.emp_no;

-- 5. List first name, last name, and sex of each employee whose first name is Hercules and 
-- whose last name begins with the letter B.

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' 
AND last_name LIKE 'B%';

-- 6. List each employee in the Sales department, including their employee number, last name,
-- and first name.
SELECT emp.emp_no, emp.last_name, emp.first_name
FROM dept_emp AS de
INNER JOIN departments AS dep
ON de.dept_no = dep.dept_no
INNER JOIN employees AS emp
ON emp.emp_no = de.emp_no
WHERE dep.dept_name = 'Sales';

-- 7. List each employee in the Sales and Development departments, including their employee 
-- number, last name, first name, and department name.
SELECT emp.emp_no, emp.last_name, emp.first_name, dep.dept_name
FROM dept_emp AS de
INNER JOIN departments AS dep
ON de.dept_no = dep.dept_no
INNER JOIN employees AS emp
ON emp.emp_no = de.emp_no
WHERE dep.dept_name = 'Sales'
OR dep.dept_name = 'Development';

-- 8. List the frequency counts, in descending order, of all the employee last names (that is,
-- how many employees share each last name).
SELECT last_name, COUNT(*)
FROM employees
GROUP BY last_name
ORDER BY count DESC;