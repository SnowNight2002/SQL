

SET linesize 140

set pagesize 50

DROP TABLE Emp CASCADE CONSTRAINTS;
CREATE TABLE Emp (
        empno    NUMBER(4),
        ename    VARCHAR2(10),
        job      VARCHAR2(9),
        mgr      NUMBER(4),
        hiredate DATE,
        sal      NUMBER(7,2),
        comm     NUMBER(7,2),
        deptno   NUMBER(2),
	CONSTRAINT empno_pk PRIMARY KEY (empno)
);

INSERT INTO Emp VALUES
        (7369,'SMITH','CLERK',7902,'17-DEC-80',800,NULL,20);
INSERT INTO Emp VALUES
        (7499,'ALLEN','SALESMAN',7698,'20-FEB-81',1600,300,30);
INSERT INTO Emp VALUES
        (7521,'WARD','SALESMAN',7698,'22-FEB-81',1250,500,30);
INSERT INTO Emp VALUES
        (7566,'JONES','MANAGER',7839,'2-APR-81',2975,NULL,20);
INSERT INTO Emp VALUES
        (7654,'MARTIN','SALESMAN',7698,'28-SEP-81',1250,1400,30);
INSERT INTO Emp VALUES
        (7698,'BLAKE','MANAGER',7839,'1-MAY-81',2850,NULL,30);
INSERT INTO Emp VALUES
        (7782,'CLARK','MANAGER',7839,'9-JUN-81',2450,NULL,10);
INSERT INTO Emp VALUES
        (7788,'SCOTT','ANALYST',7566,'19-APR-87',3000,NULL,20);
INSERT INTO Emp VALUES
        (7839,'KING','PRESIDENT',NULL,'17-NOV-81',5000,NULL,10);
INSERT INTO Emp VALUES
        (7844,'TURNER','SALESMAN',7698,'8-SEP-81',1500,0,30);
INSERT INTO Emp VALUES
        (7876,'ADAMS','CLERK',7788,'23-MAY-87',1100,NULL,20);
INSERT INTO Emp VALUES
        (7900,'JAMES','CLERK',7698,'3-DEC-81',950,NULL,30);
INSERT INTO Emp VALUES
        (7902,'FORD','ANALYST',7566,'3-DEC-81',3000,NULL,20);
INSERT INTO Emp VALUES
        (7934,'MILLER','CLERK',7782,'23-JAN-82',1300,NULL,10);



DROP TABLE Dept CASCADE CONSTRAINTS;
CREATE TABLE Dept (
   deptno   NUMBER(2),
   dname    VARCHAR2(10),
   loc      VARCHAR2(8),
   CONSTRAINT deptno_pk PRIMARY KEY (deptno)
);

INSERT INTO Dept VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO Dept VALUES (20, 'RESEARCH', 'DALLAS');
INSERT INTO Dept VALUES (30, 'SALES', 'CHICAGO');
INSERT INTO Dept VALUES (40, 'OPERATIONS', 'BOSTON');



DROP TABLE Salgrade CASCADE CONSTRAINTS;
CREATE TABLE Salgrade (
  grade NUMBER(1),
  losal NUMBER(4),
  hisal NUMBER(4),
  CONSTRAINT grade_pk PRIMARY KEY (grade)
);
 
INSERT INTO Salgrade VALUES (1, 700, 1200);
INSERT INTO Salgrade VALUES (2, 1201, 1400);
INSERT INTO Salgrade VALUES (3, 1401, 2000);
INSERT INTO Salgrade VALUES (4, 2001, 3000);
INSERT INTO Salgrade VALUES (5, 3001, 9999);


COMMIT;
--Task 2

select* from Dept;

--Task 3
select* from Emp;

--Task 4
select* from Salgrade;

--Task 5
select empno,sal,deptno from Emp WHERE sal between 1000 and 2000;


--Task 6

SELECT DISTINCT job FROM Emp;


--Task 7
select * from Emp WHERE deptno = '10' OR deptno = '20';

--Task 8

select ename,job,deptno from Emp WHERE job = 'CLERK' and deptno = '20';

--Task 9
select * from Emp WHERE ename LIKE '%AR%' OR ename LIKE '%ES%';


--Task 10
select ename,hiredate from Emp WHERE hiredate LIKE '%%-%%-87';

--Task 11

select ename,hiredate from Emp WHERE hiredate NOT LIKE '%%-%%-87';

--Task 12
select ename,hiredate from Emp WHERE hiredate LIKE '01-MAY-%%';

--Task 13
select ename from Emp WHERE MGR IS NULL;

--Task 14
SELECT EMPNO,MGR
FROM Emp
ORDER BY MGR ASC , EMPNO DESC;






spool off
set echo off