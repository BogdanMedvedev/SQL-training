-- ������� ��� ������ ���. DATEDIFF - ��������� ������� ����� ������. GETDATE - ������� ����
SELECT datediff(MONTH, '1998-02-23', getdate())/12

-- ������� � ������ �������, ����� ������
SELECT LOWER('� ���� ��������� �������')
SELECT UPPER('� ���� ��������� �������')
SELECT len('� ���� ��������� �������')

--������� substring
select substring(product_name,1,3) as 'start',
	   substring(product_name,4,len(product_name)) as 'end'
from purchase
