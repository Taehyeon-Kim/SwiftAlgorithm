select date_format(sales_date, '%Y-%m-%d') as sales_date, product_id, user_id, sales_amount
from online_sale a
where sales_date like '2022-03%'

union all

select date_format(sales_date, '%Y-%m-%d') as sales_date, product_id, null as user_id, sales_amount
from offline_sale b
where sales_date like '2022-03%'

order by sales_date, product_id, user_id;