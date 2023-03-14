--������ ������� � PRIMARY KEY
CREATE TABLE dept (
dept_id INTEGER PRIMARY KEY,
dname VARCHAR(20));

-- ���������� PRIMARY KEY �������
-- ALTER TABLE dept
-- ADD PRIMARY KEY (dept_id);

--������ ������� � FOREIGN KEY
CREATE TABLE emp (
emp_id INTEGER,
dept_id INTEGER,
ename VARCHAR(15),
salary NUMERIC(6,2),
FOREIGN KEY(dept_id) REFERENCES dept
);

--���������� FOREIGN KEY �������
ALTER TABLE emp
add FOREIGN KEY (dept_id) REFERENCES dept

-- ������� ������ � �������
INSERT dept VALUES (1, 'Marketing'),(2, 'RD')
INSERT emp VALUES (1, 1, 'James', 1000),(2, 2, 'Smith', 2000)

-- ���������� ������� ������������ ������ �� ������ �������
CREATE TABLE dept_arch (
dept_id INTEGER PRIMARY KEY,
dname VARCHAR(20));

INSERT INTO dept_arch
select dept_id, dname
from dept

select * from dept
select * from dept_arch
select * from emp

-- ���������� ������
UPDATE emp SET salary = salary*1.5 where ename='Smith'
UPDATE dept SET dname = 'RandD' where dname='RD'

-- �������� ������
delete from emp where emp_id = 1
drop table emp