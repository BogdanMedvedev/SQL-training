-- ���������� �� 15% ����
select product_price, product_price*1.5 as '+15%' from product

-- ������� ����� � ������� (��� ����� null)
select count(*) from product

-- ������� ��������������
select avg(product_price) as '�������' from product


-- ��� ������ ���������� ������ �� ������� ����
select COUNT (product_name) from product
where product_price is null
-- ���
select count(*) - count(product_price) from product

-- MIN � MAX
select min(product_price) as 'min', max(product_price) as 'max' from product

-- ����� ����� ���� �������� � ������ ������� ������� ������������.
select pr.product_name, product_price * sum(quantity) from product as pr
inner join purchase as pu on pr.product_name = pu.product_name
GROUP BY pr.product_name, pr.product_price


-- ����� ����� ���� �������� � ������ ������� ������� ������������. ����� > 125
select pr.product_name, product_price * sum(quantity) from product as pr
inner join purchase as pu on pr.product_name = pu.product_name
GROUP BY pr.product_name, pr.product_price
HAVING product_price * sum(quantity) > 125
