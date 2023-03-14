-- Вычислить переменные: самый дешёвый продукт, производимый бабушкой и дедушкой. Сравнить эти переменные.
-- Вывести строку "Самый дешёвый продукт делает %MAKER_TYPE%", либо сообщение о равенстве цен самых дешёвых продуктов.
declare
      grandfather_price number(5);
      grandmather_price number(5);
      winner VARCHAR2(20);
begin
      select min(PRICE) into grandfather_price from PIES where MAKER_TYPE = 'дедушка';
      select min(PRICE) into grandmather_price from PIES where MAKER_TYPE = 'бабушка';
      if grandfather_price>grandmather_price
      then dbms_output.put_line('Самый дешевый продукт делает ' || grandmather_price);
      elsif grandfather_price<grandmather_price
      then dbms_output.put_line('Самый дешевый продукт делает ' || grandfather_price);
      else dbms_output.put_line('Минимальные продукты у бабушки и дедушки равны');
      end if;
end;

-- Если средняя цена на блины меньше, чем средняя на пирожки, вывести сообщение: «В среднем, блины дешевле пирожков на X руб»,
-- где X – абсолютное значение разницы между средней ценой пирожка и средней ценой блина. Если средняя цена на блины
-- больше или равна средней цены на пирожки, вывести сообщение: «блины стоят не меньше пирожков».
declare
      avg_blin number(5);
      avg_pir number(5);
begin
      select avg(PRICE) into avg_blin from PIES where PRODUCT_NAME = 'блин';
      select avg(PRICE) into avg_pir from PIES where PRODUCT_NAME = 'пирожок';
      if avg_blin<avg_pir then
      dbms_output.put_line('В целом блины дешевле пирожков на '||(avg_pir-avg_blin) ||' руб.');
      else dbms_output.put_line('блины стоят не меньше пирожков');
      end if;
end;
