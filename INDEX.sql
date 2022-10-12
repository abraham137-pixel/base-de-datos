	-- SHOW databases;		
    CREATE DATABASE dept_emp;
    USE dept_emp;
    -- DROP DATABASE dept_emp;
    CREATE TABLE dept(
deptno NUMERIC(2) PRIMARY KEY,
dname VARCHAR(12) UNIQUE,
loc VARCHAR(11) NOT NULL);
-- DESCRIBE dept;
INSERT INTO dept(deptno, dname,loc) 
VALUES(10,'ACCOUNTING','NEW_YORK');
INSERT INTO dept(deptno, dname,loc) 
VALUES(20,'RESEARCH','DALLAS');
INSERT INTO dept(deptno, dname,loc) 
VALUES(30,'SALES','CHICAGO');
INSERT INTO dept(dname,deptno,loc) 
VALUES('OPERATIONS',40,'BOSTON');
SELECT loc, dname
FROM dept;
CREATE TABLE emp(
empno NUMERIC(4) PRIMARY KEY,
ename VARCHAR(11) NOT NULL,
job VARCHAR(13) NOT NULL,
mgr NUMERIC(4),
hiredate DATE NOT NULL,
sal NUMERIC(7,2) NOT NULL,
comm NUMERIC(7,2),
deptno NUMERIC(2),
-- Restricción en emp_deptno_dept_deptno_fk llave foranea de la tabla dept
CONSTRAINT emp_deptno_detp_deptno_fk FOREIGN KEY (deptno) REFERENCES dept (deptno),
-- Restrcción en emp_mgr_fk llave forania de la tabla emp 
CONSTRAINT emp_mgr_fk FOREIGN KEY (mgr) REFERENCES emp (empno));

-- DESCRIBE emp;

INSERT INTO emp
VALUES(7839, 'KING', 'PRESIDENT', NULL, '2011-11-17', 5000, NULL, 10);
INSERT INTO emp
VALUES(7698, 'BLAKE','MANAGER',7839,'2011-05-01',2850,NULL,30);
INSERT INTO emp
VALUES(7782,'CLARK','MANAGER',7839,'2011-06-09',2450,NULL,10);
INSERT INTO emp
VALUES(7566,'JONES','MANAGER', 7839, '2011-04-02',2975,NULL,20);
INSERT INTO emp
VALUES(7654,'MARTIN','SALESMAN',7698, '2011-09-28',1250,1400,30);
INSERT INTO emp
VALUES(7499,'ALLEN', 'SALESMAN',7698, '2011-02-20',1600,300, 30);
INSERT INTO emp
VALUES(7844,'TURNER','SALESMAN',7698, '2011-09-08',1500,0, 30);
INSERT INTO emp
VALUES(7900,'JAMES', 'CLERK',7698, '2011-12-03',950,NULL,30);
INSERT INTO emp
VALUES(7521,'WARD','SALESMAN',7698, '2011-02-22',1250,500, 30);
INSERT INTO emp
VALUES(7902,'FORD','ANALYST', 7566, '2011-12-03',3000,NULL,20);
INSERT INTO emp
VALUES(7369,'SMITH', 'CLERK',7902, '2010-12-17',800,NULL, 20);
INSERT INTO emp
VALUES(7788,'SCOTT', 'ANALYST', 7566, '2012-12-09',3000,NULL,20);
INSERT INTO emp
VALUES(7876,'ADAMS', 'CLERK', 7788, '2012-01-12',1100,NULL,20);
INSERT INTO emp
VALUES(7934,'MILLER','CLERK',7782, '2012-01-23',1300,NULL,10);

SELECT ename, hiredate, sal FROM emp;
CREATE TABLE salgrade(
    grade NUMERIC(1) PRIMARY KEY,
    losal NUMERIC(6,2) NOT NULL,
    hisal NUMERIC(6,2) NOT NULL
    );
   -- DESCRIBE salgrade;
    INSERT INTO salgrade
VALUES(1,700,1200);
INSERT INTO salgrade
VALUES(2,1201,1400);		
INSERT INTO salgrade
VALUES(3,1401,2000);
INSERT INTO salgrade
VALUES(4,2001,3000);
INSERT INTO salgrade
VALUES(5,3001,9999);
-- select ejecicios
-- ejercicio 1
select count(*) from emp;
-- ejecicio 2
select dept.dname, count(emp.ename)
from dept left join emp
on dept.deptno-emp.deptno
group by dept.deptno;
-- ejercicio 3
select max(sal),min(sal),avg(sal), dept.dname
from  dept  join emp
on dept.deptno= emp.deptno
group by emp.deptno;
-- ejercicio 4
SELECT job as Cargo, min(sal) as salario_min, max(sal) as salario_max,count(empno), avg(sal)
FROM emp
GROUP BY job
HAVING avg(sal) < 1100;
-- ejecicio 5
select  ename , sal
from emp;
-- ejecicio 6
select * from emp;
-- ejecicio 7
select emp.ename as nombre,emp.sal as salario,dept.dname as departamento
from emp join dept
on emp.deptno=dept.deptno;
-- ejercicio 8
select * 
from emp
where job="analyst";
-- ejercicio 9
select *
from emp
where deptno=(select deptno
from dept
where dname ="sales");
-- ejecicio 10
select ename, sal
from emp
where sal=(
     select max(sal) from emp where deptno=(
            select deptno
from dept
where dname="acoointg"));
-- trigers

-- ejercicios de departanento 1
    CREATE TABLE reg_dept_i(
    fecha datetime,
    usuaio varchar(50),
deptno NUMERIC(2) PRIMARY KEY,
dname VARCHAR(12) UNIQUE,
loc VARCHAR(11));

create trigger dept_registro_AI after insert on dept 
for each row 
insert into reg_dept_i
values(
current_timestamp(),
current_user(),
new.deptno,
new.dname,
new.loc);

-- ejecicio2
 CREATE TABLE reg_dept_u(
    fecha datetime,
    usuaio varchar(50),
deptno NUMERIC(2) PRIMARY KEY,
dname VARCHAR(12) UNIQUE,
loc VARCHAR(11),
deptno_old NUMERIC(2) PRIMARY KEY,
dname_old VARCHAR(12) UNIQUE,
loc_old VARCHAR(11));


create trigger dept_registro_bu before update on dept 
for each row 
insert into reg_dept_u
values(
current_timestamp(),
current_user(),
new.deptno,
new.dname,
new.loc,
old.deptno,
old.dname,
old.loc);