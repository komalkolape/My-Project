-- PROJECT OF SQL –
-- DEPARTMENTS AND EMPLOYEE  INFORMATION-

use komal;

-- create table Departments ( deptno int primary key,  dname varchar(14),  loc varchar(13));
insert into Departments values (10, 'accounting', 'new york'),(20, 'research', 'dallas'),(30, 'sales', 'chicago'), (40, 'operations', 'boston');
select * from Departments;

-- create table employeer (empno int not null,  ename varchar (10),  job varchar(15),  mgr int ,  hiredate date,  sal bigint,  comm bigint,  deptno int);

insert into employeer values (7369, 'smith', 'clerk', 7902, '1980-12-17',  3300, null, 20),(7499, 'allen', 'salesman', 7698, '1981-02-20', 1600, 300, 30), (7521, 'ward', 'salesman', 7698, '1981-02-22', 1250, 500, 30),  (7566, 'jones', 'manager', 7839, '1981-04-02', 3273, null, 20), (7654, 'martin', 'salesman', 7698,'1981-07-28', 1250, 1400, 30), (7698, 'blake', 'manager', 7839,'1981-05-01', 3135, null, 30), (7782, 'clark', 'manager', 7839, '1981-06-09', 2695, null, 10),(7788, 'scott', 'analyst', 7566, '1982-12-09', 3300, null, 20),  (7839, 'king', 'president', null, '1981-11-17', 5500, null, 10), (7844, 'turner', 'salesman', 7698, '1981-07-08', 1650, 0, 30),  (7876, 'adams', 'clerk', 7788, '1983-01-12',  1210, null, 20), (7900, 'james', 'clerk', 7698, '1981-12-13', 1045, null, 30), (7902, 'ford', 'analyst', 7566,'1981-12-03', 3300, null, 20),  (7934, 'miller', 'clerk', 7782, '1982-01-23', 14300, null, 10);
update employeer set sal = 3300 where ename= 'smith';

-- create table salgrade(grade int, losal int, hisal bigint);
insert into salgrade values(1, 700, 1200), (2, 1201,1400), (3, 1401,2000), (4, 2001,3000), (5, 3001,9999);

-- Questions -
-- 1. Display the dept information from department table
 select * from Departments;

-- 2. Display the details of all employees
select * from employeer;

-- 3. Display the name and job for all employees
select ename, job from employeer;
 
-- 4. Display name and salary for all employees
 select ename, sal from employeer;

-- 5. Display employee number and total salary for each employee
select empno, sal as total_sal from employeer; 

-- 6. Display employee name and annual salary for all employees
 select ename,12 * sal as annual_sal from employeer;
 
-- 7. Display the names of all employees who are working in department number 10
select ename from employeer where deptno=10;
 
-- 8. Display the names of all employees working as clerk and drawing a salary more than 3000
select ename from employeer where job='clerk' and sal>3000;
 
-- 9.  Display employee number and names for employees who earn commission
select empno, ename, comm from employeer where comm is not null;
 
-- 10. Display names of employees who do not earn any commission
 select empno, ename, comm from employeer where comm is null or comm=0;
 
-- 11. Display the names of employees who are working as clerk , salesman or analyst and drawing a salary more than 3000
 select ename from employeer where job in ('clerk', 'analyst', 'salesman') and sal>3000;
 
-- 12. Display the list of employees who have joined the company before 30th june 81 or after 31 st dec 81
select * from employeer where hiredate between '1981-06-30' and '1981-12-31';
 
-- 13. Display current date
select curdate();
 
-- 14. Display the list of users in your database (using log table)
SELECT user();

-- 15. Display the names of all tables from the current user
 show tables from komal;

-- 16. Display the name of the current user
select current_user();

-- 17. Display the names of employees working in department number 10 or 20 or 40 or em employees working as clerks , salesman or analyst
select ename from employeer where job in ('clerk', 'analyst', 'salesman') or  deptno in (10,20,40);
 
-- 18. Display the names of employees whose name starts with alphabet S
select ename from employeer where ename like 'S%' ;
 
-- 19. Display employee name from employees whose name ends with alphabet S
select ename from employeer where ename like '%S' ;

-- 20. Display the names of employees whose names have second alphabet A in their names
 select ename from employeer where ename like '_a%' or ename like '_A%';
 
-- 21.Display the names of employees whose name is exactly five characters in length
 select ename from employeer where length(ename)=5;
 
-- 22.Display the names of employees who are not working as managers
 select ename from employeer where job<>'manager';
 
-- 23.Display the names of employees who are not working as SALESMAN or CLERK or ANALYST
select ename from employeer where job not in ('clerk', 'analyst', 'salesman');
 
