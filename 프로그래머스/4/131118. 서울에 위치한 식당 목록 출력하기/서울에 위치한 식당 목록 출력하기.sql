# select i.rest_id, rest_name, food_type, favorites, address, round(avg(r.review_score), 2) as score
# from rest_info i, rest_review r
# where i.rest_id = r.rest_id
# group by i.rest_id
# having address like '서울%'
# order by score desc, favorites desc;

select a.rest_id, rest_name, food_type, favorites, address, round(avg(review_score),2) as score
from rest_info a
inner join rest_review b
on a.rest_id = b.rest_id
group by a.rest_id
having address like '서울%'
order by score desc, favorites desc;