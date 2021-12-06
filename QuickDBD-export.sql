﻿-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE dept_manager (
    dept_no VARCHAR(10)  NOT NULL ,
    emp_no INTEGER  NOT NULL 
);

CREATE TABLE departments (
    dept_no VARCHAR(10)  NOT NULL ,
    dept_name VARCHAR(30)  NOT NULL ,
    PRIMARY KEY (
        dept_no
    )
);

CREATE TABLE employees (
    emp_no INTEGER  NOT NULL ,
    emp_title_id VARCHAR(10)  NOT NULL ,
    birth_date VARCHAR(8)  NOT NULL ,
    first_name VARCHAR(20)  NOT NULL ,
    last_name VARCHAR(20)  NOT NULL ,
    sex VARCHAR(1)  NOT NULL ,
    hire_date VARCHAR(8)  NOT NULL ,
    PRIMARY KEY (
        emp_no
    )
);

CREATE TABLE dept_emp (
    emp_no INTEGER  NOT NULL ,
    dept_no VARCHAR(10)  NOT NULL 
);

CREATE TABLE titles (
    title_id VARCHAR(10)  NOT NULL ,
    title VARCHAR(30)  NOT NULL ,
    PRIMARY KEY (
        title_id
    )
);

CREATE TABLE salaries (
    emp_no INTEGER  NOT NULL ,
    salary INTEGER  NOT NULL 
);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE departments ADD CONSTRAINT fk_departments_dept_no FOREIGN KEY(dept_no)
REFERENCES dept_emp (dept_no);

ALTER TABLE employees ADD CONSTRAINT fk_employees_emp_title_id FOREIGN KEY(emp_title_id)
REFERENCES titles (title_id);

ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE salaries ADD CONSTRAINT fk_salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

