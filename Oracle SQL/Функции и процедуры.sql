-- Создать функцию для деления числа на 2
create or REPLACE FUNCTION TheNumbers (mynum in number)
  return number is
  begin 
  return mynum/2;
  end TheNumbers;
-- Проверка функции
select TheNumbers(22) from dual; 
-- Удаление функции
drop function TheNumbers;


-- Создать произвольную таблицу и написать процедуру для её удаления
-- Создаём таблицу
create table employees ( 
        customer_id number(10) NOT NULL,
        customer_name varchar2(50) NOT NULL,
        city varchar2(50)
        );
insert into employees values (1, 'Иван Иванов', 'Москва');
insert into employees values (2, 'Мария Иванова', 'Санкт-Петербург');
insert into employees values (3, 'Акакий Петров', 'Нижний Новгород');
-- Проверяем таблицу
select * from EMPLOYEES
-- Создаем процедуру для удаления произвольной таблицы
create or replace procedure delete_table (table_name in varchar2)
  is
    begin
       execute immediate 'drop table ' || table_name;
    end;
-- Запускаем процедуру 
begin 
  delete_table('employees');
  dbms_output.put_line('Таблица успешно удалена');
end;
-- Удаляем процедуру
drop procedure delete_table; --удаление процедуры


-- Создать функцию, которая будет инвертировать введённый текст длинной до 128 символов.
create or replace function REVERSE_TEXTT(ps in varchar2)
  return varchar2
  is
  text varchar2(128 char);
    begin
     for i in reverse 1..LENGTH(ps) loop
      text := text||SUBSTR(ps, i, 1);
    end loop;
    return text;
    end;
-- Проверяем функцию
select REVERSE_TEXTT('Привет! Я инвертированный текст')
  from DUAL;        
-- Удаялем функцию
drop function REVERSE_TEXTT; --удаление функции
