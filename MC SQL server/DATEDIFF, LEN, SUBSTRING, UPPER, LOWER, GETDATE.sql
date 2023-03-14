-- —колько вам полных лет. DATEDIFF - посчитать разницу между датами. GETDATE - текуща€ дата
SELECT datediff(MONTH, '1998-02-23', getdate())/12

-- ¬ерхний и нижний регистр, длина строки
SELECT LOWER('€ «наё т≈к—товы≈ ф”нкци»')
SELECT UPPER('€ «наё т≈к—товы≈ ф”нкци»')
SELECT len('€ «наё т≈к—товы≈ ф”нкци»')

--ѕримеры substring
select substring(product_name,1,3) as 'start',
	   substring(product_name,4,len(product_name)) as 'end'
from purchase
