salary history:
SELECT e.emp_no as 'Employee Num',e.first_name as 'First Name' ,e.last_name as 'Last Name' ,e.gender as 'Gender' ,e.email_id as 'Mail ID',s.salary as 'Salary' ,s.FROM_date as 'From Date' ,s.to_date as 'To Date' FROM employees e JOIN salaries s on s.emp_no=e.emp_no WHERE e.emp_no=E_NO;

designation history:
SELECT e.emp_no as 'Employee Num' ,e.first_name as 'First Name' ,e.last_name as 'Last Name' ,e.gender as 'Gender' ,e.email_id as 'Mail ID',d.FROM_date as 'From Date' ,d.to_date as 'To Date' ,d.designation as 'Designation' FROM employees e JOIN designation d on e.emp_no=d.emp_no WHERE e.emp_no=E_NO;

project history:
SELECT e.emp_no as 'Employee Num' ,e.first_name as 'First Name' ,e.last_name as 'Last Name' ,e.gender as 'Gender' ,e.email_id as 'Mail ID',p.proj_no as 'Project No' ,p.proj_name as 'Project Name',pe.FROM_date as 'From Date' , pe.to_date as 'To Date'  FROM employees e JOIN proj_emp pe on pe.emp_no=e.emp_no JOIN projects p on p.proj_no=pe.proj_no WHERE e.emp_no=E_NO;

salary designation history:
SELECT e.emp_no as 'Employee Num' ,e.first_name as 'First Name' ,e.last_name as 'Last Name' ,e.gender as 'Gender' ,e.email_id as 'Mail ID',s.salary,d.FROM_date as 'From Date' ,d.to_date as 'To Date' ,d.designation as 'Designation'  FROM employees e JOIN  designation d on e.emp_no=d.emp_no and e.emp_no=E_NO JOIN salaries s on s.FROM_date between d.FROM_date and d.to_date WHERE s.emp_no=E_NO;


salary designation project history:
SELECT e.emp_no as 'Employee Num' ,e.first_name as 'First Name' ,e.last_name as 'Last Name' ,e.gender as 'Gender' ,e.email_id as 'Mail ID',s.salary as 'Salary' ,pe.FROM_date as 'From Date' ,pe.to_date as 'To Date' ,d.designation as 'Designation' ,p.proj_name as 'Project Name' FROM employees e JOIN proj_emp pe on pe.emp_no=e.emp_no JOIN designation d on e.emp_no=d.emp_no and d.FROM_date between pe.FROM_date and pe.to_date and e.emp_no=E_NO JOIN salaries s on s.FROM_date between pe.FROM_date and pe.to_date JOIN projects p on p.proj_no=pe.proj_no WHERE s.emp_no=E_NO;


current salary history:
SELECT e.emp_no as 'Employee Num' ,e.first_name as 'First Name' ,e.last_name as 'Last Name' ,e.gender as 'Gender' ,e.email_id as 'Mail ID',s.salary as 'Current Salary',s.FROM_date as 'From Date' ,s.to_date  as 'To Date' FROM employees e JOIN salaries s on e.emp_no=s.emp_no WHERE e.emp_no=E_NO order by s.salary desc LIMIT 1;


current salary designation history:
SELECT e.emp_no as 'Employee Num' ,e.first_name as 'First Name' ,e.last_name as 'Last Name' ,e.gender as 'Gender' ,e.email_id as 'Mail ID',s.salary as 'Current Salary',s.FROM_date as 'From Date' ,s.to_date as 'To Date' ,d.designation as 'Designation' FROM employees e JOIN salaries s on e.emp_no=s.emp_no JOIN designation d on d.FROM_date between s.FROM_date and s.to_date WHERE e.emp_no=E_NO order by s.salary desc LIMIT 1;


current salary designation project history:
SELECT e.emp_no as 'Employee Num' ,e.first_name as 'First Name' ,e.last_name as 'Last Name' ,e.gender as 'Gender' ,e.email_id as 'Mail ID',s.salary as 'Current Salary',s.FROM_date as 'From Date' ,s.to_date as 'To Date' ,d.designation as 'Designation' ,p.proj_name as 'Project Name' FROM employees e JOIN proj_emp pe on pe.emp_no=e.emp_no JOIN salaries s on e.emp_no=s.emp_no JOIN designation d on d.FROM_date between s.FROM_date and s.to_date JOIN projects p on p.proj_no=pe.proj_no and pe.from_date between s.FROM_date and s.to_date WHERE e.emp_no=E_NO order by s.salary desc LIMIT 1;

miles to go:
select e.emp_no as 'Employee Num',e.first_name as 'First Name',e.last_name as 'Last Name ',e.email_id as 'Mail ID',year('2002-12-31')-year(hire_date) as 'Years of Experience' from employees e where year(e.resignation_date)=9999 and year('2002-12-31')-year(hire_date)>10;

employees joined each year:
SELECT count(emp_no) as 'No. of employees hired',year(hire_date) as 'Hired year' FROM employee_db1.employees group by year(hire_date) ;

employees resigned each year:
SELECT count(emp_no) as 'No. of employees Resigned',year(hire_date) as 'Resigned year' FROM employee_db1.employees where year(resignation_date)!=9999 group by year(resignation_date) ;

employees count designation project:
select p.proj_name as 'Project Name',d.designation as 'Designation',count(e.emp_no) as 'No. of Employees' from employees e join designation d on e.emp_no=d.emp_no join proj_emp pe on pe.emp_no=e.emp_no join projects p on p.proj_no=pe.proj_no group by pe.proj_no, d.designation;


employees designation period:
select emp_no as 'Employee Num',designation as 'Designation',timestampdiff(month,from_date,to_date) as 'Month difference' from designation where to_date not like '9999-%-%' group by emp_no order by emp_no;

manager supervising many projects:
select CONCAT_WS(" ", e.first_name, e.last_name) as 'Manager Name',No_of_projects from (select emp_no as Employee_Number,count(proj_no) as No_of_projects from proj_manager group by emp_no having No_of_projects> 1)as t join employees e on e.emp_no=t.Employee_Number;

lateral entry:
select distinct emp_no as 'Employee Num',designation as 'Designation' from designation where designation!='ASE-Associate Software Engineer';



