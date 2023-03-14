-- ������ ������������� CASE
select PRODUCT_NAME, PRICE, 
case
when price<411 then '����� ����������'
when price>411 then '�� ����� ����������'
else '�������'
end
as ���_����� from Pies;

-- ���������� � ������� ���� �� �����
select product_name, filling, price, 
  case
    when product_name = '�������' and filling = '��������' 
      then (select price from pies where product_name = '����' and filling = '��������')
    when product_name = '�������' and filling = '������' 
      then (select price from pies where product_name = '����' and filling = '������')
    when product_name = '�������' and filling = '�������' 
      then (select price from pies where product_name = '����' and filling = '�������')
    when product_name = '����' 
      then price
  end as new_price
from pies;
-- ��� ����� ������� �����
select one.product_name, one.filling, two.price
from pies one
         inner join pies two on two.filling = one.filling and two.product_name ='����';


-- ����������� � ��������� ��������� ���������, ��������� ���� update � ���������� case
update PIES set PRICE =
case 
when PRODUCT_NAME = '�������' then PRICE * 1.33
else PRICE * 0.77
end;

select * from PIES;

