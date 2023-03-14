-- ��������� ����������: ����� ������� �������, ������������ �������� � ��������. �������� ��� ����������.
-- ������� ������ "����� ������� ������� ������ %MAKER_TYPE%", ���� ��������� � ��������� ��� ����� ������� ���������.
declare
      grandfather_price number(5);
      grandmather_price number(5);
      winner VARCHAR2(20);
begin
      select min(PRICE) into grandfather_price from PIES where MAKER_TYPE = '�������';
      select min(PRICE) into grandmather_price from PIES where MAKER_TYPE = '�������';
      if grandfather_price>grandmather_price
      then dbms_output.put_line('����� ������� ������� ������ ' || grandmather_price);
      elsif grandfather_price<grandmather_price
      then dbms_output.put_line('����� ������� ������� ������ ' || grandfather_price);
      else dbms_output.put_line('����������� �������� � ������� � ������� �����');
      end if;
end;

-- ���� ������� ���� �� ����� ������, ��� ������� �� �������, ������� ���������: �� �������, ����� ������� �������� �� X ���,
-- ��� X � ���������� �������� ������� ����� ������� ����� ������� � ������� ����� �����. ���� ������� ���� �� �����
-- ������ ��� ����� ������� ���� �� �������, ������� ���������: ������ ����� �� ������ ��������.
declare
      avg_blin number(5);
      avg_pir number(5);
begin
      select avg(PRICE) into avg_blin from PIES where PRODUCT_NAME = '����';
      select avg(PRICE) into avg_pir from PIES where PRODUCT_NAME = '�������';
      if avg_blin<avg_pir then
      dbms_output.put_line('� ����� ����� ������� �������� �� '||(avg_pir-avg_blin) ||' ���.');
      else dbms_output.put_line('����� ����� �� ������ ��������');
      end if;
end;
