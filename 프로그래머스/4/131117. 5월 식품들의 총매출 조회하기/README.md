# [level 4] 5월 식품들의 총매출 조회하기 - 131117 

[문제 링크](https://school.programmers.co.kr/learn/courses/30/lessons/131117) 

### 성능 요약

메모리: 0.0 MB, 시간: 0.00 ms

### 구분

코딩테스트 연습 > JOIN

### 채점결과

Empty

### 제출 일자

2023년 10월 6일 20:42:45

### 문제 설명

<p>다음은 식품의 정보를 담은 <code>FOOD_PRODUCT</code> 테이블과 식품의 주문 정보를 담은 <code>FOOD_ORDER</code> 테이블입니다. <code>FOOD_PRODUCT</code> 테이블은 다음과 같으며 <code>PRODUCT_ID</code>, <code>PRODUCT_NAME</code>, <code>PRODUCT_CD</code>, <code>CATEGORY</code>, <code>PRICE</code>는 식품 ID, 식품 이름, 식품코드, 식품분류, 식품 가격을 의미합니다.</p>
<table class="table">
        <thead><tr>
<th>Column name</th>
<th>Type</th>
<th>Nullable</th>
</tr>
</thead>
        <tbody><tr>
<td>PRODUCT_ID</td>
<td>VARCHAR(10)</td>
<td>FALSE</td>
</tr>
<tr>
<td>PRODUCT_NAME</td>
<td>VARCHAR(50)</td>
<td>FALSE</td>
</tr>
<tr>
<td>PRODUCT_CD</td>
<td>VARCHAR(10)</td>
<td>TRUE</td>
</tr>
<tr>
<td>CATEGORY</td>
<td>VARCHAR(10)</td>
<td>TRUE</td>
</tr>
<tr>
<td>PRICE</td>
<td>NUMBER</td>
<td>TRUE</td>
</tr>
</tbody>
      </table>
<p><code>FOOD_ORDER</code> 테이블은 다음과 같으며 <code>ORDER_ID</code>, <code>PRODUCT_ID</code>, <code>AMOUNT</code>,  <code>PRODUCE_DATE</code>, <code>IN_DATE</code>, <code>OUT_DATE</code>, <code>FACTORY_ID</code>, <code>WAREHOUSE_ID</code>는 각각 주문 ID, 제품 ID, 주문량, 생산일자, 입고일자, 출고일자, 공장 ID, 창고 ID를 의미합니다.</p>
<table class="table">
        <thead><tr>
<th>Column name</th>
<th>Type</th>
<th>Nullable</th>
</tr>
</thead>
        <tbody><tr>
<td>ORDER_ID</td>
<td>VARCHAR(10)</td>
<td>FALSE</td>
</tr>
<tr>
<td>PRODUCT_ID</td>
<td>VARCHAR(5)</td>
<td>FALSE</td>
</tr>
<tr>
<td>AMOUNT</td>
<td>NUMBER</td>
<td>FALSE</td>
</tr>
<tr>
<td>PRODUCE_DATE</td>
<td>DATE</td>
<td>TRUE</td>
</tr>
<tr>
<td>IN_DATE</td>
<td>DATE</td>
<td>TRUE</td>
</tr>
<tr>
<td>OUT_DATE</td>
<td>DATE</td>
<td>TRUE</td>
</tr>
<tr>
<td>FACTORY_ID</td>
<td>VARCHAR(10)</td>
<td>FALSE</td>
</tr>
<tr>
<td>WAREHOUSE_ID</td>
<td>VARCHAR(10)</td>
<td>FALSE</td>
</tr>
</tbody>
      </table>
<hr>

<h5>문제</h5>

<p><code>FOOD_PRODUCT</code>와 <code>FOOD_ORDER</code> 테이블에서 생산일자가 2022년 5월인 식품들의 식품 ID, 식품 이름, 총매출을 조회하는 SQL문을 작성해주세요. 이때 결과는 총매출을 기준으로 내림차순 정렬해주시고 총매출이 같다면 식품 ID를 기준으로 오름차순 정렬해주세요.</p>

<hr>

<h5>예시</h5>

<p><code>FOOD_PRODUCT</code> 테이블이 다음과 같고</p>
<table class="table">
        <thead><tr>
<th>PRODUCT_ID</th>
<th>PRODUCT_NAME</th>
<th>PRODUCT_CD</th>
<th>CATEGORY</th>
<th>PRICE</th>
</tr>
</thead>
        <tbody><tr>
<td>P0011</td>
<td>맛있는콩기름</td>
<td>CD_OL00001</td>
<td>식용유</td>
<td>4880</td>
</tr>
<tr>
<td>P0012</td>
<td>맛있는올리브유</td>
<td>CD_OL00002</td>
<td>식용유</td>
<td>7200</td>
</tr>
<tr>
<td>P0013</td>
<td>맛있는포도씨유</td>
<td>CD_OL00003</td>
<td>식용유</td>
<td>5950</td>
</tr>
<tr>
<td>P0014</td>
<td>맛있는마조유</td>
<td>CD_OL00004</td>
<td>식용유</td>
<td>8950</td>
</tr>
<tr>
<td>P0015</td>
<td>맛있는화조유</td>
<td>CD_OL00005</td>
<td>식용유</td>
<td>8800</td>
</tr>
<tr>
<td>P0016</td>
<td>맛있는참기름</td>
<td>CD_OL00006</td>
<td>식용유</td>
<td>7100</td>
</tr>
<tr>
<td>P0017</td>
<td>맛있는들기름</td>
<td>CD_OL00007</td>
<td>식용유</td>
<td>7900</td>
</tr>
<tr>
<td>P0018</td>
<td>맛있는고추기름</td>
<td>CD_OL00008</td>
<td>식용유</td>
<td>6100</td>
</tr>
<tr>
<td>P0019</td>
<td>맛있는카놀라유</td>
<td>CD_OL00009</td>
<td>식용유</td>
<td>5100</td>
</tr>
<tr>
<td>P0020</td>
<td>맛있는산초유</td>
<td>CD_OL00010</td>
<td>식용유</td>
<td>6500</td>
</tr>
</tbody>
      </table>
<p><code>FOOD_ORDER</code> 테이블이 다음과 같을 때</p>
<table class="table">
        <thead><tr>
<th>ORDER_ID</th>
<th>PRODUCT_ID</th>
<th>AMOUNT</th>
<th>PRODUCE_DATE</th>
<th>IN_DATE</th>
<th>OUT_DATE</th>
<th>FACTORY_ID</th>
<th>WAREHOUSE_ID</th>
</tr>
</thead>
        <tbody><tr>
<td>OD00000056</td>
<td>P0012</td>
<td>1000</td>
<td>2022-04-04</td>
<td>2022-04-21</td>
<td>2022-04-25</td>
<td>FT19980002</td>
<td>WH0032</td>
</tr>
<tr>
<td>OD00000057</td>
<td>P0014</td>
<td>2500</td>
<td>2022-04-14</td>
<td>2022-04-27</td>
<td>2022-05-01</td>
<td>FT19980002</td>
<td>WH0033</td>
</tr>
<tr>
<td>OD00000058</td>
<td>P0017</td>
<td>1200</td>
<td>2022-05-19</td>
<td>2022-05-28</td>
<td>2022-05-28</td>
<td>FT20070002</td>
<td>WH0033</td>
</tr>
<tr>
<td>OD00000059</td>
<td>P0017</td>
<td>1000</td>
<td>2022-05-24</td>
<td>2022-05-30</td>
<td>2022-05-30</td>
<td>FT20070002</td>
<td>WH0038</td>
</tr>
<tr>
<td>OD00000060</td>
<td>P0019</td>
<td>2000</td>
<td>2022-05-29</td>
<td>2022-06-08</td>
<td>2022-06-08</td>
<td>FT20070002</td>
<td>WH0035</td>
</tr>
</tbody>
      </table>
<p>SQL을 실행하면 다음과 같이 출력되어야 합니다.</p>
<table class="table">
        <thead><tr>
<th>PRODUCT_ID</th>
<th>PRODUCT_NAME</th>
<th>TOTAL_SALES</th>
</tr>
</thead>
        <tbody><tr>
<td>P0017</td>
<td>맛있는들기름</td>
<td>17380000</td>
</tr>
<tr>
<td>P0019</td>
<td>맛있는카놀라유</td>
<td>10200000</td>
</tr>
</tbody>
      </table>

> 출처: 프로그래머스 코딩 테스트 연습, https://school.programmers.co.kr/learn/challenges