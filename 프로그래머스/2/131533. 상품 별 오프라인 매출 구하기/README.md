# [level 2] 상품 별 오프라인 매출 구하기 - 131533 

[문제 링크](https://school.programmers.co.kr/learn/courses/30/lessons/131533) 

### 성능 요약

메모리: 0.0 MB, 시간: 0.00 ms

### 구분

코딩테스트 연습 > JOIN

### 채점결과

Empty

### 제출 일자

2023년 10월 6일 22:34:48

### 문제 설명

<p>다음은 어느 의류 쇼핑몰에서 판매중인 상품들의 상품 정보를 담은 <code>PRODUCT</code> 테이블과 오프라인 상품 판매 정보를 담은 <code>OFFLINE_SALE</code> 테이블 입니다. <code>PRODUCT</code> 테이블은 아래와 같은 구조로 <code>PRODUCT_ID</code>, <code>PRODUCT_CODE</code>, <code>PRICE</code>는 각각 상품 ID, 상품코드, 판매가를 나타냅니다.</p>
<table class="table">
        <thead><tr>
<th>Column name</th>
<th>Type</th>
<th>Nullable</th>
</tr>
</thead>
        <tbody><tr>
<td>PRODUCT_ID</td>
<td>INTEGER</td>
<td>FALSE</td>
</tr>
<tr>
<td>PRODUCT_CODE</td>
<td>VARCHAR(8)</td>
<td>FALSE</td>
</tr>
<tr>
<td>PRICE</td>
<td>INTEGER</td>
<td>FALSE</td>
</tr>
</tbody>
      </table>
<p>상품 별로 중복되지 않는 8자리 상품코드 값을 가지며, 앞 2자리는 카테고리 코드를 의미합니다.</p>

<p><code>OFFLINE_SALE</code> 테이블은 아래와 같은 구조로 되어있으며 <code>OFFLINE_SALE_ID</code>, <code>PRODUCT_ID</code>, <code>SALES_AMOUNT</code>, <code>SALES_DATE</code>는 각각 오프라인 상품 판매 ID, 상품 ID, 판매량, 판매일을 나타냅니다.</p>
<table class="table">
        <thead><tr>
<th>Column name</th>
<th>Type</th>
<th>Nullable</th>
</tr>
</thead>
        <tbody><tr>
<td>OFFLINE_SALE_ID</td>
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
<p>동일한 날짜, 상품 ID 조합에 대해서는 하나의 판매 데이터만 존재합니다.</p>

<hr>

<h5>문제</h5>

<p><code>PRODUCT</code> 테이블과 <code>OFFLINE_SALE</code> 테이블에서 상품코드 별 매출액(판매가 * 판매량) 합계를 출력하는 SQL문을 작성해주세요. 결과는 매출액을 기준으로 내림차순 정렬해주시고 매출액이 같다면 상품코드를 기준으로 오름차순 정렬해주세요.</p>

<hr>

<h5>예시</h5>

<p>예를 들어 <code>PRODUCT</code> 테이블이 다음과 같고 </p>
<table class="table">
        <thead><tr>
<th>PRODUCT_ID</th>
<th>PRODUCT_CODE</th>
<th>PRICE</th>
</tr>
</thead>
        <tbody><tr>
<td>1</td>
<td>A1000011</td>
<td>15000</td>
</tr>
<tr>
<td>2</td>
<td>A1000045</td>
<td>8000</td>
</tr>
<tr>
<td>3</td>
<td>C3000002</td>
<td>42000</td>
</tr>
</tbody>
      </table>
<p><code>OFFLINE_SALE</code> 테이블이 다음과 같다면</p>
<table class="table">
        <thead><tr>
<th>OFFLINE_SALE_ID</th>
<th>PRODUCT_ID</th>
<th>SALES_AMOUNT</th>
<th>SALES_DATE</th>
</tr>
</thead>
        <tbody><tr>
<td>1</td>
<td>1</td>
<td>2</td>
<td>2022-02-21</td>
</tr>
<tr>
<td>2</td>
<td>1</td>
<td>2</td>
<td>2022-03-02</td>
</tr>
<tr>
<td>3</td>
<td>3</td>
<td>3</td>
<td>2022-05-01</td>
</tr>
<tr>
<td>4</td>
<td>2</td>
<td>1</td>
<td>2022-05-24</td>
</tr>
<tr>
<td>5</td>
<td>1</td>
<td>2</td>
<td>2022-07-14</td>
</tr>
<tr>
<td>6</td>
<td>2</td>
<td>1</td>
<td>2022-09-22</td>
</tr>
</tbody>
      </table>
<p>각 상품 별 총 판매량과 판매가는 다음과 같습니다.</p>

<ul>
<li><code>PRODUCT_CODE</code> 가 <code>A1000011</code>인 상품은 총 판매량이 6개, 판매가가 15,000원</li>
<li><code>PRODUCT_CODE</code> 가 <code>A1000045</code>인 상품은 총 판매량이 2개, 판매가가 8,000원</li>
<li><code>PRODUCT_CODE</code> 가 <code>C3000002</code>인 상품은 총 판매량이 3개, 판매가가 42,000원</li>
</ul>

<p>그러므로 각 상품 별 매출액을 계산하고 정렬하면 결과가 다음과 같이 나와야 합니다.</p>
<table class="table">
        <thead><tr>
<th>PRODUCT_CODE</th>
<th>SALES</th>
</tr>
</thead>
        <tbody><tr>
<td>C3000002</td>
<td>126000</td>
</tr>
<tr>
<td>A1000011</td>
<td>90000</td>
</tr>
<tr>
<td>A1000045</td>
<td>16000</td>
</tr>
</tbody>
      </table>

> 출처: 프로그래머스 코딩 테스트 연습, https://school.programmers.co.kr/learn/challenges