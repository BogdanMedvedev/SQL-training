set serveroutput on;

-- Цикл FOR
-- Написать цикл, выводящий последовательно квадраты чисел от 1 до 12 в обратном порядке
begin
  for i in  reverse 1..12 loop
  DBMS_OUTPUT.PUT_LINE(i**2);
  end loop;
end;


-- Цикл WHILE. Написать цикл, увеличивающий цену пирожков на 20% до тех пор, пока средняя цена пирожков не будет
-- равна или превышать среднюю цену на блины. Выполнение цикла прекратиться в случае, если максимальная цена на
-- пирожок превысит максимальную цену на блин
declare
    avg_pir int;
    avg_blin int;
    max_pir int;
    max_blin int;
begin
  select avg(PRICE) into avg_pir from PIES where PRODUCT_NAME = 'пирожок';
  select avg(PRICE) into avg_blin from PIES where PRODUCT_NAME = 'блин';
  select max(PRICE) into max_pir from PIES where PRODUCT_NAME = 'пирожок';
  select max(PRICE) into max_blin from PIES where PRODUCT_NAME = 'блин';
  while avg_pir <= avg_blin loop
    if max_pir > max_blin then exit;
    end if;
    update pies set price = price * 1.2 where product_name = 'пирожок';
    select avg(PRICE) into avg_pir from PIES where PRODUCT_NAME = 'пирожок';
    select max(PRICE) into max_pir from PIES where PRODUCT_NAME = 'пирожок';
  end loop;
end;
