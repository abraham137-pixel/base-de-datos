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
where sal=(select max(sal) 
from emp
where deptno=(select deptno
from dept
where dname="acoointg"));



