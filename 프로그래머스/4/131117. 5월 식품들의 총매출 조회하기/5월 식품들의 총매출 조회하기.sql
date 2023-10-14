-- 코드를 입력하세요
select a.product_id, product_name, sum(price * amount) as total_sales 
from food_order a
join (
    select *
    from food_product
    
) b
on a.product_id = b.product_id
where produce_date like '2022-05%'
group by a.product_id
order by total_sales desc, a.product_id asc