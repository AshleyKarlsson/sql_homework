--List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT "Employees".emp_no, 
	"Employees".last_name, 
	"Employees".first_name, 
	"Employees".gender, 
	"Salaries".salary
FROM "Employees" INNER JOIN "Salaries" ON "Employees".emp_no = "Salaries".emp_no;

--List employees who were hired in 1986.
SELECT * from "Employees" WHERE hire_date like '1986%'

--List the manager of each department with the following information:department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT "Department_Manager".dept_no,
	"Departments".dept_name,
	"Department_Manager".emp_no, 
	"Employees".last_name, 
	"Employees".first_name, 
	"Department_Manager".from_date,
	"Department_Manager".to_date
FROM "Department_Manager" INNER JOIN "Employees" ON "Department_Manager".emp_no = "Employees".emp_no
INNER JOIN "Departments" ON "Department_Manager".dept_no = "Departments".dept_no

--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT "Department_Employees".emp_no,
	"Employees".last_name, 
	"Employees".first_name, 
	"Departments".dept_name
FROM "Department_Employees" INNER JOIN "Employees" ON "Department_Employees".emp_no = "Employees".emp_no
INNER JOIN "Departments" ON "Department_Employees".dept_no = "Departments".dept_no

--List all employees whose first name is "Hercules" and last names begin with "B."
SELECT * from "Employees" WHERE first_name like 'Hercules' AND last_name like 'B%'

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT "Department_Employees".emp_no,
	"Employees".last_name, 
	"Employees".first_name, 
	"Departments".dept_name
FROM "Department_Employees" INNER JOIN "Employees" ON "Department_Employees".emp_no = "Employees".emp_no
INNER JOIN "Departments" ON "Department_Employees".dept_no = "Departments".dept_no
WHERE "Departments".dept_name like 'Sales' 

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT "Department_Employees".emp_no,
	"Employees".last_name, 
	"Employees".first_name, 
	"Departments".dept_name
FROM "Department_Employees" INNER JOIN "Employees" ON "Department_Employees".emp_no = "Employees".emp_no
INNER JOIN "Departments" ON "Department_Employees".dept_no = "Departments".dept_no
WHERE ("Departments".dept_name like 'Sales' OR "Departments".dept_name like 'Development')

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT "Employees".last_name, Count("Employees".last_name) AS "last_name_count"
FROM "Employees"
GROUP BY "Employees".last_name
ORDER BY "last_name_count" DESC;