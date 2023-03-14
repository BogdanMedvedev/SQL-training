-- Пример использования CASE
select PRODUCT_NAME, PRICE, 
case
when price<411 then 'Готов приобрести'
when price>411 then 'Не готов приобрести'
else 'Подумаю'
end
as Мой_выбор from Pies;

-- Подставить в пирожки цену на блины
select product_name, filling, price, 
  case
    when product_name = 'пирожок' and filling = 'клубника' 
      then (select price from pies where product_name = 'блин' and filling = 'клубника')
    when product_name = 'пирожок' and filling = 'малина' 
      then (select price from pies where product_name = 'блин' and filling = 'малина')
    when product_name = 'пирожок' and filling = 'черника' 
      then (select price from pies where product_name = 'блин' and filling = 'черника')
    when product_name = 'блин' 
      then price
  end as new_price
from pies;
-- или можно сделать легче
select one.product_name, one.filling, two.price
from pies one
         inner join pies two on two.filling = one.filling and two.product_name ='блин';


-- Увеличиваем и уменьшаем стоимость продуктов, использую один update и кострукцию case
update PIES set PRICE =
case 
when PRODUCT_NAME = 'пирожок' then PRICE * 1.33
else PRICE * 0.77
end;

select * from PIES;

