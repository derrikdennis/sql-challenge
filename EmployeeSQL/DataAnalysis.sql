---ANALYSIS ONE--
----Creating list of details for each em
DROP VIEW IF EXISTS 
	analysis_one;

CREATE VIEW 
	analysis_one AS
SELECT
	employees.emp_no,
	employees.first_name,
	employees.last_name,
	employees.gender,
	salaries.salary
FROM
	employees
JOIN
	salaries
ON
	employees.emp_no = salaries.emp_no
;

-----------------------------------------------------------------------------------
--ANALYSIS TWO--
--List the employees that were hired in 1986

DROP VIEW IF EXISTS 
	analysis_two;

CREATE VIEW 
	analysis_two AS
SELECT
	emp_no,
	first_name,
	last_name,
	hire_dt
FROM
	employees
WHERE EXTRACT(year from hire_dt) = 1986;

--------------------------------------------------------------------------------
-- ANALYSIS THREE--
--List the manager of each department with the following information:
--department number, department name, the manager’s employee number, last name, 
--     first name, and start and end employment dates

DROP VIEW IF EXISTS 
	analysis_three;
	
CREATE VIEW 
	analysis_three AS
SELECT
	dept_manager.dept_no,
	departments.dept_name,
	dept_manager.emp_no,
	employees.last_name,
	employees.first_name,
	dept_manager.mgr_start_dt,
	dept_manager.mgr_end_dt
FROM
	dept_manager
JOIN
	departments
ON
	dept_manager.dept_no = departments.dept_no
JOIN
	employees
ON
	dept_manager.emp_no = employees.emp_no;

-------------------------------------------------------------------
--ANALYSIS FOUR--
--Listing the department for each employee and providing the results as: 
--     employee number, last name, first name, and  department name.

DROP VIEW IF EXISTS 
	analysis_four;

CREATE VIEW 
	analysis_four AS
SELECT
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
	employees.emp_no, dept_emp.dept_start_dt;


------------------------------------------------------------------------
--ANALYSIS FIVE--
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

--------------------------------------------------------------------------------
--ANALYSIS SIX--
--List all employees in the Sales Department.  
--Provide their employee number, last name, first name and department name.

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

--------------------------------------------------------------------------------
--ANALYSIS SEVEN--
--List all employees in the Sales AND Development departments.  
--Provide their employee number, last name, first name and department name.

DROP VIEW IF EXISTS
	analysis_seven;

CREATE VIEW 
	analysis_seven AS
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
	departments.dept_name in ('Sales','Development')
;

--------------------------------------------------------------------------
--ANALYSIS EIGHT--
--In descending order, providing a frequency count of employee's last names.

DELETE VIEW IF EXISTS
	analysis_eight;

CREATE VIEW
	analysis_eight AS
SELECT
	last_name,
	count(last_name) AS "Count of Last Names"
FROM
	employees
GROUP BY
	last_name
ORDER BY
	"Count of Last Names" desc;