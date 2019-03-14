mysql> show tables;
+------------------------+
| Tables_in_employee_db1 |
+------------------------+
| designation            |
| employees              |
| proj_emp               |
| proj_manager           |
| projects               |
| salaries               |
+------------------------+
6 rows in set (0.00 sec)

mysql> desc employees;
+------------+---------------+------+-----+------------+-------+
| Field      | Type          | Null | Key | Default    | Extra |
+------------+---------------+------+-----+------------+-------+
| emp_no     | int(11)       | NO   | PRI | NULL       |       |
| birth_date | date          | YES  |     | 0000-00-00 |       |
| first_name | varchar(50)   | NO   |     | NULL       |       |
| last_name  | varchar(30)   | NO   |     | NULL       |       |
| gender     | enum('M','F') | NO   |     | NULL       |       |
| hire_date  | date          | NO   |     | NULL       |       |
| email_id   | varchar(200)  | NO   | UNI | NULL       |       |
+------------+---------------+------+-----+------------+-------+
7 rows in set (0.00 sec)

mysql> desc projects;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| proj_no   | char(4)     | NO   | PRI | NULL    |       |
| proj_name | varchar(40) | NO   | UNI | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql> desc designation;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| emp_no      | int(11)     | NO   | PRI | NULL    |       |
| designation | varchar(50) | NO   | PRI | NULL    |       |
| from_date   | date        | NO   | PRI | NULL    |       |
| to_date     | date        | YES  |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> desc  proj_emp;
+-----------+---------+------+-----+---------+-------+
| Field     | Type    | Null | Key | Default | Extra |
+-----------+---------+------+-----+---------+-------+
| emp_no    | int(11) | NO   | PRI | NULL    |       |
| proj_no   | char(4) | NO   | PRI | NULL    |       |
| from_date | date    | NO   |     | NULL    |       |
| to_date   | date    | NO   |     | NULL    |       |
+-----------+---------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> desc  proj_manager;
+-----------+---------+------+-----+---------+-------+
| Field     | Type    | Null | Key | Default | Extra |
+-----------+---------+------+-----+---------+-------+
| emp_no    | int(11) | NO   | PRI | NULL    |       |
| proj_no   | char(4) | NO   | PRI | NULL    |       |
| from_date | date    | NO   |     | NULL    |       |
| to_date   | date    | NO   |     | NULL    |       |
+-----------+---------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> desc salaries;
+-----------+---------+------+-----+---------+-------+
| Field     | Type    | Null | Key | Default | Extra |
+-----------+---------+------+-----+---------+-------+
| emp_no    | int(11) | NO   | PRI | NULL    |       |
| salary    | int(11) | NO   |     | NULL    |       |
| from_date | date    | NO   | PRI | NULL    |       |
| to_date   | date    | NO   |     | NULL    |       |
+-----------+---------+------+-----+---------+-------+
4 rows in set (0.00 sec)





/*GET SALARIES OF AN EMPLOYEE WITH HIS DESIGNATION BASED ON YEAR*/


select e.emp_no,e.first_name,e.email_id,s.salary,d.designation from employees e , salaries s on e.emp_no=s.emp_no right , designation d on s.emp_no=d.emp_no where s.emp_no=10004 ;


 select e.emp_no,e.first_name,e.email_id,d.from_date,d.to_date,d.designation from employees e , designation d on e.emp_no=d.emp_no where e.emp_no=10004;
+--------+------------+--------------------------------+------------+------------+-----------------------------------+
| emp_no | first_name | email_id                       | from_date  | to_date    | designation                       |
+--------+------------+--------------------------------+------------+------------+-----------------------------------+
|  10004 | Chirstian  | chirstian.a10004@accenture.com | 1986-12-01 | 1995-12-01 | SSE- Senior Software Engineer     |
|  10004 | Chirstian  | chirstian.a10004@accenture.com | 1995-12-01 | 9999-01-01 | TL-Software Engineering Team Lead |
+--------+------------+--------------------------------+------------+------------+-----------------------------------+


