# [level 4] 서울에 위치한 식당 목록 출력하기 - 131118 

[문제 링크](https://school.programmers.co.kr/learn/courses/30/lessons/131118) 

### 성능 요약

메모리: 0.0 MB, 시간: 0.00 ms

### 구분

코딩테스트 연습 > SELECT

### 채점결과

Empty

### 문제 설명

<p>다음은 식당의 정보를 담은 <code>REST_INFO</code> 테이블과 식당의 리뷰 정보를 담은  <code>REST_REVIEW</code> 테이블입니다. <code>REST_INFO</code> 테이블은 다음과 같으며 <code>REST_ID</code>, <code>REST_NAME</code>, <code>FOOD_TYPE</code>, <code>VIEWS</code>, <code>FAVORITES</code>, <code>PARKING_LOT</code>, <code>ADDRESS</code>, <code>TEL</code>은 식당 ID, 식당 이름, 음식 종류, 조회수, 즐겨찾기수, 주차장 유무, 주소, 전화번호를 의미합니다.</p>
<table class="table">
        <thead><tr>
<th>Column name</th>
<th>Type</th>
<th>Nullable</th>
</tr>
</thead>
        <tbody><tr>
<td>REST_ID</td>
<td>VARCHAR(5)</td>
<td>FALSE</td>
</tr>
<tr>
<td>REST_NAME</td>
<td>VARCHAR(50)</td>
<td>FALSE</td>
</tr>
<tr>
<td>FOOD_TYPE</td>
<td>VARCHAR(20)</td>
<td>TRUE</td>
</tr>
<tr>
<td>VIEWS</td>
<td>NUMBER</td>
<td>TRUE</td>
</tr>
<tr>
<td>FAVORITES</td>
<td>NUMBER</td>
<td>TRUE</td>
</tr>
<tr>
<td>PARKING_LOT</td>
<td>VARCHAR(1)</td>
<td>TRUE</td>
</tr>
<tr>
<td>ADDRESS</td>
<td>VARCHAR(100)</td>
<td>TRUE</td>
</tr>
<tr>
<td>TEL</td>
<td>VARCHAR(100)</td>
<td>TRUE</td>
</tr>
</tbody>
      </table>
<p><code>REST_REVIEW</code> 테이블은 다음과 같으며 <code>REVIEW_ID</code>, <code>REST_ID</code>, <code>MEMBER_ID</code>, <code>REVIEW_SCORE</code>, <code>REVIEW_TEXT</code>,<code>REVIEW_DATE</code>는 각각 리뷰 ID, 식당 ID, 회원 ID, 점수, 리뷰 텍스트, 리뷰 작성일을 의미합니다.</p>
<table class="table">
        <thead><tr>
<th>Column name</th>
<th>Type</th>
<th>Nullable</th>
</tr>
</thead>
        <tbody><tr>
<td>REVIEW_ID</td>
<td>VARCHAR(10)</td>
<td>FALSE</td>
</tr>
<tr>
<td>REST_ID</td>
<td>VARCHAR(10)</td>
<td>TRUE</td>
</tr>
<tr>
<td>MEMBER_ID</td>
<td>VARCHAR(100)</td>
<td>TRUE</td>
</tr>
<tr>
<td>REVIEW_SCORE</td>
<td>NUMBER</td>
<td>TRUE</td>
</tr>
<tr>
<td>REVIEW_TEXT</td>
<td>VARCHAR(1000)</td>
<td>TRUE</td>
</tr>
<tr>
<td>REVIEW_DATE</td>
<td>DATE</td>
<td>TRUE</td>
</tr>
</tbody>
      </table>
<hr>

<h5>문제</h5>

<p><code>REST_INFO</code>와 <code>REST_REVIEW</code> 테이블에서 서울에 위치한 식당들의 식당 ID, 식당 이름, 음식 종류, 즐겨찾기수, 주소, 리뷰 평균 점수를 조회하는 SQL문을 작성해주세요. 이때 리뷰 평균점수는 소수점 세 번째 자리에서 반올림 해주시고 결과는 평균점수를 기준으로 내림차순 정렬해주시고, 평균점수가 같다면 즐겨찾기수를 기준으로 내림차순 정렬해주세요. </p>

<hr>

<h5>예시</h5>

<p><code>REST_INFO</code> 테이블이 다음과 같고</p>
<table class="table">
        <thead><tr>
<th>REST_ID</th>
<th>REST_NAME</th>
<th>FOOD_TYPE</th>
<th>VIEWS</th>
<th>FAVORITES</th>
<th>PARKING_LOT</th>
<th>ADDRESS</th>
<th>TEL</th>
</tr>
</thead>
        <tbody><tr>
<td>00028</td>
<td>대우부대찌개</td>
<td>한식</td>
<td>52310</td>
<td>10</td>
<td>N</td>
<td>경기도 용인시 처인구 남사읍 처인성로 309</td>
<td>031-235-1235</td>
</tr>
<tr>
<td>00039</td>
<td>광주식당</td>
<td>한식</td>
<td>23001</td>
<td>20</td>
<td>N</td>
<td>경기도 부천시 산업로8번길 60</td>
<td>031-235-6423</td>
</tr>
<tr>
<td>00035</td>
<td>삼촌식당</td>
<td>일식</td>
<td>532123</td>
<td>80</td>
<td>N</td>
<td>서울특별시 강서구 가로공원로76가길</td>
<td>02-135-1266</td>
</tr>
</tbody>
      </table>
<p><code>REST_REVIEW</code> 테이블이 다음과 같을 때</p>
<table class="table">
        <thead><tr>
<th>REVIEW_ID</th>
<th>REST_ID</th>
<th>MEMBER_ID</th>
<th>REVIEW_SCORE</th>
<th>REVIEW_TEXT</th>
<th>REVIEW_DATE</th>
</tr>
</thead>
        <tbody><tr>
<td>R000000065</td>
<td>00028</td>
<td><code>soobin97@naver.com</code></td>
<td>5</td>
<td>부찌 국물에서 샤브샤브 맛이나고 깔끔</td>
<td>2022-04-12</td>
</tr>
<tr>
<td>R000000066</td>
<td>00039</td>
<td><code>yelin1130@gmail.com</code></td>
<td>5</td>
<td>김치찌개 최곱니다.</td>
<td>2022-02-12</td>
</tr>
<tr>
<td>R000000067</td>
<td>00028</td>
<td><code>yelin1130@gmail.com</code></td>
<td>5</td>
<td>햄이 많아서 좋아요</td>
<td>2022-02-22</td>
</tr>
<tr>
<td>R000000068</td>
<td>00035</td>
<td><code>ksyi0316@gmail.com</code></td>
<td>5</td>
<td>숙성회가 끝내줍니다.</td>
<td>2022-02-15</td>
</tr>
<tr>
<td>R000000069</td>
<td>00035</td>
<td><code>yoonsy95@naver.com</code></td>
<td>4</td>
<td>비린내가 전혀없어요.</td>
<td>2022-04-16</td>
</tr>
</tbody>
      </table>
<p>SQL을 실행하면 다음과 같이 출력되어야 합니다.</p>
<table class="table">
        <thead><tr>
<th>REST_ID</th>
<th>REST_NAME</th>
<th>FOOD_TYPE</th>
<th>FAVORITES</th>
<th>ADDRESS</th>
<th>SCORE</th>
</tr>
</thead>
        <tbody><tr>
<td>00035</td>
<td>삼촌식당</td>
<td>일식</td>
<td>80</td>
<td>서울특별시 강서구 가로공원로76가길</td>
<td>4.50</td>
</tr>
</tbody>
      </table>

> 출처: 프로그래머스 코딩 테스트 연습, https://programmers.co.kr/learn/challenges