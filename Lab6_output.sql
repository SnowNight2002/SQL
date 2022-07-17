
--Database Principles Lab 6

SET linesize 140

set pagesize 50

--Task 2
select O.ename, O.job ,O.sal,pl.dname from Emp O,Dept PL
WHERE O.deptno = PL.deptno;

--Task 3
select O.ename, O.job ,O.sal,pl.dname from Emp O,Dept PL
WHERE O.deptno = PL.deptno
order by pl.dname desc,O.job asc,O.ename asc;
 

--Task 4

select O.deptno,count(O.empno) as employees from Emp O,Dept PL
WHERE O.deptno = PL.deptno
GROUP BY O.deptno;


--Task 5
select PL.dname,O.deptno,count(O.empno) as employees from Emp O,Dept PL
WHERE O.deptno = PL.deptno
GROUP BY PL.dname,O.deptno;


--Task 6

select O.empno,O.ename, O.sal,SA.grade from Emp O,Salgrade SA
WHERE O.sal between SA.losal and SA.hisal;

--Task 7
select O.ename,DE.dname,O.job,DE.loc,O.sal,SA.grade from Emp O,Salgrade SA,Dept DE
WHERE O.sal between SA.losal and SA.hisal
AND DE.loc != 'NEW YORK'
AND O.deptno = DE.deptno;

--Task 8
select O.ename,DE.dname,O.job,DE.loc,O.sal,SA.grade from Emp O,Salgrade SA,Dept DE
WHERE O.sal between SA.losal and SA.hisal
AND O.mgr IS NULL
AND O.deptno = DE.deptno;

--Task 9
select supervisor.empno as "Supervisor",supervisor.ename as "Name",
subordinte.empno as "Subordinte",subordinte.ename as "Name"
from Emp supervisor,Emp subordinte
WHERE supervisor.empno = subordinte.mgr
order by supervisor.empno asc;

--Task 10
select a.empno as "empno",a.ename as "ename",a.sal as "sal",
b.empno as "empno",b.ename as "ename",b.sal as "sal"
from Emp a,Emp b
WHERE a.sal = b.sal
and a.empno < b.empno
order by a.sal asc;

--Task 11
DROP INDEX ename_idx; 

CREATE INDEX ename_idx ON EMP(ename); 

--Task 12
DROP VIEW v_emp; 
CREATE VIEW v_emp  AS 
SELECT ename,job,sal FROM emp;

--Task 13
GRANT SELECT
ON v_emp
TO tn201a28;

--Task 14
select * from tn201a28.v_emp;

--Task 15
	
REVOKE SELECT
ON v_emp
FROM tn201a28;


spool off
set echo off



