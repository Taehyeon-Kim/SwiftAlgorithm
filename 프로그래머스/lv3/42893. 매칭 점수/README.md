# [level 3] 매칭 점수 - 42893 

[문제 링크](https://school.programmers.co.kr/learn/courses/30/lessons/42893#) 

### 성능 요약

메모리: 18.1 MB, 시간: 8.24 ms

### 구분

코딩테스트 연습 > 2019 KAKAO BLIND RECRUITMENT

### 채점결과

<br/>정확성: 100.0<br/>합계: 100.0 / 100.0

### 문제 설명

<h2>매칭 점수</h2>

<p>프렌즈 대학교 조교였던 제이지는 허드렛일만 시키는 네오 학과장님의 마수에서 벗어나, 카카오에 입사하게 되었다.<br>
평소에 관심있어하던 검색에 마침 결원이 발생하여, 검색개발팀에 편입될 수 있었고, 대망의 첫 프로젝트를 맡게 되었다.<br>
그 프로젝트는 검색어에 가장 잘 맞는 웹페이지를 보여주기 위해 아래와 같은 규칙으로 검색어에 대한 웹페이지의 매칭점수를 계산 하는 것이었다.</p>

<ul>
<li>한 웹페이지에 대해서 기본점수, 외부 링크 수, 링크점수, 그리고 매칭점수를 구할 수 있다.</li>
<li>한 웹페이지의 기본점수는 해당 웹페이지의 텍스트 중, 검색어가 등장하는 횟수이다. (대소문자 무시)</li>
<li>한 웹페이지의 외부 링크 수는 해당 웹페이지에서 다른 외부 페이지로 연결된 링크의 개수이다.</li>
<li>한 웹페이지의 링크점수는 해당 웹페이지로 링크가 걸린 다른 웹페이지의 기본점수 ÷ 외부 링크 수의 총합이다.</li>
<li>한 웹페이지의 매칭점수는 기본점수와 링크점수의 합으로 계산한다.</li>
</ul>

<p>예를 들어, 다음과 같이 A, B, C 세 개의 웹페이지가 있고, 검색어가 hi라고 하자.</p>

<p><img src="https://grepp-programmers.s3.amazonaws.com/files/production/48a36ec7fa/243a621b-f823-4ccd-99f1-2d8d3e14050d.jpg" title="" alt="page_rank1.png"></p>

<p>이때 A 웹페이지의 매칭점수는 다음과 같이 계산할 수 있다.</p>

<ul>
<li>기본 점수는 각 웹페이지에서 hi가 등장한 횟수이다.

<ul>
<li>A,B,C 웹페이지의 기본점수는 각각 1점, 4점, 9점이다.</li>
</ul></li>
<li>외부 링크수는 다른 웹페이지로 링크가 걸린 개수이다.

<ul>
<li>A,B,C 웹페이지의 외부 링크 수는 각각 1점, 2점, 3점이다.</li>
</ul></li>
<li>A 웹페이지로 링크가 걸린 페이지는 B와 C가 있다.

<ul>
<li>A 웹페이지의 링크점수는 B의 링크점수 2점(4 ÷ 2)과 C의 링크점수 3점(9 ÷ 3)을 더한 5점이 된다.</li>
</ul></li>
<li>그러므로, A 웹페이지의 매칭점수는 기본점수 1점 + 링크점수 5점 = 6점이 된다.</li>
</ul>

<p>검색어 word와 웹페이지의 HTML 목록인 pages가 주어졌을 때, 매칭점수가 가장 높은 웹페이지의 index를 구하라. 만약 그런 웹페이지가 여러 개라면 그중 번호가 가장 작은 것을 구하라.</p>

<h5>제한사항</h5>

<ul>
<li>pages는 HTML 형식의 웹페이지가 문자열 형태로 들어있는 배열이고, 길이는 <code>1</code> 이상 <code>20</code> 이하이다.</li>
<li>한 웹페이지 문자열의 길이는 <code>1</code> 이상 <code>1,500</code> 이하이다.</li>
<li>웹페이지의 index는 pages 배열의 index와 같으며 0부터 시작한다.</li>
<li>한 웹페이지의 url은 HTML의  태그 내에 <meta> 태그의 값으로 주어진다.

<ul>
<li>예를들어, 아래와 같은 meta tag가 있으면 이 웹페이지의 url은 <code>https://careers.kakao.com/index</code> 이다.</li>
<li><code>&lt;meta property="og:url" content="https://careers.kakao.com/index" /&gt;</code></li>
</ul></li>
<li>한 웹페이지에서 모든 외부 링크는 <code>&lt;a href="https://careers.kakao.com/index"&gt;</code>의 형태를 가진다.

<ul>
<li><code>&lt;a&gt;</code> 내에 다른 attribute가 주어지는 경우는 없으며 항상 href로 연결할 사이트의 url만 포함된다.</li>
<li>위의 경우에서 해당 웹페이지는 <code>https://careers.kakao.com/index</code> 로 외부링크를 가지고 있다고 볼 수 있다.</li>
</ul></li>
<li>모든 url은 <code>https://</code> 로만 시작한다.</li>
<li>검색어 word는 하나의 영어 단어로만 주어지며 알파벳 소문자와 대문자로만 이루어져 있다.</li>
<li>word의 길이는 <code>1</code> 이상 <code>12</code> 이하이다.</li>
<li>검색어를 찾을 때, 대소문자 구분은 무시하고 찾는다.

<ul>
<li>예를들어 검색어가 blind일 때, HTML 내에 Blind라는 단어가 있거나, BLIND라는 단어가 있으면 두 경우 모두 해당된다.</li>
</ul></li>
<li>검색어는 단어 단위로 비교하며, 단어와 완전히 일치하는 경우에만 기본 점수에 반영한다.

<ul>
<li>단어는 알파벳을 제외한 다른 모든 문자로 구분한다.</li>
<li>예를들어 검색어가 "aba" 일 때, "abab abababa"는 단어 단위로 일치하는게 없으니, 기본 점수는 0점이 된다.</li>
<li>만약 검색어가 "aba" 라면, "aba@aba aba"는 단어 단위로 세개가 일치하므로, 기본 점수는 3점이다.</li>
</ul></li>
<li>결과를 돌려줄때, 동일한 매칭점수를 가진 웹페이지가 여러 개라면 그중 index 번호가 가장 작은 것를 리턴한다

<ul>
<li>즉, 웹페이지가 세개이고, 각각 매칭점수가 3,1,3 이라면 제일 적은 index 번호인 0을 리턴하면 된다.</li>
</ul></li>
</ul>

<h5>입출력 예 #1</h5>

<ul>
<li>word : blind</li>
<li>pages :</li>
</ul>
<div class="highlight"><pre class="codehilite"><code>["<span class="nt">&lt;html</span> <span class="na">lang=</span><span class="s">\"ko\"</span> <span class="na">xml:lang=</span><span class="s">\"ko\"</span> <span class="na">xmlns=</span><span class="s">\"http://www.w3.org/1999/xhtml\"</span><span class="nt">&gt;</span>\n<span class="nt">&lt;head&gt;</span>\n  <span class="nt">&lt;meta</span> <span class="na">charset=</span><span class="s">\"utf-8\"</span><span class="nt">&gt;</span>\n  <span class="nt">&lt;meta</span> <span class="na">property=</span><span class="s">\"og:url\"</span> <span class="na">content=</span><span class="s">\"https://a.com\"/</span><span class="nt">&gt;</span>\n<span class="nt">&lt;/head&gt;</span>  \n<span class="nt">&lt;body&gt;</span>\nBlind Lorem Blind ipsum dolor Blind test sit amet, consectetur adipiscing elit. \n<span class="nt">&lt;a</span> <span class="na">href=</span><span class="s">\"https://b.com\"</span><span class="nt">&gt;</span> Link to b <span class="nt">&lt;/a&gt;</span>\n<span class="nt">&lt;/body&gt;</span>\n<span class="nt">&lt;/html&gt;</span>", "<span class="nt">&lt;html</span> <span class="na">lang=</span><span class="s">\"ko\"</span> <span class="na">xml:lang=</span><span class="s">\"ko\"</span> <span class="na">xmlns=</span><span class="s">\"http://www.w3.org/1999/xhtml\"</span><span class="nt">&gt;</span>\n<span class="nt">&lt;head&gt;</span>\n  <span class="nt">&lt;meta</span> <span class="na">charset=</span><span class="s">\"utf-8\"</span><span class="nt">&gt;</span>\n  <span class="nt">&lt;meta</span> <span class="na">property=</span><span class="s">\"og:url\"</span> <span class="na">content=</span><span class="s">\"https://b.com\"/</span><span class="nt">&gt;</span>\n<span class="nt">&lt;/head&gt;</span>  \n<span class="nt">&lt;body&gt;</span>\nSuspendisse potenti. Vivamus venenatis tellus non turpis bibendum, \n<span class="nt">&lt;a</span> <span class="na">href=</span><span class="s">\"https://a.com\"</span><span class="nt">&gt;</span> Link to a <span class="nt">&lt;/a&gt;</span>\nblind sed congue urna varius. Suspendisse feugiat nisl ligula, quis malesuada felis hendrerit ut.\n<span class="nt">&lt;a</span> <span class="na">href=</span><span class="s">\"https://c.com\"</span><span class="nt">&gt;</span> Link to c <span class="nt">&lt;/a&gt;</span>\n<span class="nt">&lt;/body&gt;</span>\n<span class="nt">&lt;/html&gt;</span>", "<span class="nt">&lt;html</span> <span class="na">lang=</span><span class="s">\"ko\"</span> <span class="na">xml:lang=</span><span class="s">\"ko\"</span> <span class="na">xmlns=</span><span class="s">\"http://www.w3.org/1999/xhtml\"</span><span class="nt">&gt;</span>\n<span class="nt">&lt;head&gt;</span>\n  <span class="nt">&lt;meta</span> <span class="na">charset=</span><span class="s">\"utf-8\"</span><span class="nt">&gt;</span>\n  <span class="nt">&lt;meta</span> <span class="na">property=</span><span class="s">\"og:url\"</span> <span class="na">content=</span><span class="s">\"https://c.com\"/</span><span class="nt">&gt;</span>\n<span class="nt">&lt;/head&gt;</span>  \n<span class="nt">&lt;body&gt;</span>\nUt condimentum urna at felis sodales rutrum. Sed dapibus cursus diam, non interdum nulla tempor nec. Phasellus rutrum enim at orci consectetu blind\n<span class="nt">&lt;a</span> <span class="na">href=</span><span class="s">\"https://a.com\"</span><span class="nt">&gt;</span> Link to a <span class="nt">&lt;/a&gt;</span>\n<span class="nt">&lt;/body&gt;</span>\n<span class="nt">&lt;/html&gt;</span>"]
</code></pre></div>
<ul>
<li>pages는 다음과 같이 3개의 웹페이지에 해당하는 HTML 문자열이 순서대로 들어있다.</li>
</ul>
<div class="highlight"><pre class="codehilite"><code>&lt;html lang="ko" xml:lang="ko" xmlns="http://www.w3.org/1999/xhtml"&gt;
&lt;head&gt;
  &lt;meta charset="utf-8"&gt;
  &lt;meta property="og:url" content="https://a.com"/&gt;
&lt;/head&gt;
&lt;body&gt;
Blind Lorem Blind ipsum dolor Blind test sit amet, consectetur adipiscing elit. 
&lt;a href="https://b.com"&gt; Link to b &lt;/a&gt;
&lt;/body&gt;
&lt;/html&gt;
</code></pre></div><div class="highlight"><pre class="codehilite"><code>&lt;html lang="ko" xml:lang="ko" xmlns="http://www.w3.org/1999/xhtml"&gt;
&lt;head&gt;
  &lt;meta charset="utf-8"&gt;
  &lt;meta property="og:url" content="https://b.com"/&gt;
&lt;/head&gt;
&lt;body&gt;
Suspendisse potenti. Vivamus venenatis tellus non turpis bibendum, 
&lt;a href="https://a.com"&gt; Link to a &lt;/a&gt;
blind sed congue urna varius. Suspendisse feugiat nisl ligula, quis malesuada felis hendrerit ut.
&lt;a href="https://c.com"&gt; Link to c &lt;/a&gt;
&lt;/body&gt;
&lt;/html&gt;
</code></pre></div><div class="highlight"><pre class="codehilite"><code>&lt;html lang="ko" xml:lang="ko" xmlns="http://www.w3.org/1999/xhtml"&gt;
&lt;head&gt;
  &lt;meta charset="utf-8"&gt;
  &lt;meta property="og:url" content="https://c.com"/&gt;
&lt;/head&gt;
&lt;body&gt;
Ut condimentum urna at felis sodales rutrum. Sed dapibus cursus diam, non interdum nulla tempor nec. Phasellus rutrum enim at orci consectetu blind
&lt;a href="https://a.com"&gt; Link to a &lt;/a&gt;
&lt;/body&gt;
&lt;/html&gt;
</code></pre></div>
<p>위의 예를 가지고 각각의 점수를 계산해보자.</p>

<ul>
<li>기본점수 및 외부 링크수는 아래와 같다.

<ul>
<li>a.com의 기본점수는 3, 외부 링크 수는 1개</li>
<li>b.com의 기본점수는 1, 외부 링크 수는 2개</li>
<li>c.com의 기본점수는 1, 외부 링크 수는 1개</li>
</ul></li>
<li>링크점수는 아래와 같다.

<ul>
<li>a.com의 링크점수는 b.com으로부터 0.5점, c.com으로부터 1점</li>
<li>b.com의 링크점수는 a.com으로부터 3점</li>
<li>c.com의 링크점수는 b.com으로부터 0.5점</li>
</ul></li>
<li>각 웹 페이지의 매칭 점수는 다음과 같다.

<ul>
<li>a.com : 4.5 점</li>
<li>b.com : 4 점</li>
<li>c.com : 1.5 점</li>
</ul></li>
</ul>

<p>따라서 매칭점수가 제일 높은 첫번째 웹 페이지의 index인 0을 리턴 하면 된다.</p>

<h5>입출력 예 #2</h5>

<ul>
<li>word : Muzi</li>
<li>pages :</li>
</ul>
<div class="highlight"><pre class="codehilite"><code>["<span class="nt">&lt;html</span> <span class="na">lang=</span><span class="s">\"ko\"</span> <span class="na">xml:lang=</span><span class="s">\"ko\"</span> <span class="na">xmlns=</span><span class="s">\"http://www.w3.org/1999/xhtml\"</span><span class="nt">&gt;</span>\n<span class="nt">&lt;head&gt;</span>\n  <span class="nt">&lt;meta</span> <span class="na">charset=</span><span class="s">\"utf-8\"</span><span class="nt">&gt;</span>\n  <span class="nt">&lt;meta</span> <span class="na">property=</span><span class="s">\"og:url\"</span> <span class="na">content=</span><span class="s">\"https://careers.kakao.com/interview/list\"/</span><span class="nt">&gt;</span>\n<span class="nt">&lt;/head&gt;</span>  \n<span class="nt">&lt;body&gt;</span>\n<span class="nt">&lt;a</span> <span class="na">href=</span><span class="s">\"https://programmers.co.kr/learn/courses/4673\"</span><span class="nt">&gt;&lt;/a&gt;</span>#!MuziMuzi!)jayg07con<span class="err">&amp;&amp;</span>\n\n<span class="nt">&lt;/body&gt;</span>\n<span class="nt">&lt;/html&gt;</span>", "<span class="nt">&lt;html</span> <span class="na">lang=</span><span class="s">\"ko\"</span> <span class="na">xml:lang=</span><span class="s">\"ko\"</span> <span class="na">xmlns=</span><span class="s">\"http://www.w3.org/1999/xhtml\"</span><span class="nt">&gt;</span>\n<span class="nt">&lt;head&gt;</span>\n  <span class="nt">&lt;meta</span> <span class="na">charset=</span><span class="s">\"utf-8\"</span><span class="nt">&gt;</span>\n  <span class="nt">&lt;meta</span> <span class="na">property=</span><span class="s">\"og:url\"</span> <span class="na">content=</span><span class="s">\"https://www.kakaocorp.com\"/</span><span class="nt">&gt;</span>\n<span class="nt">&lt;/head&gt;</span>  \n<span class="nt">&lt;body&gt;</span>\ncon%\tmuzI92apeach<span class="err">&amp;</span>2<span class="nt">&lt;a</span> <span class="na">href=</span><span class="s">\"https://hashcode.co.kr/tos\"</span><span class="nt">&gt;&lt;/a&gt;</span>\n\n\t^\n<span class="nt">&lt;/body&gt;</span>\n<span class="nt">&lt;/html&gt;</span>"]
</code></pre></div>
<ul>
<li>pages는 다음과 같이 2개의 웹페이지에 해당하는 HTML 문자열이 순서대로 들어있다.</li>
</ul>
<div class="highlight"><pre class="codehilite"><code>&lt;html lang="ko" xml:lang="ko" xmlns="http://www.w3.org/1999/xhtml"&gt;
&lt;head&gt;
  &lt;meta charset="utf-8"&gt;
  &lt;meta property="og:url" content="https://careers.kakao.com/interview/list"/&gt;
&lt;/head&gt;
&lt;body&gt;
&lt;a href="https://programmers.co.kr/learn/courses/4673"&gt;&lt;/a&gt;#!MuziMuzi!)jayg07con&amp;&amp;

&lt;/body&gt;
&lt;/html&gt;
</code></pre></div><div class="highlight"><pre class="codehilite"><code>&lt;html lang="ko" xml:lang="ko" xmlns="http://www.w3.org/1999/xhtml"&gt;
&lt;head&gt;
  &lt;meta charset="utf-8"&gt;
  &lt;meta property="og:url" content="https://www.kakaocorp.com"/&gt;
&lt;/head&gt;
&lt;body&gt;
con%    muzI92apeach&amp;2&lt;a href="https://hashcode.co.kr/tos"&gt;&lt;/a&gt;

    ^
&lt;/body&gt;
&lt;/html&gt;
</code></pre></div>
<ul>
<li>기본점수 및 외부 링크수는 아래와 같다.

<ul>
<li><code>careers.kakao.com/interview/list</code> 의 기본점수는 0, 외부 링크 수는 1개</li>
<li><code>www.kakaocorp.com</code> 의 기본점수는 1, 외부 링크 수는 1개</li>
</ul></li>
<li>링크점수는 아래와 같다.

<ul>
<li><code>careers.kakao.com/interview/list</code> 의 링크점수는 0점</li>
<li><code>www.kakaocorp.com</code> 의 링크점수는 0점</li>
</ul></li>
<li>각 웹 페이지의 매칭 점수는 다음과 같다.

<ul>
<li><code>careers.kakao.com/interview/list</code> : 0점</li>
<li><code>www.kakaocorp.com</code> : 1 점</li>
</ul></li>
</ul>

<p>따라서 매칭점수가 제일 높은 두번째 웹 페이지의 index인 1을 리턴 하면 된다.</p>


> 출처: 프로그래머스 코딩 테스트 연습, https://programmers.co.kr/learn/challenges