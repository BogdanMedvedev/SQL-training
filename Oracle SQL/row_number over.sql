set serveroutput on;

-- Использование row_number() over
select * from (
  select P.*, row_number() over(order by price) RN from pies P
  )
  where RN in (1,2,5);
  
-- Использование row_number() over
select *  from (
  select PC.*, row_number() over(PARTITION BY PRODUCT order by EFD desc) RN from PRODUCT_CONF PC
  )
  where RN = 1
  