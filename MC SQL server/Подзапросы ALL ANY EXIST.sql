select * from person
select * from purchase
select * from product

-- ���������� � ������ ����� �������
select * from person
where hiredate in
(select hiredate from person where first_name = 'john' and last_name = 'Smith')
-- ��� ������ ������ � ��������
select * from product 
where product_price < (select avg(product_price) from product)

-- ��� product_name ������������� ������ 1 ����
SELECT product_name
FROM purchase
GROUP BY product_name
HAVING COUNT(product_name) > 1

-- ����, ����������� �� 15% ��� ���� product_name ������������� ������ 1 ����
SELECT product_name, product_price*1.15 as 'new price'
from product where product_name in (
SELECT product_name
FROM purchase
GROUP BY product_name
HAVING COUNT(product_name) > 1
)
-- ���
SELECT product.product_name, product_price*1.15 as 'new price'
from product 
INNER JOIN purchase on product.product_name = purchase.product_name
GROUP BY product.product_name, product_price*1.15
HAVING COUNT(purchase.product_name) > 1


-- EXIST
select * from person
WHERE EXISTS
(select * from purchase where person_code = salesperson)

select person_code from person
intersect
select salesperson from purchase

-- ALL ��� min(���� �������)
select * from product where product_price < 
(select min (product_price) from product
INNER JOIN purchase on purchase.product_name = product.product_name
where salesperson = 'GA')

-- ANY � SOME ��������������� 
select * from product where product_price < any
(select product_price from product
INNER JOIN purchase on purchase.product_name = product.product_name
where salesperson = 'GA')