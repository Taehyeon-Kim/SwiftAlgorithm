# [unrated] 조건에 맞는 도서 리스트 출력하기 - 144853 

[문제 링크](https://school.programmers.co.kr/learn/courses/30/lessons/144853) 

### 성능 요약

메모리: 0.0 MB, 시간: 0.00 ms

### 구분

코딩테스트 연습 > SELECT

### 채점결과

Empty

### 문제 설명

<p>다음은 어느 한 서점에서 판매중인 도서들의 도서 정보(<code>BOOK</code>) 테이블입니다.</p>

<p><code>BOOK</code> 테이블은 각 도서의 정보를 담은 테이블로 아래와 같은 구조로 되어있습니다.</p>
<table class="table">
        <thead><tr>
<th>Column name</th>
<th>Type</th>
<th>Nullable</th>
<th>Description</th>
</tr>
</thead>
        <tbody><tr>
<td>BOOK_ID</td>
<td>INTEGER</td>
<td>FALSE</td>
<td>도서 ID</td>
</tr>
<tr>
<td>CATEGORY</td>
<td>VARCHAR(N)</td>
<td>FALSE</td>
<td>카테고리 (경제, 인문, 소설, 생활, 기술)</td>
</tr>
<tr>
<td>AUTHOR_ID</td>
<td>INTEGER</td>
<td>FALSE</td>
<td>저자 ID</td>
</tr>
<tr>
<td>PRICE</td>
<td>INTEGER</td>
<td>FALSE</td>
<td>판매가 (원)</td>
</tr>
<tr>
<td>PUBLISHED_DATE</td>
<td>DATE</td>
<td>FALSE</td>
<td>출판일</td>
</tr>
</tbody>
      </table>
<hr>

<h5>문제</h5>

<p><code>BOOK</code> 테이블에서 <code>2021년</code>에 출판된 <code>'인문'</code> 카테고리에 속하는 도서 리스트를 찾아서 도서 ID(<code>BOOK_ID</code>), 출판일 (<code>PUBLISHED_DATE</code>)을 출력하는 SQL문을 작성해주세요. <br>
결과는 출판일을 기준으로 오름차순 정렬해주세요.</p>

<hr>

<h5>예시</h5>

<p>예를 들어 <code>BOOK</code> 테이블이 다음과 같다면</p>
<table class="table">
        <thead><tr>
<th>BOOK_ID</th>
<th>CATEGORY</th>
<th>AUTHOR_ID</th>
<th>PRICE</th>
<th>PUBLISHED_DATE</th>
</tr>
</thead>
        <tbody><tr>
<td>1</td>
<td>인문</td>
<td>1</td>
<td>10000</td>
<td>2020-01-01</td>
</tr>
<tr>
<td>2</td>
<td>경제</td>
<td>2</td>
<td>9000</td>
<td>2021-02-05</td>
</tr>
<tr>
<td>3</td>
<td>인문</td>
<td>2</td>
<td>11000</td>
<td>2021-04-11</td>
</tr>
<tr>
<td>4</td>
<td>인문</td>
<td>3</td>
<td>10000</td>
<td>2021-03-15</td>
</tr>
<tr>
<td>5</td>
<td>생활</td>
<td>1</td>
<td>12000</td>
<td>2021-01-10</td>
</tr>
</tbody>
      </table>
<p>조건에 속하는 도서는 도서 ID 가 3, 4인 도서이므로 다음과 같습니다.</p>
<table class="table">
        <thead><tr>
<th>BOOK_ID</th>
<th>PUBLISHED_DATE</th>
</tr>
</thead>
        <tbody><tr>
<td>3</td>
<td>2021-04-11</td>
</tr>
<tr>
<td>4</td>
<td>2021-03-15</td>
</tr>
</tbody>
      </table>
<p>그리고 출판일 오름차순으로 정렬하여야 하므로 다음과 같은 결과가 나와야 합니다.</p>
<table class="table">
        <thead><tr>
<th>BOOK_ID</th>
<th>PUBLISHED_DATE</th>
</tr>
</thead>
        <tbody><tr>
<td>4</td>
<td>2021-03-15</td>
</tr>
<tr>
<td>3</td>
<td>2021-04-11</td>
</tr>
</tbody>
      </table>
<hr>

<h5>주의사항</h5>

<p><code>PUBLISHED_DATE</code>의 데이트 포맷이 예시와 동일해야 정답처리 됩니다.</p>


> 출처: 프로그래머스 코딩 테스트 연습, https://programmers.co.kr/learn/challenges