# [unrated] 과일로 만든 아이스크림 고르기 - 133025 

[문제 링크](https://school.programmers.co.kr/learn/courses/30/lessons/133025) 

### 성능 요약

메모리: 0.0 MB, 시간: 0.00 ms

### 구분

코딩테스트 연습 > SELECT

### 채점결과

Empty

### 문제 설명

<p>다음은 아이스크림 가게의 상반기 주문 정보를 담은 <code>FIRST_HALF</code> 테이블과 아이스크림 성분에 대한 정보를 담은 <code>ICECREAM_INFO</code> 테이블입니다. <code>FIRST_HALF</code> 테이블 구조는 다음과 같으며, <code>SHIPMENT_ID</code>, <code>FLAVOR</code>, <code>TOTAL_ORDER</code> 는 각각 아이스크림 공장에서 아이스크림 가게까지의 출하 번호, 아이스크림 맛, 상반기 아이스크림 총주문량을 나타냅니다. <code>FIRST_HALF</code> 테이블의 기본 키는 <code>FLAVOR</code>입니다.</p>
<table class="table">
        <thead><tr>
<th style="text-align: left">NAME</th>
<th style="text-align: left">TYPE</th>
<th>NULLABLE</th>
</tr>
</thead>
        <tbody><tr>
<td style="text-align: left">SHIPMENT_ID</td>
<td style="text-align: left">INT(N)</td>
<td>FALSE</td>
</tr>
<tr>
<td style="text-align: left">FLAVOR</td>
<td style="text-align: left">VARCHAR(N)</td>
<td>FALSE</td>
</tr>
<tr>
<td style="text-align: left">TOTAL_ORDER</td>
<td style="text-align: left">INT(N)</td>
<td>FALSE</td>
</tr>
</tbody>
      </table>
<p><code>ICECREAM_INFO</code> 테이블 구조는 다음과 같으며, <code>FLAVOR</code>, <code>INGREDITENT_TYPE</code> 은 각각 아이스크림 맛, 아이스크림의 성분 타입을 나타냅니다. <code>INGREDIENT_TYPE</code>에는 아이스크림의 주 성분이 설탕이면 <code>sugar_based</code>라고 입력되고, 아이스크림의 주 성분이 과일이면 <code>fruit_based</code>라고 입력됩니다. <code>ICECREAM_INFO</code>의 기본 키는 <code>FLAVOR</code>입니다. <code>ICECREAM_INFO</code>테이블의 <code>FLAVOR</code>는 <code>FIRST_HALF</code> 테이블의  <code>FLAVOR</code>의 외래 키입니다.</p>
<table class="table">
        <thead><tr>
<th style="text-align: left">NAME</th>
<th style="text-align: left">TYPE</th>
<th>NULLABLE</th>
</tr>
</thead>
        <tbody><tr>
<td style="text-align: left">FLAVOR</td>
<td style="text-align: left">VARCHAR(N)</td>
<td>FALSE</td>
</tr>
<tr>
<td style="text-align: left">INGREDIENT_TYPE</td>
<td style="text-align: left">VARCHAR(N)</td>
<td>FALSE</td>
</tr>
</tbody>
      </table>
<hr>

<h5>문제</h5>

<p>상반기 아이스크림 총주문량이 3,000보다 높으면서 아이스크림의 주 성분이 과일인 아이스크림의 맛을 총주문량이 큰 순서대로 조회하는 SQL 문을 작성해주세요.</p>

<hr>

<h5>예시</h5>

<p>예를 들어 <code>FIRST_HALF</code> 테이블이 다음과 같고</p>
<table class="table">
        <thead><tr>
<th style="text-align: left">SHIPMENT_ID</th>
<th style="text-align: left">FLAVOR</th>
<th>TOTAL_ORDER</th>
</tr>
</thead>
        <tbody><tr>
<td style="text-align: left">101</td>
<td style="text-align: left">chocolate</td>
<td>3200</td>
</tr>
<tr>
<td style="text-align: left">102</td>
<td style="text-align: left">vanilla</td>
<td>2800</td>
</tr>
<tr>
<td style="text-align: left">103</td>
<td style="text-align: left">mint_chocolate</td>
<td>1700</td>
</tr>
<tr>
<td style="text-align: left">104</td>
<td style="text-align: left">caramel</td>
<td>2600</td>
</tr>
<tr>
<td style="text-align: left">105</td>
<td style="text-align: left">white_chocolate</td>
<td>3100</td>
</tr>
<tr>
<td style="text-align: left">106</td>
<td style="text-align: left">peach</td>
<td>2450</td>
</tr>
<tr>
<td style="text-align: left">107</td>
<td style="text-align: left">watermelon</td>
<td>2150</td>
</tr>
<tr>
<td style="text-align: left">108</td>
<td style="text-align: left">mango</td>
<td>2900</td>
</tr>
<tr>
<td style="text-align: left">109</td>
<td style="text-align: left">strawberry</td>
<td>3100</td>
</tr>
<tr>
<td style="text-align: left">110</td>
<td style="text-align: left">melon</td>
<td>3150</td>
</tr>
<tr>
<td style="text-align: left">111</td>
<td style="text-align: left">orange</td>
<td>2900</td>
</tr>
<tr>
<td style="text-align: left">112</td>
<td style="text-align: left">pineapple</td>
<td>2900</td>
</tr>
</tbody>
      </table>
<p><code>ICECREAM_INFO</code> 테이블이 다음과 같다면</p>
<table class="table">
        <thead><tr>
<th style="text-align: left">FLAVOR</th>
<th>INGREDIENT_TYPE</th>
</tr>
</thead>
        <tbody><tr>
<td style="text-align: left">chocolate</td>
<td>sugar_based</td>
</tr>
<tr>
<td style="text-align: left">vanilla</td>
<td>sugar_based</td>
</tr>
<tr>
<td style="text-align: left">mint_chocolate</td>
<td>sugar_based</td>
</tr>
<tr>
<td style="text-align: left">caramel</td>
<td>sugar_based</td>
</tr>
<tr>
<td style="text-align: left">white_chocolate</td>
<td>sugar_based</td>
</tr>
<tr>
<td style="text-align: left">peach</td>
<td>fruit_based</td>
</tr>
<tr>
<td style="text-align: left">watermelon</td>
<td>fruit_based</td>
</tr>
<tr>
<td style="text-align: left">mango</td>
<td>fruit_based</td>
</tr>
<tr>
<td style="text-align: left">strawberry</td>
<td>fruit_based</td>
</tr>
<tr>
<td style="text-align: left">melon</td>
<td>fruit_based</td>
</tr>
<tr>
<td style="text-align: left">orange</td>
<td>fruit_based</td>
</tr>
<tr>
<td style="text-align: left">pineapple</td>
<td>fruit_based</td>
</tr>
</tbody>
      </table>
<p>상반기 아이스크림 총주문량이 3,000보다 높은 아이스크림 맛은 chocolate, strawberry, melon, white_chocolate입니다. 이 중에 아이스크림의 주 성분이 과일인 아이스크림 맛은 strawberry와 melon이고 총주문량이 큰 순서대로 아이스크림 맛을 조회하면 melon, strawberry 순으로 조회되어야 합니다. 따라서 SQL 문을 실행하면 다음과 같이 나와야 합니다. </p>
<table class="table">
        <thead><tr>
<th style="text-align: left">FLAVOR</th>
</tr>
</thead>
        <tbody><tr>
<td style="text-align: left">melon</td>
</tr>
<tr>
<td style="text-align: left">strawberry</td>
</tr>
</tbody>
      </table>

> 출처: 프로그래머스 코딩 테스트 연습, https://programmers.co.kr/learn/challenges