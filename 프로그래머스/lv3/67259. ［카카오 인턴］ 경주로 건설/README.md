# [level 3] [카카오 인턴] 경주로 건설 - 67259 

[문제 링크](https://school.programmers.co.kr/learn/courses/30/lessons/67259?language=swift) 

### 성능 요약

메모리: 16.3 MB, 시간: 0.06 ms

### 구분

코딩테스트 연습 > 2020 카카오 인턴십

### 채점결과

<br/>정확성: 100.0<br/>합계: 100.0 / 100.0

### 문제 설명

<p><img src="https://grepp-programmers.s3.ap-northeast-2.amazonaws.com/files/production/384b9e2a-4eb5-460d-bce2-d12359b03b14/kakao_road1.png" title="" alt="kakao_road1.png"></p>

<p>건설회사의 설계사인 <code>죠르디</code>는 고객사로부터 자동차 경주로 건설에 필요한 견적을 의뢰받았습니다.<br>
제공된 경주로 설계 도면에 따르면 경주로 부지는 <code>N x N</code> 크기의 정사각형 격자 형태이며 각 격자는 <code>1 x 1</code> 크기입니다.<br>
설계 도면에는 각 격자의 칸은 <code>0</code> 또는 <code>1</code> 로 채워져 있으며, <code>0</code>은 칸이 비어 있음을 <code>1</code>은 해당 칸이 벽으로 채워져 있음을 나타냅니다.<br>
경주로의 출발점은 (0, 0) 칸(좌측 상단)이며, 도착점은 (N-1, N-1) 칸(우측 하단)입니다. 죠르디는 출발점인 (0, 0) 칸에서 출발한 자동차가 도착점인 (N-1, N-1) 칸까지 무사히 도달할 수 있게 중간에 끊기지 않도록 경주로를 건설해야 합니다.<br>
경주로는 상, 하, 좌, 우로 인접한 두 빈 칸을 연결하여 건설할 수 있으며, 벽이 있는 칸에는 경주로를 건설할 수 없습니다.<br>
이때, 인접한 두 빈 칸을 상하 또는 좌우로 연결한 경주로를 <code>직선 도로</code> 라고 합니다.<br>
또한 두 <code>직선 도로</code>가 서로 직각으로 만나는 지점을 <code>코너</code> 라고 부릅니다.<br>
건설 비용을 계산해 보니 <code>직선 도로</code> 하나를 만들 때는 100원이 소요되며, <code>코너</code>를 하나 만들 때는 500원이 추가로 듭니다.<br>
죠르디는 견적서 작성을 위해 경주로를 건설하는 데 필요한 최소 비용을 계산해야 합니다.</p>

<p>예를 들어, 아래 그림은 <code>직선 도로</code> 6개와 <code>코너</code> 4개로 구성된 임의의 경주로 예시이며, 건설 비용은 6 x 100 + 4 x 500 = 2600원 입니다.</p>

<p><img src="https://grepp-programmers.s3.ap-northeast-2.amazonaws.com/files/production/0e0911e8-f88e-44fe-8bdc-6856a56df8e0/kakao_road2.png" title="" alt="kakao_road2.png"></p>

<p>또 다른 예로, 아래 그림은 <code>직선 도로</code> 4개와 <code>코너</code> 1개로 구성된 경주로이며, 건설 비용은 4 x 100 + 1 x 500 = 900원 입니다.</p>

<p><img src="https://grepp-programmers.s3.ap-northeast-2.amazonaws.com/files/production/3f5d9c5e-d7d9-4248-b111-140a0847e741/kakao_road3.png" title="" alt="kakao_road3.png"></p>

<hr>

<p>도면의 상태(0은 비어 있음, 1은 벽)을 나타내는 2차원 배열 board가 매개변수로 주어질 때, 경주로를 건설하는데 필요한 최소 비용을 return 하도록 solution 함수를 완성해주세요.</p>

<h5><strong>[제한사항]</strong></h5>

<ul>
<li>board는 2차원 정사각 배열로 배열의 크기는 3 이상 25 이하입니다.</li>
<li>board 배열의 각 원소의 값은 0 또는 1 입니다.

<ul>
<li>도면의 가장 왼쪽 상단 좌표는 (0, 0)이며, 가장 우측 하단 좌표는 (N-1, N-1) 입니다.</li>
<li>원소의 값 0은 칸이 비어 있어 도로 연결이 가능함을 1은 칸이 벽으로 채워져 있어 도로 연결이 불가능함을 나타냅니다.</li>
</ul></li>
<li>board는 항상 출발점에서 도착점까지 경주로를 건설할 수 있는 형태로 주어집니다.</li>
<li>출발점과 도착점 칸의 원소의 값은 항상 0으로 주어집니다.</li>
</ul>

<hr>

<h5><strong>입출력 예</strong></h5>
<table class="table">
        <thead><tr>
<th>board</th>
<th>result</th>
</tr>
</thead>
        <tbody><tr>
<td>[[0,0,0],[0,0,0],[0,0,0]]</td>
<td>900</td>
</tr>
<tr>
<td>[[0,0,0,0,0,0,0,1],[0,0,0,0,0,0,0,0],[0,0,0,0,0,1,0,0],[0,0,0,0,1,0,0,0],[0,0,0,1,0,0,0,1],[0,0,1,0,0,0,1,0],[0,1,0,0,0,1,0,0],[1,0,0,0,0,0,0,0]]</td>
<td>3800</td>
</tr>
<tr>
<td>[[0,0,1,0],[0,0,0,0],[0,1,0,1],[1,0,0,0]]</td>
<td>2100</td>
</tr>
<tr>
<td>[[0,0,0,0,0,0],[0,1,1,1,1,0],[0,0,1,0,0,0],[1,0,0,1,0,1],[0,1,0,0,0,1],[0,0,0,0,0,0]]</td>
<td>3200</td>
</tr>
</tbody>
      </table>
<h5><strong>입출력 예에 대한 설명</strong></h5>

<p><strong>입출력 예 #1</strong></p>

<p>본문의 예시와 같습니다.</p>

<p><strong>입출력 예 #2</strong></p>

<p><img src="https://grepp-programmers.s3.ap-northeast-2.amazonaws.com/files/production/ccc72e9c-2e22-4a09-a94b-ff057b081a70/kakao_road4.png" title="" alt="kakao_road4.png"></p>

<p>위와 같이 경주로를 건설하면 <code>직선 도로</code> 18개, <code>코너</code> 4개로 총 3800원이 듭니다.</p>

<p><strong>입출력 예 #3</strong></p>

<p><img src="https://grepp-programmers.s3.ap-northeast-2.amazonaws.com/files/production/422e86e0-a7d7-4a09-9b42-2b6218a9b5f0/kakao_road5.png" title="" alt="kakao_road5.png"></p>

<p>위와 같이 경주로를 건설하면 <code>직선 도로</code> 6개, <code>코너</code> 3개로 총 2100원이 듭니다.</p>

<p><strong>입출력 예 #4</strong></p>

<p><img src="https://grepp-programmers.s3.ap-northeast-2.amazonaws.com/files/production/4fe42f47-2592-4cb8-91fb-31d6a6da8639/kakao_road6.png" title="" alt="kakao_road6.png"></p>

<p>붉은색 경로와 같이 경주로를 건설하면 <code>직선 도로</code> 12개, <code>코너</code> 4개로 총 3200원이 듭니다.<br>
만약, 파란색 경로와 같이 경주로를 건설한다면 <code>직선 도로</code> 10개, <code>코너</code> 5개로 총 3500원이 들며, 더 많은 비용이 듭니다.</p>

<hr>

<p>※ 공지 - 2021년 8월 30일 테스트케이스가 추가되었습니다.</p>


> 출처: 프로그래머스 코딩 테스트 연습, https://programmers.co.kr/learn/challenges