-- 24.Display all rows from employee table.
select * from employeer;
 
-- 25.Display the total number of employees working in the company
select count(empno) as employee_count from employeer;
 
-- 26.Display the total salary and total commission to all employees.
select sum(sal) as totalsal,sum(comm) as totalcomm from employeer;
 
-- 27.Display the maximum salary from emp table
select max(sal) from employeer;
 
-- 28.Display the minimum salary from emp table
select min(sal) from employeer;
 
-- 29.Display the average salary from emp table
select avg(sal) from employeer;
 
-- 30.Display the maximum salary being paid to CLERK.
select max(sal) from employeer where job='clerk';
 
-- 31.Display the maximum salary being paid in dept no 20
select max(sal) from employeer where deptno=20;
 
-- 32.Display the minimum salary being paid to any SALESMAN
select min(sal) from employeer where job='SALESMAN';

-- 33.Display the average salary drawn by managers
select avg(sal) from employeer where job='MANAGER';

-- 34.Display the total salary drawn by analyst working in dept no 20
select SUM(sal) from employeer where job='ANALYST' and deptno=20;
 
-- 35.Display the names of employees in order of salary i.e. the name of the employee earning highest should appear first
select ename from employeer order by sal desc;
 
-- 36.Display the names of employees in ascending  order of salary lowest salary shoud appear first
select ename, sal from employeer order by sal asc;
 
-- 37.Display the details from emp table in order of emp name
select * from employeer order by ename;
 
-- 38.Display empnno,ename,deptno and sal. Sort the output first based on name and within name by deptno and witdhin deptno by sal;
 select empno, ename, deptno, sal from employeer order by ename, deptno, sal;
 
-- 39) Display the name of employees along with their annual salary(sal*12). the name of the employee earning highest annual salary should appear first?
select ename, sal*12 as annualsal from employeer order by annualsal desc;
 
-- 40) Display name,salary,Hra,pf,da,TotalSalary for each employee. The out put should be in the order of total salary ,hra 15% of salary ,DA 10% of salary .pf 5% salary Total Salary will be (salary+hra+da)-pf?
select ename, sal, 0.15*sal as hra, 0.10*sal as da,0.05*sal as pf,(sal + 0.15*sal + 0.10*sal - 0.05*sal) as totalsal from employeer;
 
-- 41) Display Department numbers and total number of employees working in each Department?
select deptno, count(empno) from employeer group by deptno;
 
-- 42) Display the various jobs and total number of employees working in each job group?
select job, count(empno) from employeer group by job;
 
-- 43)Display department numbers and Total Salary for each Department?
select deptno, sum(sal) from employeer group by deptno;
 
-- 44)Display department numbers and Maximum Salary from each Department?
select deptno, max(sal) from employeer group by deptno;
 
-- 45)Display various jobs and Total Salary for each job?
select job, sum(sal) as totalsal from employeer group by job;
 
-- 46)Display each job along with min of salary being paid in each job group?
select job, min(sal) from employeer group by job;
 
-- 47) Display the department Number with more than three employees in each department?
select deptno from employeer group by deptno having count(empno) >3;
 
-- 48) Display various jobs along with total salary for each of the job where total salary is greater than 40000?
select job, sum(sal) as totalsal from employeer group by job having sum(sal)>4000;
 
-- 49) Display the various jobs along with total number of employees in each job.The output should contain only those jobs with more than three employees?
 select job, count(empno) as employees from employeer group by job having count(empno) >3;
 
 -- 50) Display the name of employees who earn Highest Salary?
SELECT ENAME FROM EMPLOYEER WHERE SAL=(SELECT MAX(SAL) FROM EMPLOYEER);
 
-- 51) Display the employee Number and name for employee working as clerk and earning highest salary among the clerks?
SELECT EMPNO, ENAME FROM EMPLOYEER WHERE JOB='CLERK' AND SAL=(SELECT MAX(SAL) FROM EMPLOYEER WHERE JOB='CLERK');
 
-- 52) Display the names of clerk who earns a salary more than the Highest Salary of the salesman?
SELECT ENAME FROM EMPLOYEER WHERE JOB='CLERK' AND SAL>(SELECT MAX(SAL) FROM EMPLOYEER WHERE JOB='SALESMAN');
 
-- 53) Display the names of clerks who earn a salary more than the lowest Salary of any salesman?
SELECT ENAME FROM EMPLOYEER WHERE JOB='CLERK' AND SAL>(SELECT MIN(SAL) FROM EMPLOYEER WHERE JOB='SALESMAN');
 
