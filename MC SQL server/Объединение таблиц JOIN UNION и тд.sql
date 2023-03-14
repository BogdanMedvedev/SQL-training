-- ����������� ������ join
select purchase.product_name, laststockdate, last_name
from purchase
INNER JOIN product on purchase.product_name = product.product_name
INNER JOIN person on purchase.salesperson = person.person_code

-- ����������� ������ ��� join
select purchase.product_name, laststockdate, last_name
from purchase, product, person
where purchase.product_name = product.product_name and purchase.salesperson = person.person_code

-- ����������� ������ ������� join
select product_name, first_name, last_name
from purchase
LEFT JOIN person on salesperson = person_code

-- ������������� except (���� � ������ �������, �� ��� �� ������)
select salesperson from purchase_archive
except
select salesperson from purchase

-- ������������� INTERSECT (������ ��, ��� ���� � ����� ��������)
select salesperson from purchase
INTERSECT
select salesperson from purchase_archive

-- ������������� UNION (��, ��� ����)
select salesperson from purchase
UNION
select salesperson from purchase_archive


