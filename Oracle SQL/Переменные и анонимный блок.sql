﻿-- Объявление и вывод переменных
--declare
--      mystr varchar(20) := 'Hello World';
--begin
--      mystr := 'Hello World';
--      dbms_output.put_line(mystr);
--end;

-- Объявление и вывод переменных 1
--declare
--      mystr varchar(20);
--begin
--      select 'Hello World!' into mystr from DUAL;
--      dbms_output.put_line(mystr);
--end;

-- Объявление и вывод переменных 2
--declare
--      mystr varchar(20);
--begin
--      mystr := 'Hello World';
--      dbms_output.put_line(mystr);
--end;

-- Использование анонимного блока
--with AVG_PRICE as
--  (select product_name, avg(price) as APP from PIES
--  group by product_name)
--  select * from AVG_PRICE  where APP>70;
-- Это также можно сделать через HAVING
--select product_name, avg(price) from PIES
--group by product_name
--HAVING avg(price)>70;
