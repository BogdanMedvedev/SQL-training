-- Увеличивае на 15% цену
select product_price, product_price*1.5 as '+15%' from product

-- Сколько строк в таблице (без учёта null)
select count(*) from product

-- Среднее арифметическое
select avg(product_price) as 'среднее' from product


-- Для какого количества товара не указана цена
select COUNT (product_name) from product
where product_price is null
-- или
select count(*) - count(product_price) from product

-- MIN и MAX
select min(product_price) as 'min', max(product_price) as 'max' from product

-- Какая сумма была выручена с продаж товаров каждого наименования.
select pr.product_name, product_price * sum(quantity) from product as pr
inner join purchase as pu on pr.product_name = pu.product_name
GROUP BY pr.product_name, pr.product_price


-- Какая сумма была выручена с продаж товаров каждого наименования. Сумма > 125
select pr.product_name, product_price * sum(quantity) from product as pr
inner join purchase as pu on pr.product_name = pu.product_name
GROUP BY pr.product_name, pr.product_price
HAVING product_price * sum(quantity) > 125
