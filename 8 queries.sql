-- Select all records from the 'employees' table
SELECT * FROM "Employee";

-- 1. list the employee number, last name, first name, first name, sex, and salary of each employee.

SELECT e.emp_no, e.last_name,e.first_name,e.sex
FROM "Employee" AS e
LEFT JOIN "Salaries" AS s
ON e.emp_no= s.emp_no 
ORDER BY e.emp_no;


--2. Listing employees ( first/last name and hire date) who were hired 1986.
SELECT first_name, 
       last_name, 
       hire_date
FROM "Employee"
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

--3. List the manager of each department with dept_no,dept no, dept name,emp no,first/last name.
SELECT dm.dept_no, d.dept_name
FROM "dept_manager" AS dm
INNER JOIN "Departments" AS d
ON dm.dept_no = d.dept_no
LEFT JOIN "Employee" AS e
ON dm.emp_no = e.emp_no;


--4.List the department number for each employee along with that employee’s employee number, last name, first name, and department name.  
SELECT d.dept_no, e.emp_no, 
    e.last_name, 
    e.first_name, 
    d.dept_name AS department_name
FROM "Employee" AS e
INNER JOIN dept_emp AS de
    ON e.emp_no = de.emp_no
INNER JOIN "Departments" AS d
    ON de.dept_no = d.dept_no;



--5 List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name,sex
FROM "Employee"
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--6 list each employee in the Sales department
SELECT d.dept_name, e.emp_no, e.last_name, e.first_name
FROM "Employee" AS e
INNER JOIN dept_emp AS de
    ON e.emp_no = de.emp_no
INNER JOIN "Departments" AS d
    ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
ORDER BY e.emp_no;

--7 List each employee in the Sales and Development departments
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM "Employee"AS e
INNER JOIN dept_emp AS de
    ON e.emp_no = de.emp_no
INNER JOIN "Departments" AS d
    ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development')
ORDER BY e.emp_no;

--8 List the frequency counts of all employee last names
SELECT e.last_name, COUNT(*) AS name_count
FROM "Employee"AS e
GROUP BY e.last_name
ORDER BY name_count DESC;
