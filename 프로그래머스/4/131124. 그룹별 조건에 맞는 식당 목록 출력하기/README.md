# [level 4] 그룹별 조건에 맞는 식당 목록 출력하기 - 131124 

[문제 링크](https://school.programmers.co.kr/learn/courses/30/lessons/131124) 

### 성능 요약

메모리: 0.0 MB, 시간: 0.00 ms

### 구분

코딩테스트 연습 > JOIN

### 채점결과

Empty

### 제출 일자

2023년 10월 0일 0:46:29

### 문제 설명

<p>다음은 고객의 정보를 담은 <code>MEMBER_PROFILE</code>테이블과 식당의 리뷰 정보를 담은  <code>REST_REVIEW</code> 테이블입니다. <code>MEMBER_PROFILE</code> 테이블은 다음과 같으며 <code>MEMBER_ID</code>, <code>MEMBER_NAME</code>, <code>TLNO</code>, <code>GENDER</code>, <code>DATE_OF_BIRTH</code>는 회원 ID, 회원 이름, 회원 연락처, 성별, 생년월일을 의미합니다.</p>
<table class="table">
        <thead><tr>
<th>Column name</th>
<th>Type</th>
<th>Nullable</th>
</tr>
</thead>
        <tbody><tr>
<td>MEMBER_ID</td>
<td>VARCHAR(100)</td>
<td>FALSE</td>
</tr>
<tr>
<td>MEMBER_NAME</td>
<td>VARCHAR(50)</td>
<td>FALSE</td>
</tr>
<tr>
<td>TLNO</td>
<td>VARCHAR(50)</td>
<td>TRUE</td>
</tr>
<tr>
<td>GENDER</td>
<td>VARCHAR(1)</td>
<td>TRUE</td>
</tr>
<tr>
<td>DATE_OF_BIRTH</td>
<td>DATE</td>
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

<p><code>MEMBER_PROFILE</code>와 <code>REST_REVIEW</code> 테이블에서 리뷰를 가장 많이 작성한 회원의 리뷰들을 조회하는 SQL문을 작성해주세요. 회원 이름, 리뷰 텍스트, 리뷰 작성일이 출력되도록 작성해주시고, 결과는 리뷰 작성일을 기준으로 오름차순, 리뷰 작성일이 같다면 리뷰 텍스트를 기준으로 오름차순 정렬해주세요.</p>

<hr>

<h5>예시</h5>

<p><code>MEMBER_PROFILE</code> 테이블이 다음과 같고</p>
<table class="table">
        <thead><tr>
<th>MEMBER_ID</th>
<th>MEMBER_NAME</th>
<th>TLNO</th>
<th>GENDER</th>
<th>DATE_OF_BIRTH</th>
</tr>
</thead>
        <tbody><tr>
<td><code>jiho92@naver.com</code></td>
<td>이지호</td>
<td>01076432111</td>
<td>W</td>
<td>1992-02-12</td>
</tr>
<tr>
<td><code>jiyoon22@hotmail.com</code></td>
<td>김지윤</td>
<td>01032324117</td>
<td>W</td>
<td>1992-02-22</td>
</tr>
<tr>
<td><code>jihoon93@hanmail.net</code></td>
<td>김지훈</td>
<td>01023258688</td>
<td>M</td>
<td>1993-02-23</td>
</tr>
<tr>
<td><code>seoyeons@naver.com</code></td>
<td>박서연</td>
<td>01076482209</td>
<td>W</td>
<td>1993-03-16</td>
</tr>
<tr>
<td><code>yelin1130@gmail.com</code></td>
<td>조예린</td>
<td>01017626711</td>
<td>W</td>
<td>1990-11-30</td>
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
<th>MEMBER_NAME</th>
<th>REVIEW_TEXT</th>
<th>REVIEW_DATE</th>
</tr>
</thead>
        <tbody><tr>
<td>조예린</td>
<td>김치찌개 최곱니다.</td>
<td>2022-02-12</td>
</tr>
<tr>
<td>조예린</td>
<td>햄이 많아서 좋아요</td>
<td>2022-02-22</td>
</tr>
</tbody>
      </table>
<hr>

<h5>주의사항</h5>

<p><code>REVIEW_DATE</code>의 데이트 포맷이 예시와 동일해야 정답처리 됩니다.</p>


> 출처: 프로그래머스 코딩 테스트 연습, https://school.programmers.co.kr/learn/challenges