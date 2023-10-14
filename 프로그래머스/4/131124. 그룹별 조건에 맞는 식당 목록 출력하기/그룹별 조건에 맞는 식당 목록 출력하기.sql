select member_name, review_text, date_format(review_date, '%Y-%m-%d') as review_date
from member_profile a
join (
    select member_id, review_text, review_date
    from rest_review
    where member_id = (
        select member_id
        from rest_review
        group by member_id
        order by count(*) desc
        limit 1
    )
) b
on a.member_id = b.member_id
order by review_date, review_text