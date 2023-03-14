set serveroutput on;

-- ���� FOR
-- �������� ����, ��������� ��������������� �������� ����� �� 1 �� 12 � �������� �������
begin
  for i in  reverse 1..12 loop
  DBMS_OUTPUT.PUT_LINE(i**2);
  end loop;
end;


-- ���� WHILE. �������� ����, ������������� ���� �������� �� 20% �� ��� ���, ���� ������� ���� �������� �� �����
-- ����� ��� ��������� ������� ���� �� �����. ���������� ����� ������������ � ������, ���� ������������ ���� ��
-- ������� �������� ������������ ���� �� ����
declare
    avg_pir int;
    avg_blin int;
    max_pir int;
    max_blin int;
begin
  select avg(PRICE) into avg_pir from PIES where PRODUCT_NAME = '�������';
  select avg(PRICE) into avg_blin from PIES where PRODUCT_NAME = '����';
  select max(PRICE) into max_pir from PIES where PRODUCT_NAME = '�������';
  select max(PRICE) into max_blin from PIES where PRODUCT_NAME = '����';
  while avg_pir <= avg_blin loop
    if max_pir > max_blin then exit;
    end if;
    update pies set price = price * 1.2 where product_name = '�������';
    select avg(PRICE) into avg_pir from PIES where PRODUCT_NAME = '�������';
    select max(PRICE) into max_pir from PIES where PRODUCT_NAME = '�������';
  end loop;
end;
