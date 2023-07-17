# [level 2] 3월에 태어난 여성 회원 목록 출력하기 - 131120 

[문제 링크](https://school.programmers.co.kr/learn/courses/30/lessons/131120) 

### 성능 요약

메모리: 0.0 MB, 시간: 0.00 ms

### 구분

코딩테스트 연습 > SELECT

### 채점결과

Empty

### 문제 설명

<p>다음은 식당 리뷰 사이트의 회원 정보를 담은 <code>MEMBER_PROFILE</code> 테이블입니다. <code>MEMBER_PROFILE</code> 테이블은 다음과 같으며 <code>MEMBER_ID</code>, <code>MEMBER_NAME</code>, <code>TLNO</code>, <code>GENDER</code>, <code>DATE_OF_BIRTH</code>는 회원 ID, 회원 이름, 회원 연락처, 성별, 생년월일을 의미합니다.</p>
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
<hr>

<h5>문제</h5>

<p><code>MEMBER_PROFILE</code> 테이블에서 생일이 3월인 여성 회원의 ID, 이름, 성별, 생년월일을 조회하는 SQL문을 작성해주세요. 이때 전화번호가 NULL인 경우는 출력대상에서 제외시켜 주시고, 결과는 회원ID를 기준으로 오름차순 정렬해주세요. </p>

<hr>

<h5>예시</h5>

<p><code>MEMBER_PROFILE</code> 테이블이 다음과 같을 때</p>
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
<td><code>yoonsy94@gmail.com</code></td>
<td>윤서연</td>
<td>NULL</td>
<td>W</td>
<td>1994-03-19</td>
</tr>
</tbody>
      </table>
<p>SQL을 실행하면 다음과 같이 출력되어야 합니다.</p>
<table class="table">
        <thead><tr>
<th>MEMBER_ID</th>
<th>MEMBER_NAME</th>
<th>GENDER</th>
<th>DATE_OF_BIRTH</th>
</tr>
</thead>
        <tbody><tr>
<td><code>seoyeons@naver.com</code></td>
<td>박서연</td>
<td>W</td>
<td>1993-03-16</td>
</tr>
</tbody>
      </table>
<hr>

<h5>주의사항</h5>

<p><code>DATE_OF_BIRTH</code>의 데이트 포맷이 예시와 동일해야 정답처리 됩니다.</p>


> 출처: 프로그래머스 코딩 테스트 연습, https://programmers.co.kr/learn/challenges