select e.emp_no,e.first_name,e.email_id,s.salary,s.from_date,s.to_date
from employees e join salaries s on e.emp_no=s.emp_no
where s.emp_no=10004;
+--------+------------+--------------------------------+--------+------------+------------+
| emp_no | first_name | email_id                       | salary | from_date  | to_date    |
+--------+------------+--------------------------------+--------+------------+------------+
|  10004 | Chirstian  | chirstian.a10004@accenture.com |  40054 | 1986-12-01 | 1987-12-01 |
|  10004 | Chirstian  | chirstian.a10004@accenture.com |  42283 | 1987-12-01 | 1988-11-30 |
|  10004 | Chirstian  | chirstian.a10004@accenture.com |  42542 | 1988-11-30 | 1989-11-30 |
|  10004 | Chirstian  | chirstian.a10004@accenture.com |  46065 | 1989-11-30 | 1990-11-30 |
|  10004 | Chirstian  | chirstian.a10004@accenture.com |  48271 | 1990-11-30 | 1991-11-30 |
|  10004 | Chirstian  | chirstian.a10004@accenture.com |  50594 | 1991-11-30 | 1992-11-29 |
|  10004 | Chirstian  | chirstian.a10004@accenture.com |  52119 | 1992-11-29 | 1993-11-29 |
|  10004 | Chirstian  | chirstian.a10004@accenture.com |  54693 | 1993-11-29 | 1994-11-29 |
|  10004 | Chirstian  | chirstian.a10004@accenture.com |  58326 | 1994-11-29 | 1995-11-29 |
|  10004 | Chirstian  | chirstian.a10004@accenture.com |  60770 | 1995-11-29 | 1996-11-28 |
|  10004 | Chirstian  | chirstian.a10004@accenture.com |  62566 | 1996-11-28 | 1997-11-28 |
|  10004 | Chirstian  | chirstian.a10004@accenture.com |  64340 | 1997-11-28 | 1998-11-28 |
|  10004 | Chirstian  | chirstian.a10004@accenture.com |  67096 | 1998-11-28 | 1999-11-28 |
|  10004 | Chirstian  | chirstian.a10004@accenture.com |  69722 | 1999-11-28 | 2000-11-27 |
|  10004 | Chirstian  | chirstian.a10004@accenture.com |  70698 | 2000-11-27 | 2001-11-27 |
|  10004 | Chirstian  | chirstian.a10004@accenture.com |  74057 | 2001-11-27 | 9999-01-01 |
+--------+------------+--------------------------------+--------+------------+------------+



/*salary of an emp with designatgion */


select e.emp_no,e.first_name,e.email_id,s.salary,s.from_date,s.to_date,d.designation
from employees e join  designation d on e.emp_no=d.emp_no and e.emp_no=10004
join salaries s on s.from_date between d.from_date and d.to_date
where s.emp_no=10004;


		 
		 +--------+------------+--------------------------------+--------+------------+------------+-----------------------------------+
| emp_no | first_name | email_id                       | salary | from_date  | to_date    | designation                       |
+--------+------------+--------------------------------+--------+------------+------------+-----------------------------------+
|  10004 | Chirstian  | chirstian.a10004@accenture.com |  40054 | 1986-12-01 | 1987-12-01 | SSE- Senior Software Engineer     |
|  10004 | Chirstian  | chirstian.a10004@accenture.com |  42283 | 1987-12-01 | 1988-11-30 | SSE- Senior Software Engineer     |
|  10004 | Chirstian  | chirstian.a10004@accenture.com |  42542 | 1988-11-30 | 1989-11-30 | SSE- Senior Software Engineer     |
|  10004 | Chirstian  | chirstian.a10004@accenture.com |  46065 | 1989-11-30 | 1990-11-30 | SSE- Senior Software Engineer     |
|  10004 | Chirstian  | chirstian.a10004@accenture.com |  48271 | 1990-11-30 | 1991-11-30 | SSE- Senior Software Engineer     |
|  10004 | Chirstian  | chirstian.a10004@accenture.com |  50594 | 1991-11-30 | 1992-11-29 | SSE- Senior Software Engineer     |
|  10004 | Chirstian  | chirstian.a10004@accenture.com |  52119 | 1992-11-29 | 1993-11-29 | SSE- Senior Software Engineer     |
|  10004 | Chirstian  | chirstian.a10004@accenture.com |  54693 | 1993-11-29 | 1994-11-29 | SSE- Senior Software Engineer     |
|  10004 | Chirstian  | chirstian.a10004@accenture.com |  58326 | 1994-11-29 | 1995-11-29 | SSE- Senior Software Engineer     |
|  10004 | Chirstian  | chirstian.a10004@accenture.com |  60770 | 1995-11-29 | 1996-11-28 | SSE- Senior Software Engineer     |
|  10004 | Chirstian  | chirstian.a10004@accenture.com |  62566 | 1996-11-28 | 1997-11-28 | TL-Software Engineering Team Lead |
|  10004 | Chirstian  | chirstian.a10004@accenture.com |  64340 | 1997-11-28 | 1998-11-28 | TL-Software Engineering Team Lead |
|  10004 | Chirstian  | chirstian.a10004@accenture.com |  67096 | 1998-11-28 | 1999-11-28 | TL-Software Engineering Team Lead |
|  10004 | Chirstian  | chirstian.a10004@accenture.com |  69722 | 1999-11-28 | 2000-11-27 | TL-Software Engineering Team Lead |
|  10004 | Chirstian  | chirstian.a10004@accenture.com |  70698 | 2000-11-27 | 2001-11-27 | TL-Software Engineering Team Lead |
|  10004 | Chirstian  | chirstian.a10004@accenture.com |  74057 | 2001-11-27 | 9999-01-01 | TL-Software Engineering Team Lead |
+--------+------------+--------------------------------+--------+------------+------------+-----------------------------------+


