--test tables
select * from tbl_departments limit(100);
select * from tbl_dept_employee limit(100);
select * from tbl_dept_manager limit(100);
select * from tbl_employees limit(100);
select * from tbl_salaries limit(100);
select * from tbl_titles limit(100);



--  DATA ANALYSIS SECTION #1 List the followind details of each employee, employee number, employee name, geder, salary

select tbl_employees.emp_no, 
	concat(tbl_employees.first_name,' ', tbl_employees.last_name) as name,
	tbl_employees.gender, 
	tbl_salaries.salary
	from tbl_employees
	join tbl_salaries on tbl_employees.emp_no = tbl_salaries.emp_no
	order by tbl_salaries.salary desc;

--  DATA ANALYSIS sECTION #2 LIST EMPLYEES WHO WERE HIRED IN 1986

select distinct tbl_employees.emp_no, 
	concat(tbl_employees.first_name,' ', tbl_employees.last_name) AS Name,
	tbl_employees.gender, 
	tbl_employees.hire_date, 
	tbl_salaries.salary
	from tbl_employees
	join tbl_salaries on tbl_employees.emp_no = tbl_salaries.emp_no
	where date_part('year', tbl_employees.hire_date) = 1986
	order by name;
		
--  DATA ANALYSIS sECTION #3 List the manager of each department with the 
--  following information: department number, department name, the manager's employee number, 
--	last name, first name, and start and end employment dates.

SELECT tbl_dept_manager.dept_no, tbl_departments.dept_name, 
		concat(tbl_employees.first_name, ' ',tbl_employees.last_name) as Employee, 
		tbl_employees.hire_date, 
		tbl_dept_manager.from_date, 
		tbl_dept_manager.to_date
FROM tbl_employees 
INNER JOIN (tbl_departments 
		   INNER JOIN tbl_dept_manager 
			ON tbl_departments.dept_no = tbl_dept_manager.dept_no) 
			ON tbl_employees.emp_no = tbl_dept_manager.emp_no
order by tbl_departments.dept_name;

-- DATA ANALYSIS sECTION #4 List the department of each employee with the following information: employee number, last name, first name, and department name.


SELECT tbl_employees.emp_no, 
	concat(tbl_employees.first_name,' ', tbl_employees.last_name) as "Empoyee Name", 
	tbl_departments.dept_name
	FROM (tbl_employees 
		  INNER JOIN tbl_dept_employee ON tbl_employees.emp_no = tbl_dept_employee.emp_no) 
		  INNER JOIN tbl_departments ON tbl_dept_employee.dept_no = tbl_departments.dept_no
ORDER BY tbl_departments.dept_name;

-- DATA ANALYSIS sECTION #5 List all employees whose first name is "Hercules" and last names begin with "B."

(select concat(tbl_employees.first_name,' ', tbl_employees.last_name) as "Employee Name"
from tbl_employees
where tbl_employees.first_name = 'Hercules' and tbl_employees.last_name like 'B%');

-- DATA ANALYSIS sECTION #6 List all employees in the Sales department, including their employee number, last name, first name, and department name.

(SELECT tbl_employees.emp_no, 
	concat(tbl_employees.first_name,' ', tbl_employees.last_name) as "Empoyee Name", 
	tbl_departments.dept_name
	FROM (tbl_employees 
		  INNER JOIN tbl_dept_employee ON tbl_employees.emp_no = tbl_dept_employee.emp_no) 
		  INNER JOIN tbl_departments ON tbl_dept_employee.dept_no = tbl_departments.dept_no
where tbl_departments.dept_name = 'Sales'
ORDER BY tbl_employees.first_name);

-- DATA ANALYSIS sECTION #7 List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.

SELECT tbl_employees.emp_no,
	concat(tbl_employees.first_name,' ', tbl_employees.last_name) as "Empoyee Name",
	tbl_departments.dept_name
	FROM tbl_employees 
		  INNER JOIN tbl_dept_employee ON tbl_employees.emp_no = tbl_dept_employee.emp_no 
		  INNER JOIN tbl_departments ON tbl_dept_employee.dept_no = tbl_departments.dept_no
where tbl_departments.dept_name = 'Sales' or tbl_departments.dept_name = 'Development'
ORDER BY tbl_departments.dept_name desc, tbl_employees.first_name;

-- DATA ANALYSIS sECTION #8 In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

select tbl_employees.last_name, 
		count(tbl_employees.last_name) as "Share Last Name"
			 from tbl_employees
			 group by tbl_employees.last_name
			 order by tbl_employees.last_name desc;
			 
			 
-- bounus Section Create data table for Python and graphing
--create table ave_salaries as
	SELECT tbl_titles.title, Avg(tbl_salaries.salary) AS AvgOfsalary
	FROM tbl_salaries 
	INNER JOIN tbl_titles ON tbl_salaries.emp_no = tbl_titles.emp_no
	GROUP BY tbl_titles.title;

