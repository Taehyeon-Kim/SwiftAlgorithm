# [level 2] 재구매가 일어난 상품과 회원 리스트 구하기 - 131536 

[문제 링크](https://school.programmers.co.kr/learn/courses/30/lessons/131536) 

### 성능 요약

메모리: 0.0 MB, 시간: 0.00 ms

### 구분

코딩테스트 연습 > SELECT

### 채점결과

Empty

### 문제 설명

<p>다음은 어느 의류 쇼핑몰의 온라인 상품 판매 정보를 담은 <code>ONLINE_SALE</code> 테이블 입니다. <code>ONLINE_SALE</code> 테이블은 아래와 같은 구조로 되어있으며 <code>ONLINE_SALE_ID</code>, <code>USER_ID</code>, <code>PRODUCT_ID</code>, <code>SALES_AMOUNT</code>, <code>SALES_DATE</code>는 각각 온라인 상품 판매 ID, 회원 ID, 상품 ID, 판매량, 판매일을 나타냅니다.</p>
<table class="table">
        <thead><tr>
<th>Column name</th>
<th>Type</th>
<th>Nullable</th>
</tr>
</thead>
        <tbody><tr>
<td>ONLINE_SALE_ID</td>
<td>INTEGER</td>
<td>FALSE</td>
</tr>
<tr>
<td>USER_ID</td>
<td>INTEGER</td>
<td>FALSE</td>
</tr>
<tr>
<td>PRODUCT_ID</td>
<td>INTEGER</td>
<td>FALSE</td>
</tr>
<tr>
<td>SALES_AMOUNT</td>
<td>INTEGER</td>
<td>FALSE</td>
</tr>
<tr>
<td>SALES_DATE</td>
<td>DATE</td>
<td>FALSE</td>
</tr>
</tbody>
      </table>
<p>동일한 날짜, 회원 ID, 상품 ID 조합에 대해서는 하나의 판매 데이터만 존재합니다.</p>

<hr>

<h5>문제</h5>

<p><code>ONLINE_SALE</code> 테이블에서 동일한 회원이 동일한 상품을 재구매한 데이터를 구하여, 재구매한 회원 ID와 재구매한 상품 ID를 출력하는 SQL문을 작성해주세요. 결과는 회원 ID를 기준으로 오름차순 정렬해주시고 회원 ID가 같다면 상품 ID를 기준으로 내림차순 정렬해주세요.</p>

<hr>

<h5>예시</h5>

<p>예를 들어 <code>ONLINE_SALE</code> 테이블이 다음과 같다면</p>
<table class="table">
        <thead><tr>
<th>ONLINE_SALE_ID</th>
<th>USER_ID</th>
<th>PRODUCT_ID</th>
<th>SALES_AMOUNT</th>
<th>SALES_DATE</th>
</tr>
</thead>
        <tbody><tr>
<td>1</td>
<td>1</td>
<td>3</td>
<td>2</td>
<td>2022-02-25</td>
</tr>
<tr>
<td>2</td>
<td>1</td>
<td>4</td>
<td>1</td>
<td>2022-03-01</td>
</tr>
<tr>
<td>4</td>
<td>2</td>
<td>4</td>
<td>2</td>
<td>2022-03-12</td>
</tr>
<tr>
<td>3</td>
<td>1</td>
<td>3</td>
<td>3</td>
<td>2022-03-31</td>
</tr>
<tr>
<td>5</td>
<td>3</td>
<td>5</td>
<td>1</td>
<td>2022-04-03</td>
</tr>
<tr>
<td>6</td>
<td>2</td>
<td>4</td>
<td>1</td>
<td>2022-04-06</td>
</tr>
<tr>
<td>2</td>
<td>1</td>
<td>4</td>
<td>2</td>
<td>2022-05-11</td>
</tr>
</tbody>
      </table>
<p><code>USER_ID</code> 가 1인 유저가 <code>PRODUCT_ID</code> 가 3, 4인 상품들을 재구매하고, <code>USER_ID</code> 가 2인 유저가 <code>PRODUCT_ID</code> 가 4인 상품을 재구매 하였으므로, 다음과 같이 결과가 나와야합니다.</p>
<table class="table">
        <thead><tr>
<th>USER_ID</th>
<th>PRODUCT_ID</th>
</tr>
</thead>
        <tbody><tr>
<td>1</td>
<td>4</td>
</tr>
<tr>
<td>1</td>
<td>3</td>
</tr>
<tr>
<td>2</td>
<td>4</td>
</tr>
</tbody>
      </table>

> 출처: 프로그래머스 코딩 테스트 연습, https://programmers.co.kr/learn/challenges