/* salary of an emp with designatgion and projects*/

select e.emp_no,e.first_name,e.email_id,s.salary,pe.from_date,pe.to_date,d.designation,p.proj_name
from employees e join proj_emp pe on pe.emp_no=e.emp_no
join designation d on e.emp_no=d.emp_no and d.from_date between pe.from_date and pe.to_date and e.emp_no=10088
join salaries s on s.from_date between pe.from_date and pe.to_date
join projects p on p.proj_no=pe.proj_no
where s.emp_no=10088;

+--------+------------+-------------------------------+--------+------------+------------+---------------------------------+-----------+
| emp_no | first_name | email_id                      | salary | from_date  | to_date    | designation                     | proj_name |
+--------+------------+-------------------------------+--------+------------+------------+---------------------------------+-----------+
|  10088 | Jungsoon   | jungsoon.a10088@accenture.com |  65957 | 1988-09-02 | 1992-03-21 | ASE-Associate Software Engineer | SANOFY    |
|  10088 | Jungsoon   | jungsoon.a10088@accenture.com |  67837 | 1988-09-02 | 1992-03-21 | ASE-Associate Software Engineer | SANOFY    |
|  10088 | Jungsoon   | jungsoon.a10088@accenture.com |  70774 | 1988-09-02 | 1992-03-21 | ASE-Associate Software Engineer | SANOFY    |
|  10088 | Jungsoon   | jungsoon.a10088@accenture.com |  70709 | 1988-09-02 | 1992-03-21 | ASE-Associate Software Engineer | SANOFY    |
|  10088 | Jungsoon   | jungsoon.a10088@accenture.com |  73858 | 1992-03-21 | 9999-01-01 | SE-Software Engineering Analyst | TELSTRA   |
|  10088 | Jungsoon   | jungsoon.a10088@accenture.com |  78302 | 1992-03-21 | 9999-01-01 | SE-Software Engineering Analyst | TELSTRA   |
|  10088 | Jungsoon   | jungsoon.a10088@accenture.com |  79993 | 1992-03-21 | 9999-01-01 | SE-Software Engineering Analyst | TELSTRA   |
|  10088 | Jungsoon   | jungsoon.a10088@accenture.com |  79519 | 1992-03-21 | 9999-01-01 | SE-Software Engineering Analyst | TELSTRA   |
|  10088 | Jungsoon   | jungsoon.a10088@accenture.com |  83755 | 1992-03-21 | 9999-01-01 | SE-Software Engineering Analyst | TELSTRA   |
|  10088 | Jungsoon   | jungsoon.a10088@accenture.com |  84024 | 1992-03-21 | 9999-01-01 | SE-Software Engineering Analyst | TELSTRA   |
|  10088 | Jungsoon   | jungsoon.a10088@accenture.com |  87639 | 1992-03-21 | 9999-01-01 | SE-Software Engineering Analyst | TELSTRA   |
|  10088 | Jungsoon   | jungsoon.a10088@accenture.com |  91296 | 1992-03-21 | 9999-01-01 | SE-Software Engineering Analyst | TELSTRA   |
|  10088 | Jungsoon   | jungsoon.a10088@accenture.com |  95451 | 1992-03-21 | 9999-01-01 | SE-Software Engineering Analyst | TELSTRA   |
|  10088 | Jungsoon   | jungsoon.a10088@accenture.com |  98003 | 1992-03-21 | 9999-01-01 | SE-Software Engineering Analyst | TELSTRA   |
+--------+------------+-------------------------------+--------+------------+------------+---------------------------------+-----------+



