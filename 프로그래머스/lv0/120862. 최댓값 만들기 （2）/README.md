# [level 0] 최댓값 만들기 (2) - 120862 

[문제 링크](https://school.programmers.co.kr/learn/courses/30/lessons/120862) 

### 성능 요약

메모리: 16.1 MB, 시간: 0.02 ms

### 구분

코딩테스트 연습 > 코딩테스트 입문

### 채점결과

<br/>정확성: 100.0<br/>합계: 100.0 / 100.0

### 문제 설명

<p>정수 배열 <code>numbers</code>가 매개변수로 주어집니다. <code>numbers</code>의 원소 중 두 개를 곱해 만들 수 있는 최댓값을 return하도록 solution 함수를 완성해주세요.</p>

<hr>

<h5>제한사항</h5>

<ul>
<li>-10,000 ≤ <code>numbers</code>의 원소 ≤ 10,000</li>
<li>2 ≤ <code>numbers</code> 의 길이 ≤ 100</li>
</ul>

<hr>

<h5>입출력 예</h5>
<table class="table">
        <thead><tr>
<th>numbers</th>
<th>result</th>
</tr>
</thead>
        <tbody><tr>
<td>[1, 2, -3, 4, -5]</td>
<td>15</td>
</tr>
<tr>
<td>[0, -31, 24, 10, 1, 9]</td>
<td>240</td>
</tr>
<tr>
<td>[10, 20, 30, 5, 5, 20, 5]</td>
<td>600</td>
</tr>
</tbody>
      </table>
<hr>

<h5>입출력 예 설명</h5>

<p>입출력 예 #1</p>

<ul>
<li>두 수의 곱중 최댓값은 -3 * -5 = 15 입니다.</li>
</ul>

<p>입출력 예 #2</p>

<ul>
<li>두 수의 곱중 최댓값은 10 * 24 = 240 입니다.</li>
</ul>

<p>입출력 예 #3</p>

<ul>
<li>두 수의 곱중 최댓값은 20 * 30 = 600 입니다.</li>
</ul>


> 출처: 프로그래머스 코딩 테스트 연습, https://programmers.co.kr/learn/challenges