-- 54) Display the names of employees who earn a salary more than that of jones or greater than that of scott?
 SELECT ENAME FROM EMPLOYEER WHERE SAL>(SELECT SAL FROM EMPLOYEER WHERE ENAME='JONES') AND SAL>(SELECT SAL FROM EMPLOYEER WHERE ENAME='SCOTT');
 
-- 55) Display the names of employees who earn Highest salary in their respective departments?
SELECT ENAME, DEPTNO FROM EMPLOYEER WHERE SAL IN (SELECT MAX(SAL) FROM EMPLOYEER GROUP BY DEPTNO);
 
-- 56) Display the names of employees who earn Highest salaries in their respective job Groups?
SELECT ENAME, JOB FROM EMPLOYEER WHERE SAL IN (SELECT MAX(SAL) FROM EMPLOYEER GROUP BY JOB);
 
-- 57) Display employee names who are working in Accounting department?
SELECT ENAME FROM EMPLOYEER, DEPARTMENTS WHERE EMPLOYEER . DEPTNO= DEPARTMENTS . DEPTNO AND DNAME='ACCOUNTING';
 
-- 58) Display the employee names who are Working in Chicago?
SELECT ENAME FROM EMPLOYEER, DEPARTMENTS WHERE EMPLOYEER.DEPTNO=DEPARTMENTS.DEPTNO AND DEPARTMENTS.LOC='CHICAGO';

-- 59) Display the job groups having Total Salary greater than the maximum salary for Managers?
 SELECT JOB FROM EMPLOYEER GROUP BY JOB HAVING SUM(SAL)>(SELECT MAX(SAL) FROM EMPLOYEER WHERE JOB='MANAGER');
 
-- 60) Display the names of employees from department number 10 with salary greater than that of ANY employee working in other departments?
select ename from employeer where deptno=10 and sal>any (select sal from employeer where deptno != 10);
 
-- 61) Display the names of employees from department number 10 with salary greater than    of   ALL employee working in other departments ?
select ename from employeer where deptno=10 and sal>all (select sal from employeer where deptno != 10);

-- 62) Display the names of employees in Upper Case?
 SELECT UPPER(ENAME) FROM EMPLOYEER;
 
-- 63) Display the names of employees in Lower Case?
SELECT LOWER(ENAME) FROM EMPLOYEER;

-- 64) Find the length of your name using Appropriate Function?
 SELECT LENGTH('KOMAL') FROM DUAL;

-- 65) Display the length of all the employee names?
SELECT ENAME, LENGTH(ENAME) FROM EMPLOYEER;

-- 66) Display the name of employee Concatenated with Employee Number?
SELECT CONCAT(ENAME,EMPNO) FROM EMPLOYEER;
 
-- 67) Use appropriate function and extract 3 characters starting from 2 characters from the following string ‘Oracle’ i.e., the output should be ac?
SELECT SUBSTR('ORACLE',2,3) FROM DUAL;
 
-- 68) Replace every occurrence of alphabet A with B in the string Aliens (Use Translate function)?
SELECT REPLACE('Aliens','A','B') FROM DUAL;

 -- 69) Display empno, ename, deptno from emp table. Instead of display department numbers display the related department name (Use decode function)?
SELECT EMPNO, ENAME, DNAME FROM EMPLOYEER , DEPARTMENTS WHERE EMPLOYEER.DEPTNO = DEPARTMENTS.DEPTNO;
 
-- 70) Display your Age in Days?
select datediff('2022-08-26','1997-11-20 ') as Age_in_days;
 
-- 71) Display the common jobs from department number 10 and 20?
 SELECT JOB FROM EMPLOYEER WHERE DEPTNO=10 AND JOB IN (SELECT JOB FROM EMPLOYEER WHERE DEPTNO=20);

-- 72) Display the jobs which are unique to department 10?
SELECT JOB FROM EMPLOYEER WHERE DEPTNO=10 AND JOB NOT IN(SELECT JOB FROM EMPLOYEER WHERE DEPTNO!=10);
 
-- 73) Display the details of those employees who do not have any person working under him?
 SELECT * FROM EMPLOYEER WHERE EMPNO NOT IN (SELECT MGR FROM EMPLOYEER WHERE MGR IS NOT NULL);
 
 -- 74) Display the details of those employees who are in sales department and grade is 3?
SELECT * FROM EMPLOYEER WHERE SAL BETWEEN (SELECT LOSAL FROM SALGRADE WHERE GRADE =3) AND (SELECT HISAL FROM SALGRADE WHERE GRADE =3) AND DEPTNO = (SELECT DEPTNO FROM DEPARTMENTS WHERE DNAME='SALES');
 
-- 75) Display those who are not managers?
 SELECT * FROM EMPLOYEER  WHERE JOB <> 'MANAGER';
 

