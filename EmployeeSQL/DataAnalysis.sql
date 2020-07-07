--Analysis Four 
--Listing the department for each employee and providing the results as: Employee Number, Last Name, First Name, and
--   department name.

DROP VIEW IF EXISTS 
	analysis_four;

CREATE VIEW 
	analysis_four AS
SELECT DISTINCT ON (employees.emp_no)
	employees.emp_no,
	employees.last_name,
	employees.first_name,
	(SELECT departments.dept_name
		FROM departments
		WHERE departments.dept_no = dept_emp.dept_no)
FROM
	employees
JOIN
	dept_emp
ON
	employees.emp_no = dept_emp.emp_no
ORDER BY
	employees.emp_no, dept_emp.dept_start_dt DESC;
	
--Analysis Five
--List all employees with the first name "Hercules" and the last name starting with "B"

DROP VIEW IF EXISTS
	analysis_five;
	
CREATE VIEW 
	analysis_five AS
SELECT
	*
FROM
	employees
WHERE
	first_name = 'Hercules' AND
	last_name like 'B%'
;

--Analysis Six
--List all employees in the Sales Department.  Provide their employee number, last name, first name and department name.
DROP VIEW IF EXISTS
	analysis_six;

CREATE VIEW 
	analysis_six AS
SELECT 
	employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM
	employees
LEFT JOIN
	dept_emp
ON
	employees.emp_no = dept_emp.emp_no
LEFT JOIN
	departments
ON
	dept_emp.dept_no = departments.dept_no
WHERE
	departments.dept_name = 'Sales'
;