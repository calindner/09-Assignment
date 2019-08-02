-- Create Tables

create table tbl_departments (
	dept_no varchar primary key,
	dept_name VARCHAR(30));
	
create table tbl_dept_employee (
	emp_no varchar,
	dept_no VARCHAR,
	from_date date,
	to_date date);

create table tbl_dept_manager (
	dept_no varchar,
	emp_no VARCHAR,
	from_date date,
	to_date date);
	
create table tbl_employees (
	emp_no varchar primary key,
	birth_date date,
	first_name varchar(30),
	last_name varchar(30),
	gender varchar(2),
	hire_date date);
	
create table tbl_salaries (
	emp_no varchar,
	salary int,
	from_date date,
	to_date date);

create table tbl_titles (
	emp_no varchar,
	title varchar(30),
	from_date date,
	to_date date);