-- 76) Display those employees whose name contains not less than 4 characters?
SELECT * FROM EMPLOYEER WHERE LENGTH(ENAME)>4;
 
-- 77) Display those departments whose name starts with “S” while location name ends with “K”?
SELECT * FROM DEPARTMENTS WHERE DNAME LIKE 'S%' AND LOC LIKE '%O';
 
-- 78) Display those employees whose manager name is Jones?
 SELECT * FROM EMPLOYEER WHERE JOB ='MANAGER' AND ENAME='JONES';
 
-- 79) Display those employees whose salary is more than 3000 after giving 20% increment?
 SELECT * FROM EMPLOYEER WHERE SAL*120/100 > 3000;
 
-- 80) Display all employees with their department names?
SELECT ENAME, DNAME FROM EMPLOYEER, DEPARTMENTS WHERE EMPLOYEER.DEPTNO = DEPARTMENTS.DEPTNO;
 
-- 81) Display ename who are working in sales department?
SELECT ENAME FROM EMPLOYEER WHERE DEPTNO = (SELECT DEPTNO FROM DEPARTMENTS WHERE DNAME='SALES');

-- 82) Display employee name, dept name, salary and commission for those with sal in between 2000 to 5000 while location is Chicago?
 SELECT ENAME, DNAME, SAL, COMM FROM EMPLOYEER, DEPARTMENTS WHERE EMPLOYEER.DEPTNO=DEPARTMENTS.DEPTNO AND DEPARTMENTS.LOC='CHICAGO' AND EMPLOYEER.SAL BETWEEN 2000 AND 5000;
 
-- 83) Display those employees who are not working under any Manager?
 SELECT * FROM EMP WHERE MGR IS NULL;
 
-- 84) Update the salary of each employee by 10% increment who are not eligible for commission?
 UPDATE EMPLOYEER SET SAL=(SAL+0.10*SAL) WHERE COMM IS NULL OR COMM=0;

-- 85)Count the no of employees working as manager (using set operation)
SELECT COUNT(JOB) FROM EMPLOYEER GROUP BY JOB HAVING JOB='MANAGER';

-- 86) Display those employees who are working as manager?
SELECT ENAME FROM EMPLOYEER WHERE JOB='MANAGER';
 
-- 87) Display the grade of jones?
SELECT S.GRADE,E.ENAME FROM EMPLOYEER E,SALGRADE S WHERE E.ENAME = 'JONES' AND E.SAL BETWEEN S.LOSAL AND S.HISAL;
 
-- 88) Display those employees who are working in sales or research?
SELECT E.ENAME FROM EMPLOYEER E WHERE E.DEPTNO IN (SELECT D.DEPTNO FROM DEPARTMENTS D WHERE D.DNAME IN ('SALES','RESEARCH'));
 
-- 89) Display those employees whose name contains A?
SELECT * FROM EMPLOYEER WHERE ENAME LIKE '%A%';

 -- 90)Display those employees whose salary contains atleast 3 digits?
SELECT * FROM EMPLOYEER WHERE LENGTH(SAL)>=3;
 
 -- 91)Display those employees whose salary is odd value?
SELECT * FROM EMPLOYEER WHERE MOD(SAL,2)!=0;

update employeer set job='accounting' where empno=7369;

-- 92) Find the employee who are allocated with the departments. 
select e.ename, d.dname from employeer e inner join departments d on e.deptno=d.deptno ;

-- 93)Find the employee who are allocated with the departments and whose dname and job are the same.
select e.ename, e.job, d.dname from employeer e inner join departments d on  e.job=d.dname;

--  94) Find employeer who are allocated with a departments and whose sal are greater than 2965.
select e.ename, d.dname, e.sal from employeer e inner join departments d on e.deptno=d.deptno and e.sal>2965;
 
--  95) Create a view named deptview which contains deptno, dname, loc of those employees who are working in a department.
create view deptview as select t1.deptno, t1.dname, t1.loc, t2.ename, t2.sal from departments as t1 inner join employeer as t2 on t1.deptno = t2.deptno;
select * from deptview;
 
--  96) Write a query to find the maximum and minimum salary from the deptview.
select max(sal) as maximum_salary, min(sal) as minimum_salary from deptview;

--  97) Write a query to find the name of the employees whose salary ranges between 20000 and 40000 (including 2000 and 4000)
select ename, sal from deptview where sal>=2000 and sal <= 4000;

--  98) find the name of the employee taking maximum salary from deptview.
select ename from deptview order by sal desc limit 1;
 
-- 99)find the name of the employee taking second largest salary.
select ename as second_largest_salaried_employee from deptview order by sal desc limit 1 offset 1;

-- 100)display the above 5 records usind asc order
select * from deptview order by dname limit 5;
 



