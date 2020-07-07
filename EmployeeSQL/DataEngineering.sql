
--CREATING the TABLE departments with 2 variables.  The dept_no is our PRIMARY KEY.
DROP TABLE IF EXISTS departments;

CREATE TABLE departments (
    dept_no VARCHAR(4) PRIMARY KEY NOT NULL,
    dept_name VARCHAR(30) NOT NULL
);

-- USE THE IMPORT/EXPORT Function in order to load in '../data/departments.csv'

--CREATING the TABLE employee with 6 variables.  The emp_no is our PRIMARY KEY.
DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    emp_no INTEGER PRIMARY KEY NOT NULL,
    birth_dt DATE   NOT NULL,
    first_name VARCHAR(20)   NOT NULL,
    last_name VARCHAR(20)   NOT NULL,
    gender VARCHAR(1)   NOT NULL,
    hire_dt DATE   NOT NULL
);

-- USE THE IMPORT/EXPORT Function in order to load in '../data/employees.csv'


--CREATING the TABLE employee with 4 variables.  The combingation of emp_no dept_no is our PRIMARY KEY.
-- emp_no and dept_no are foreign keys that must have values in the employees and departments tables respectively.
DROP TABLE IF EXISTS dept_emp;
CREATE TABLE dept_emp (
    emp_no INTEGER NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    dept_no VARCHAR(4)   NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    dept_start_dt DATE   NOT NULL,
    dept_end_dt DATE   NOT NULL,
    PRIMARY KEY (emp_no, dept_no)
);



-- USE THE IMPORT/EXPORT Function in order to load in '../data/dept_emp.csv'

DROP TABLE IF EXISTS dept_manager;

CREATE TABLE dept_manager (
    dept_no VARCHAR(4)   NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    emp_no INTEGER   NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    mgr_start_dt DATE   NOT NULL,
    mgr_end_dt DATE   NOT NULL,
	PRIMARY KEY (emp_no, dept_no)
);

-- USE THE IMPORT/EXPORT Function in order to load in '../data/dept_manager.csv'

DROP TABLE IF EXISTS salaries;

CREATE TABLE salaries (
    emp_no INTEGER   NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    salary INTEGER   NOT NULL,
    salary_start_dt DATE   NOT NULL,
    salary_end_dt DATE   NOT NULL,
	PRIMARY KEY (emp_no, salary_start_dt)
);

-- USE THE IMPORT/EXPORT Function in order to load in '../data/salaries.csv'


DROP TABLE IF EXISTS titles;
CREATE TABLE titles (
    emp_no INTEGER NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    title VARCHAR(20)   NOT NULL,
    title_start_dt DATE   NOT NULL,
    title_end_dt DATE   NOT NULL,
	PRIMARY KEY (emp_no, title_start_dt)
);

select * from titles;
-- USE THE IMPORT/EXPORT Function in order to load in '../data/titles.csv'
select * from dept_manager;