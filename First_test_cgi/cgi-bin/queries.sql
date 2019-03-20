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


/*no of employees joined each year */

SELECT count(emp_no) as 'No. of employees hired',year(hire_date) as 'Hired year' FROM employee_db1.employees group by year(hire_date) ; 

/*no of employees Resigned each year */

SELECT count(emp_no) as 'No. of employees Resigned',year(hire_date) as 'Resigned year' FROM employee_db1.employees where year(resignation_date)!=9999 group by year(resignation_date) ;

/* number of employees for each role in each project */

select p.proj_name as 'Project Name',d.designation as 'Designation',count(e.emp_no) as 'No. of Employees' from employees e join designation d on e.emp_no=d.emp_no join proj_emp pe on pe.emp_no=e.emp_no join projects p on p.proj_no=pe.proj_no group by pe.proj_no, d.designation;
 
/*Miles ago 10yrs */

select e.emp_no as 'Employee Number',e.first_name as 'First Name',e.last_name as 'Last Name ',e.email_id as 'Mail ID',year('2002-12-31')-year(hire_date) as 'Years of Experience' from employees e where year(e.resignation_date)=9999 and year('2002-12-31')-year(hire_date)>10;

select count(*) from (select e.emp_no as 'Employee Number',e.first_name as 'First Name',e.last_name as 'Last Name ',e.email_id as 'Mail ID',year('2002-12-31')-year(hire_date) as 'Years of Experience' from employees e where year(e.resignation_date)=9999 and year('2002-12-31')-year(hire_date)>10) as temp;

/*Employee who is having highest salary in each department*/

select s.emp_no as 'Employee Num',max(s.salary) as 'Max Salary' from salaries s join proj_emp e on s.emp_no=e.emp_no join proj_manager m on s.emp_no=m.emp_no group by e.proj_no,m.proj_no;

/*manager supervising many projects:*/

select emp_no as 'Employee Num',count(proj_no) as 'No. of Projects' from proj_manager group by emp_no having 'No. of Projects'>1; 


/*employees count designation project:*/
select p.proj_name as 'Project Name',d.designation as 'Designation',count(e.emp_no) as 'No. of Employees' from employees e join designation d on e.emp_no=d.emp_no join proj_emp pe on pe.emp_no=e.emp_no join projects p on p.proj_no=pe.proj_no group by pe.proj_no, d.designation;

/*employees highest salary project:*/
select s.emp_no as 'Employee Num',max(s.salary) as 'Max Salary' from salaries s join proj_emp e on s.emp_no=e.emp_no join proj_manager m on s.emp_no=m.emp_no group by e.proj_no,m.proj_no;

/*employees designation period:*/
select emp_no as 'Employee Num',designation as 'Designation',timestampdiff(month,from_date,to_date) as 'Month difference' from designation where to_date not like '9999-%-%' group by emp_no;

/*manager supervising many projects:*/
select emp_no as 'Employee Num',count(proj_no) as 'No. of Projects' from proj_manager group by emp_no having 'No. of Projects'>1;

/*lateral entry:*/
select distinct emp_no as 'Employee Num',designation as 'Designation' from designation where designation!='ASE-Associate Software Engineer';

