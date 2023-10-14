SELECT a.flavor
from first_half a
join july b
on a.flavor = b.flavor
group by flavor
order by sum(a.total_order) + sum(b.total_order) desc
limit 3;