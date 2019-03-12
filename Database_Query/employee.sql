DROP DATABASE IF EXISTS employee_DB2;
CREATE DATABASE IF NOT EXISTS employee_DB2;
USE employee_DB2;

CREATE TABLE employees (
    emp_no      INT             NOT NULL,
    birth_date  DATE            DEFAULT '0000-00-00',
    first_name  VARCHAR(50)     NOT NULL,
    last_name   VARCHAR(30)     NOT NULL,
    gender      ENUM ('M','F')  NOT NULL,    
    hire_date   DATE            NOT NULL,
	email_id   VARCHAR(200)     NOT NULL,
	UNIQUE KEY(email_id),
    PRIMARY KEY (emp_no)
);


CREATE TABLE projects (
    proj_no     CHAR(4)         NOT NULL,
    proj_name   VARCHAR(40)     NOT NULL,
    PRIMARY KEY (proj_no),
    UNIQUE  KEY (proj_name)
);

CREATE TABLE proj_manager (
   emp_no       INT             NOT NULL,
   proj_no      CHAR(4)         NOT NULL,
   from_date    DATE            NOT NULL,
   to_date      DATE            DEFAULT '9999-01-01',
   FOREIGN KEY (emp_no)  REFERENCES employees (emp_no) ,
   FOREIGN KEY (proj_no) REFERENCES projects (proj_no) ,
   PRIMARY KEY (emp_no,proj_no)
); 

CREATE TABLE proj_emp (
    emp_no      INT             NOT NULL,
    proj_no     CHAR(4)         NOT NULL,
    from_date   DATE            NOT NULL,
    to_date     DATE            DEFAULT '9999-01-01',
    FOREIGN KEY (emp_no)  REFERENCES employees   (emp_no) ,
    FOREIGN KEY (proj_no) REFERENCES projects (proj_no),
    PRIMARY KEY (emp_no,proj_no)
);


CREATE TABLE designation (
    emp_no      INT             NOT NULL,
    designation       VARCHAR(50)     NOT NULL,
    from_date   DATE            NOT NULL,
    to_date     DATE DEFAULT '9999-01-01',
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no) ,
    PRIMARY KEY (emp_no,designation, from_date)
) 
; 




CREATE TABLE salaries (
    emp_no      INT             NOT NULL,
    salary      INT             NOT NULL,
    from_date   DATE            NOT NULL,
    to_date     DATE            DEFAULT '9999-01-01',
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no) ,
    PRIMARY KEY (emp_no, from_date)
) 
; 

desc employees;

desc projects;

desc proj_emp;

desc proj_manager;

desc salaries;

desc designation;