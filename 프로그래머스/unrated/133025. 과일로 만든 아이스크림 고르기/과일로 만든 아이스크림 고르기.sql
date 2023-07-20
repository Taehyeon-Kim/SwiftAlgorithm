select icecream_info.flavor 
from first_half, icecream_info
where first_half.flavor = icecream_info.flavor 
and total_order >= 3000
and ingredient_type = 'fruit_based'
order by total_order desc;