select book_id, b.author_name, date_format(published_date, '%Y-%m-%d') as published_date
from book a
left join author b
on a.author_id = b.author_id
where category = '경제'
order by published_date asc