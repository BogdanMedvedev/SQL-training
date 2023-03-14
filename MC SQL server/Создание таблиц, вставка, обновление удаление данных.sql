--Создаём таблицу с PRIMARY KEY
CREATE TABLE dept (
dept_id INTEGER PRIMARY KEY,
dname VARCHAR(20));

-- Добавление PRIMARY KEY вручную
-- ALTER TABLE dept
-- ADD PRIMARY KEY (dept_id);

--Создаём таблицу с FOREIGN KEY
CREATE TABLE emp (
emp_id INTEGER,
dept_id INTEGER,
ename VARCHAR(15),
salary NUMERIC(6,2),
FOREIGN KEY(dept_id) REFERENCES dept
);

--Добавление FOREIGN KEY вручную
ALTER TABLE emp
add FOREIGN KEY (dept_id) REFERENCES dept

-- Вставка данных в таблицу
INSERT dept VALUES (1, 'Marketing'),(2, 'RD')
INSERT emp VALUES (1, 1, 'James', 1000),(2, 2, 'Smith', 2000)

-- Наполнение таблицы аналогичными данным из другой таблицы
CREATE TABLE dept_arch (
dept_id INTEGER PRIMARY KEY,
dname VARCHAR(20));

INSERT INTO dept_arch
select dept_id, dname
from dept

select * from dept
select * from dept_arch
select * from emp

-- Обновление данных
UPDATE emp SET salary = salary*1.5 where ename='Smith'
UPDATE dept SET dname = 'RandD' where dname='RD'

-- Удаление данных
delete from emp where emp_id = 1
drop table emp