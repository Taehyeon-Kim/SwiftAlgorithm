select MEMBER_ID, MEMBER_NAME, GENDER, date_format(date_of_birth, "%Y-%m-%d") as DATE_OF_BIRTH
from member_profile
where not tlno is null and month(date_of_birth) = '03' and gender = 'w'
order by member_id