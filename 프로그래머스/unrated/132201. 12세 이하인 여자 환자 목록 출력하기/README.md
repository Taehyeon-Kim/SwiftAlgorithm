# [unrated] 12세 이하인 여자 환자 목록 출력하기 - 132201 

[문제 링크](https://school.programmers.co.kr/learn/courses/30/lessons/132201) 

### 성능 요약

메모리: 0.0 MB, 시간: 0.00 ms

### 구분

코딩테스트 연습 > SELECT

### 채점결과

Empty

### 문제 설명

<p>다음은 종합병원에 등록된 환자정보를 담은 <code>PATIENT</code> 테이블입니다. <code>PATIENT</code> 테이블은 다음과 같으며 <code>PT_NO</code>, <code>PT_NAME</code>, <code>GEND_CD</code>, <code>AGE</code>, <code>TLNO</code>는 각각 환자번호, 환자이름, 성별코드, 나이, 전화번호를 의미합니다.</p>
<table class="table">
        <thead><tr>
<th>Column name</th>
<th>Type</th>
<th>Nullable</th>
</tr>
</thead>
        <tbody><tr>
<td>PT_NO</td>
<td>VARCHAR(10)</td>
<td>FALSE</td>
</tr>
<tr>
<td>PT_NAME</td>
<td>VARCHAR(20)</td>
<td>FALSE</td>
</tr>
<tr>
<td>GEND_CD</td>
<td>VARCHAR(1)</td>
<td>FALSE</td>
</tr>
<tr>
<td>AGE</td>
<td>INTEGER</td>
<td>FALSE</td>
</tr>
<tr>
<td>TLNO</td>
<td>VARCHAR(50)</td>
<td>TRUE</td>
</tr>
</tbody>
      </table>
<hr>

<h5>문제</h5>

<p><code>PATIENT</code> 테이블에서 12세 이하인 여자환자의 환자이름, 환자번호, 성별코드, 나이, 전화번호를 조회하는 SQL문을 작성해주세요. 이때 전화번호가 없는 경우, 'NONE'으로 출력시켜 주시고 결과는 나이를 기준으로 내림차순 정렬하고, 나이 같다면 환자이름을 기준으로 오름차순 정렬해주세요.</p>

<hr>

<h5>예시</h5>

<p><code>PATIENT</code> 테이블이 다음과 같을 때</p>
<table class="table">
        <thead><tr>
<th>PT_NO</th>
<th>PT_NAME</th>
<th>GEND_CD</th>
<th>AGE</th>
<th>TLNO</th>
</tr>
</thead>
        <tbody><tr>
<td>PT22000003</td>
<td>브라운</td>
<td>M</td>
<td>18</td>
<td>01031246641</td>
</tr>
<tr>
<td>PT22000004</td>
<td>크롱</td>
<td>M</td>
<td>7</td>
<td>NULL</td>
</tr>
<tr>
<td>PT22000006</td>
<td>뽀뽀</td>
<td>W</td>
<td>8</td>
<td>NULL</td>
</tr>
<tr>
<td>PT22000009</td>
<td>한나</td>
<td>W</td>
<td>12</td>
<td>01032323117</td>
</tr>
<tr>
<td>PT22000012</td>
<td>뿡뿡이</td>
<td>M</td>
<td>5</td>
<td>NULL</td>
</tr>
<tr>
<td>PT22000013</td>
<td>크리스</td>
<td>M</td>
<td>30</td>
<td>01059341192</td>
</tr>
<tr>
<td>PT22000014</td>
<td>토프</td>
<td>W</td>
<td>22</td>
<td>01039458213</td>
</tr>
<tr>
<td>PT22000018</td>
<td>안나</td>
<td>W</td>
<td>11</td>
<td>NULL</td>
</tr>
<tr>
<td>PT22000019</td>
<td>바라</td>
<td>W</td>
<td>10</td>
<td>01079068799</td>
</tr>
<tr>
<td>PT22000021</td>
<td>릴로</td>
<td>W</td>
<td>33</td>
<td>01023290767</td>
</tr>
</tbody>
      </table>
<p>SQL을 실행하면 다음과 같이 출력되어야 합니다.</p>
<table class="table">
        <thead><tr>
<th>PT_NAME</th>
<th>PT_NO</th>
<th>GEND_CD</th>
<th>AGE</th>
<th>TLNO</th>
</tr>
</thead>
        <tbody><tr>
<td>한나</td>
<td>PT22000009</td>
<td>W</td>
<td>12</td>
<td>01032323117</td>
</tr>
<tr>
<td>안나</td>
<td>PT22000018</td>
<td>W</td>
<td>11</td>
<td>NONE</td>
</tr>
<tr>
<td>바라</td>
<td>PT22000019</td>
<td>W</td>
<td>10</td>
<td>01079068799</td>
</tr>
<tr>
<td>뽀뽀</td>
<td>PT22000006</td>
<td>W</td>
<td>8</td>
<td>NONE</td>
</tr>
</tbody>
      </table>

> 출처: 프로그래머스 코딩 테스트 연습, https://programmers.co.kr/learn/challenges