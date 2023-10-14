# [level 4] 주문량이 많은 아이스크림들 조회하기 - 133027 

[문제 링크](https://school.programmers.co.kr/learn/courses/30/lessons/133027) 

### 성능 요약

메모리: 0.0 MB, 시간: 0.00 ms

### 구분

코딩테스트 연습 > JOIN

### 채점결과

Empty

### 제출 일자

2023년 10월 0일 0:16:4

### 문제 설명

<p>다음은 아이스크림 가게의 상반기 주문 정보를 담은 <code>FIRST_HALF</code> 테이블과 7월의 아이스크림 주문 정보를 담은 <code>JULY</code> 테이블입니다. <code>FIRST_HALF</code> 테이블 구조는 다음과 같으며, <code>SHIPMENT_ID</code>, <code>FLAVOR</code>, <code>TOTAL_ORDER</code>는 각각 아이스크림 공장에서 아이스크림 가게까지의 출하 번호, 아이스크림 맛, 상반기 아이스크림 총주문량을 나타냅니다. <code>FIRST_HALF</code> 테이블의 기본 키는 <code>FLAVOR</code>입니다. <code>FIRST_HALF</code>테이블의 <code>SHIPMENT_ID</code>는 <code>JULY</code>테이블의 <code>SHIPMENT_ID</code>의 외래 키입니다. </p>
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
<p><code>JULY</code> 테이블 구조는 다음과 같으며, <code>SHIPMENT_ID</code>, <code>FLAVOR</code>, <code>TOTAL_ORDER</code> 은 각각 아이스크림 공장에서 아이스크림 가게까지의 출하 번호, 아이스크림 맛, 7월 아이스크림 총주문량을 나타냅니다.  <code>JULY</code> 테이블의 기본 키는 <code>SHIPMENT_ID</code>입니다. <code>JULY</code>테이블의 <code>FLAVOR</code>는 <code>FIRST_HALF</code> 테이블의  <code>FLAVOR</code>의 외래 키입니다. 7월에는 아이스크림 주문량이 많아 같은 아이스크림에 대하여 서로 다른 두 공장에서 아이스크림 가게로 출하를 진행하는 경우가 있습니다. 이 경우 같은 맛의 아이스크림이라도 다른 출하 번호를 갖게 됩니다.</p>
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
<hr>

<h5>문제</h5>

<p>7월 아이스크림 총 주문량과 상반기의 아이스크림 총 주문량을 더한 값이 큰 순서대로 상위 3개의 맛을 조회하는 SQL 문을 작성해주세요. </p>

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
<p><code>JULY</code>테이블이 다음과 같다면</p>
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
<td>520</td>
</tr>
<tr>
<td style="text-align: left">102</td>
<td style="text-align: left">vanilla</td>
<td>560</td>
</tr>
<tr>
<td style="text-align: left">103</td>
<td style="text-align: left">mint_chocolate</td>
<td>400</td>
</tr>
<tr>
<td style="text-align: left">104</td>
<td style="text-align: left">caramel</td>
<td>460</td>
</tr>
<tr>
<td style="text-align: left">105</td>
<td style="text-align: left">white_chocolate</td>
<td>350</td>
</tr>
<tr>
<td style="text-align: left">106</td>
<td style="text-align: left">peach</td>
<td>500</td>
</tr>
<tr>
<td style="text-align: left">107</td>
<td style="text-align: left">watermelon</td>
<td>780</td>
</tr>
<tr>
<td style="text-align: left">108</td>
<td style="text-align: left">mango</td>
<td>790</td>
</tr>
<tr>
<td style="text-align: left">109</td>
<td style="text-align: left">strawberry</td>
<td>520</td>
</tr>
<tr>
<td style="text-align: left">110</td>
<td style="text-align: left">melon</td>
<td>400</td>
</tr>
<tr>
<td style="text-align: left">111</td>
<td style="text-align: left">orange</td>
<td>250</td>
</tr>
<tr>
<td style="text-align: left">112</td>
<td style="text-align: left">pineapple</td>
<td>200</td>
</tr>
<tr>
<td style="text-align: left">208</td>
<td style="text-align: left">mango</td>
<td>110</td>
</tr>
<tr>
<td style="text-align: left">209</td>
<td style="text-align: left">strawberry</td>
<td>220</td>
</tr>
</tbody>
      </table>
<p>7월 아이스크림 총주문량과 상반기의 아이스크림 총 주문량을 더한 값이 큰 순서대로 상위 3개의 맛을 조회하면 strawberry(520 + 220 + 3,100 = 3,840), mango(790 + 110 + 2,900 = 3,800), chocolate(520 + 3,200 = 3,720) 순입니다. 따라서 SQL 문을 실행하면 다음과 같이 나와야 합니다. </p>
<table class="table">
        <thead><tr>
<th style="text-align: left">FLAVOR</th>
</tr>
</thead>
        <tbody><tr>
<td style="text-align: left">strawberry</td>
</tr>
<tr>
<td style="text-align: left">mango</td>
</tr>
<tr>
<td style="text-align: left">chocolate</td>
</tr>
</tbody>
      </table>

> 출처: 프로그래머스 코딩 테스트 연습, https://school.programmers.co.kr/learn/challenges