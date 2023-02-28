# [Gold V] 무기 공학 - 18430 

[문제 링크](https://www.acmicpc.net/problem/18430) 

### 성능 요약

메모리: 69112 KB, 시간: 52 ms

### 분류

백트래킹(backtracking)

### 문제 설명

<p>공학자 길동이는 외부의 침략으로부터 마을을 지킬 수 있는 부메랑 무기를 개발하는 공학자다. 길동이는 부메랑 제작을 위한 고급 나무 재료를 구했다. 이 나무 재료는 <em>N</em>x<em>M</em>크기의 직사각형 형태이며 나무 재료의 부위마다 그 강도가 조금씩 다르다.</p>

<p>예를 들어 나무 재료의 크기가 2x3일 때는 다음과 같이 총 6칸으로 구성된다.</p>

<p style="text-align: center;"><img alt="" src="https://upload.acmicpc.net/3208f921-d909-4eb9-b835-168a536d9486/-/preview/" style="width: 180px; height: 123px;"></p>

<p style="text-align: justify;">길동이는 이처럼 넓은 사각형 형태의 나무 재료를 잘라서 여러 개의 부메랑을 만들고자 한다. 그리고 부메랑은 항상 3칸을 차지하는 ‘ㄱ’모양으로 만들어야 한다. 따라서 부메랑의 가능한 모양은 다음과 같이 총 4가지다.</p>

<p style="text-align: center;"><img alt="" src="https://upload.acmicpc.net/7de86638-70db-46fd-af85-c412840b167a/-/preview/" style="height: 119px; width: 600px;"></p>

<p style="text-align: justify;">이때 부메랑의 중심이 되는 칸은 강도의 영향을 2배로 받는다. 위 그림에서 노란색으로 칠한 부분이 ‘중심이 되는 칸’이다. 예를 들어 앞선 예시에서는 다음과 같이 2개의 부메랑을 만들 수 있으며, 이때 만들어지는 부메랑들의 강도의 합은 46으로 이보다 강도의 합이 높아지는 경우는 없다.</p>

<p style="text-align: center;"><img alt="" src="https://upload.acmicpc.net/4ac5c361-e4fb-478f-a942-db508cd7a1e5/-/preview/" style="height: 126px; width: 300px;"></p>

<p style="text-align: justify;">또한 나무 재료의 특정 위치는 아예 사용하지 않아도 괜찮다. 예를 들어 앞선 예시에서 다음과 같이 1개의 부메랑만을 만들어도 괜찮다. 다만, 이렇게 만들게 되면 부메랑들의 강도의 합이 18이 되기 때문에 비효율적이다.</p>

<p style="text-align: center;"><img alt="" src="https://upload.acmicpc.net/bc05a2e2-d06c-4905-80f4-809ec99a74ca/-/preview/" style="height: 121px; width: 120px;"></p>

<p style="text-align: justify;">나무 재료의 형태와 각 칸의 강도가 주어졌을 때, 길동이가 만들 수 있는 부메랑들의 강도 합의 최댓값을 출력하는 프로그램을 작성하시오. </p>

### 입력 

 <p>첫째 줄에는 길동이가 가지고 있는 나무 재료의 세로, 가로 크기를 의미하는 두 자연수 <em>N</em>, <em>M</em>이 주어진다. (1 ≤ <em>N</em>, <em>M </em>≤ 5) 다음 N개의 줄에 걸쳐서, 매 줄마다 나무 재료의 각 위치의 강도를 나타내는 <em>M</em>개의 자연수 <em>K</em>가 공백을 기준으로 구분되어 주어진다. (1 ≤ <em>K</em> ≤ 100)</p>

### 출력 

 <p>첫째 줄에 길동이가 만들 수 있는 부메랑들의 강도 합의 최댓값을 출력한다.</p>

<p>단, 나무 재료의 크기가 작아서 부메랑을 하나도 만들 수 없는 경우는 0을 출력한다.</p>

