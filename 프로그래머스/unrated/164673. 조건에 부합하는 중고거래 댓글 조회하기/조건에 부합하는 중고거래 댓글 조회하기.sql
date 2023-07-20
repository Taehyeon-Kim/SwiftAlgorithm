/*
테이블 2개 USED_GOODS_BOARD(중고거래 게시판), USED_GOODS_REPLY(중고거래 게시판 첨부파일)

주의사항
date_format - 포맷을 맞추라는 문제가 꽤 보임
*/

select title, a.board_id, reply_id, b.writer_id, b.contents, date_format(b.created_date, '%Y-%m-%d')
from used_goods_board a, used_goods_reply b
where a.board_id = b.board_id and year(a.created_date) = '2022' and month(a.created_date) = '10'
order by b.created_date, a.title; 
