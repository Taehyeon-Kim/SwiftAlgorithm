# [Silver II] MVP 다이아몬드 (Easy) - 20413 

[문제 링크](https://www.acmicpc.net/problem/20413) 

### 성능 요약

메모리: 69108 KB, 시간: 8 ms

### 분류

그리디 알고리즘

### 제출 일자

2023년 10월 14일 16:09:04

### 문제 설명

<p><u><strong>입력 제한 외 난이도에 따른 문제의 차이는 없다.</strong></u></p>

<p>상민이는 게임 단풍잎이야기에 과금을 즐겨 한다. 단풍잎이야기에는 과금액에 따라 혜택을 제공하는 'MVP 등급'이 존재한다.</p>

<p>MVP 등급은 <code>브론즈(B), 실버(S), 골드(G), 플래티넘(P), 다이아몬드(D)</code>로 총 다섯 등급이 있으며, <strong>현재 달과 지난달</strong>, 즉 현재 달을 포함한 <strong>최근 2개월간의 과금액</strong>으로 결정된다.</p>

<p>단, 단풍잎이야기에는 과도한 과금을 막기 위해 '최대 과금 한도'가 있어 한 달에 최대 <strong>다이아몬드 등급 기준액</strong> 까지만 과금할 수 있으며, <strong>만원 단위로만</strong> 과금이 가능하다.</p>

<p>MVP 등급은 해당 달이 끝날 때 계산되어 책정된다. 예를 들어 아래의 표와 같은 등급 기준액을 따르고 1월에 게임을 시작한 상민이가 1월에 30만, 2월에 20만, 3월에 50만 원을 과금했다면 1월(30만)과 2월(30+20=50만)에는 실버 등급, 3월(20+50=70만)에는 골드 등급으로 책정된다.</p>

<table class="table table-bordered">
	<thead>
		<tr>
			<th align="center">MVP 등급(표기)</th>
			<th align="center">등급 기준액</th>
			<th align="center">2개월 간의 과금액</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td align="center">브론즈(B)</td>
			<td align="center">0만 원</td>
			<td align="center">0 원 ~ 29만 원</td>
		</tr>
		<tr>
			<td align="center">실버(S)</td>
			<td align="center">30만 원</td>
			<td align="center">30만 원 ~ 59만 원</td>
		</tr>
		<tr>
			<td align="center">골드(G)</td>
			<td align="center">60만 원</td>
			<td align="center">60만 원 ~ 89만 원</td>
		</tr>
		<tr>
			<td align="center">플래티넘(P)</td>
			<td align="center">90만 원</td>
			<td align="center">90만 원 ~ 149만 원</td>
		</tr>
		<tr>
			<td align="center">다이아몬드(D)</td>
			<td align="center">150만 원</td>
			<td align="center">150만 원 이상</td>
		</tr>
	</tbody>
</table>

<p><표1> 위 예시의 등급 기준표 (예제1)</p>

<p>상민이는 게임을 시작하고 <em>N</em>개월 동안 수많은 현금을 과금해왔다. 상민이는 이 사실을 자신의 여자친구에만큼은 철저히 비밀로 하고 있었다. 상민이의 여자친구는 상민이가 게임에 과금하는 것을 매우 싫어했기 때문이다. 그러던 어느 날 문제가 발생했다. 상민이의 여자친구에게 <em>N</em>개월간의 MVP 등급 기록이 유출된 것이다!</p>

<p>상민이의 여자친구는 상민의 과금액을 역추적하기 위해 당신에게 부탁했다.</p>

<blockquote>
<p>상민이의 여자친구: 상민이가 게임에 <strong>최대</strong> 얼마나 과금한건지 알려줘.</p>
</blockquote>

<p>둘 사이에 어떤 일이 벌어질지는 모르겠지만, 당신은 상민이의 여자친구를 위한 프로그램을 작성해야만 한다.</p>

### 입력 

 <p>첫 번째 줄에는 게임을 플레이 한 개월수 <em>N</em>이 주어진다.</p>

<p>두 번째 줄에는 실버, 골드, 플래티넘, 다이아몬드 등급 기준액 <em>s</em>, <em>g</em>, <em>p</em>, <em>d</em>가 <strong>만원 단위로</strong> 순서대로 주어진다. 브론즈 등급 기준액은 0 원이다.</p>

<p>세 번째 줄에는 게임을 플레이 한 첫 번째 달부터 <em>N</em> 번째 달까지의 MVP 등급이 등급 표기대로 주어진다. 기록과 같은 MVP 등급 달성이 불가능한 경우는 주어지지 않는다.</p>

### 출력 

 <p>입력된 MVP 등급을 달성하기 위한 <strong>최대</strong> 누적 과금액을 만원 단위로 출력한다.</p>