select s.salary from salaries s where s.emp_no=10004 limit (1,2);
SELECT salary-( select s.salary from salaries s where s.emp_no=10004 limit 1 offset 1) as amt from salaries limit 4;
	 

/*Salary of emp with designation grouped and his current salary  */

SELECT e.emp_no,e.first_name,e.email_id,max(s.salary) as 'current Salary',s.from_date,s.to_date,d.designation
FROM employees e JOIN designation d on e.emp_no=d.emp_no and e.emp_no=10004
JOIN salaries s on s.from_date between d.from_date and d.to_date 
WHERE s.emp_no=10004 GROUP BY d.designation;
		 
		 

+--------+------------+--------------------------------+----------------+------------+------------+-----------------------------------+
| emp_no | first_name | email_id                       | current Salary | from_date  | to_date    | designation                       |
+--------+------------+--------------------------------+----------------+------------+------------+-----------------------------------+
|  10004 | Chirstian  | chirstian.a10004@accenture.com |          60770 | 1986-12-01 | 1987-12-01 | SSE- Senior Software Engineer     |
|  10004 | Chirstian  | chirstian.a10004@accenture.com |          74057 | 1996-11-28 | 1997-11-28 | TL-Software Engineering Team Lead |
+--------+------------+--------------------------------+----------------+------------+------------+-----------------------------------+



/* Salary of emp with proj name designation  grouped and his current salary*/

SELECT e.emp_no,e.first_name,e.email_id,max(s.salary) as 'current Salary',s.from_date,s.to_date,d.designation,p.proj_name
FROM employees e JOIN designation d on e.emp_no=d.emp_no and e.emp_no=10004
JOIN salaries s on s.from_date between d.from_date and d.to_date 
JOIN proj_emp pe on e.emp_no=pe.emp_no 
JOIN projects p on pe.proj_no=p.proj_no
WHERE s.emp_no=10004 GROUP BY d.designation;

+--------+------------+--------------------------------+----------------+------------+------------+-----------------------------------+-----------+
| emp_no | first_name | email_id                       | current Salary | from_date  | to_date    | designation                       | proj_name |
+--------+------------+--------------------------------+----------------+------------+------------+-----------------------------------+-----------+
|  10004 | Chirstian  | chirstian.a10004@accenture.com |          60770 | 1986-12-01 | 1987-12-01 | SSE- Senior Software Engineer     | BOFA      |
|  10004 | Chirstian  | chirstian.a10004@accenture.com |          74057 | 1996-11-28 | 1997-11-28 | TL-Software Engineering Team Lead | BOFA      |
+--------+------------+--------------------------------+----------------+------------+------------+-----------------------------------+-----------+



SELECT e.emp_no,e.first_name,e.email_id,max(s.salary) as 'current Salary',s.from_date,s.to_date,d.designation
FROM employees e JOIN designation d on e.emp_no=d.emp_no and e.emp_no=10088
JOIN salaries s on s.from_date between d.from_date and d.to_date 
WHERE s.emp_no=10088 GROUP BY d.designation;


select e.emp_no,e.first_name,e.email_id,s.salary,s.from_date,s.to_date,d.designation,p.proj_name
from employees e join  designation d on e.emp_no=d.emp_no and e.emp_no=10088
join salaries s on s.from_date between d.from_date and d.to_date
JOIN proj_emp pe on pe.from_date 
JOIN projects p on pe.proj_no=p.proj_no
WHERE s.emp_no=10088 limit 50;


SELECT e.emp_no,e.first_name,e.email_id,max(s.salary) as 'current Salary',s.from_date,s.to_date,d.designation
FROM employees e JOIN designation d on e.emp_no=d.emp_no and e.emp_no=10008
JOIN salaries s on s.from_date between d.from_date and d.to_date 
WHERE s.emp_no=10008 GROUP BY d.designation limit 50;

