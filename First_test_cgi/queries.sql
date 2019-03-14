/* Display salary history of an employee*/

select e.emp_no,e.first_name,e.last_name,e.gender,e.email_id,s.salary,s.from_date,s.to_date 
from employees e join salaries s on s.emp_no=e.emp_no 
where e.emp_no=10088;
queries.sql
/* Display salary under a designation */

select d.emp_no,d.designation,s.salary from designation d join salaries s on s.emp_no=d.emp_no where d.designation="SE-Software Engineering Analyst";

/* Display designation history of an employee */

select e.emp_no,e.first_name,e.email_id,d.from_date,d.to_date,d.designation from employees e , designation d on e.emp_no=d.emp_no where e.emp_no=10004;

/* Display salary with designation of an employee*/

select e.emp_no,e.first_name,e.email_id,s.salary,pe.from_date,pe.to_date,d.designation
from employees e join  designation d on e.emp_no=d.emp_no and e.emp_no=10004
join salaries s on s.from_date between d.from_date and d.to_date
where s.emp_no=10004;

/*Display salary with designation and project of an employee */

select e.emp_no,e.first_name,e.email_id,s.salary,pe.from_date,pe.to_date,d.designation,p.proj_name
from employees e join proj_emp pe on pe.emp_no=e.emp_no
join designation d on e.emp_no=d.emp_no and d.from_date between pe.from_date and pe.to_date and e.emp_no=10088
join salaries s on s.from_date between pe.from_date and pe.to_date
join projects p on p.proj_no=pe.proj_no
where s.emp_no=10088;

/*Display Salary of emp with designation grouped and his current salary */

SELECT e.emp_no,e.first_name,e.email_id,max(s.salary) as 'current Salary',pe.from_date,pe.to_date,d.designation
FROM employees e JOIN designation d on e.emp_no=d.emp_no and e.emp_no=10004
JOIN salaries s on s.from_date between d.from_date and d.to_date
WHERE s.emp_no=10004 GROUP BY d.designation;
		 
		 
/* Salary of emp with proj name designation  grouped and his current salary*/

select e.emp_no,e.first_name,e.email_id,s.salary,pe.from_date,pe.to_date,d.designation,p.proj_name
from employees e join proj_emp pe on pe.emp_no=e.emp_no
join designation d on e.emp_no=d.emp_no and d.from_date between pe.from_date and pe.to_date and e.emp_no=10088
join salaries s on s.from_date between pe.from_date and pe.to_date
join projects p on p.proj_no=pe.proj_no
where s.emp_no=10088 GROUP BY d.designation;


