
--Database Principles Lab 5

SET linesize 140

set pagesize 50
--Task 2
SELECT COUNT(*) AS empno
FROM Emp;

--Task 3

SELECT COUNT(*) AS dname
FROM Dept;


--Task 4

SELECT MIN(sal) AS sal
FROM Emp;

--Task 5

SELECT COUNT(DISTINCT job) AS job
FROM Emp;

--Task 6
SELECT COUNT(*) AS job
FROM Emp
WHERE job = 'CLERK';


--Task 7
SELECT job
FROM Emp
GROUP BY job 
ORDER BY job ASC;


--Task 8
SELECT avg(sal) AS sal,mgr
FROM Emp
GROUP BY mgr;

--Task 9
SELECT MIN(sal) AS sal,job
FROM Emp
GROUP BY job
ORDER BY sal DESC;

--Task 10
SELECT avg(sal) AS sal,job
FROM Emp
GROUP BY job;
--Task 11
SELECT avg(sal) AS sal,job
FROM Emp
where sal>=3000
GROUP BY job;

--Task 12
SELECT  deptno, avg(sal)  AS sal FROM Emp
GROUP BY deptno
ORDER BY deptno ASC;


--Task 13
SELECT  deptno, COUNT(deptno)  AS count, avg(sal)  AS sal FROM Emp
GROUP BY deptno
ORDER BY deptno ASC;

--Task 14
SELECT  deptno, COUNT(deptno)  AS count, avg(sal)  AS sal
FROM emp
WHERE job = 'CLERK'
GROUP BY deptno
ORDER BY deptno ASC;






spool off
set echo off

