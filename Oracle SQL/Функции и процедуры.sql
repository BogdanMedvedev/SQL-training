-- ������� ������� ��� ������� ����� �� 2
create or REPLACE FUNCTION TheNumbers (mynum in number)
  return number is
  begin 
  return mynum/2;
  end TheNumbers;
-- �������� �������
select TheNumbers(22) from dual; 
-- �������� �������
drop function TheNumbers;


-- ������� ������������ ������� � �������� ��������� ��� � ��������
-- ������ �������
create table employees ( 
        customer_id number(10) NOT NULL,
        customer_name varchar2(50) NOT NULL,
        city varchar2(50)
        );
insert into employees values (1, '���� ������', '������');
insert into employees values (2, '����� �������', '�����-���������');
insert into employees values (3, '������ ������', '������ ��������');
-- ��������� �������
select * from EMPLOYEES
-- ������� ��������� ��� �������� ������������ �������
create or replace procedure delete_table (table_name in varchar2)
  is
    begin
       execute immediate 'drop table ' || table_name;
    end;
-- ��������� ��������� 
begin 
  delete_table('employees');
  dbms_output.put_line('������� ������� �������');
end;
-- ������� ���������
drop procedure delete_table; --�������� ���������


-- ������� �������, ������� ����� ������������� �������� ����� ������� �� 128 ��������.
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
-- ��������� �������
select REVERSE_TEXTT('������! � ��������������� �����')
  from DUAL;        
-- ������� �������
drop function REVERSE_TEXTT; --�������� �������
