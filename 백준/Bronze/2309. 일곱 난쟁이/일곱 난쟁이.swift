/*
1. 빠르게 읽기
- 토탈 난쟁이 9명
- 7난쟁이의 키 합 equal 100
- 일곱 난쟁이를 찾아라

입력
- 각 난쟁이의 키가 

출력
- 7난쟁이의 키를 출력하라
- 조건 : 오름차순 출력

2. 문제 분석
9명 중 7명을 뽑는 경우의 수
2의 9승 => 백트래킹으로 접근 가능

3. 전략
백트래킹

4. 손코딩
a: [Int] <- 키 입력

func dfs(idx: int,  arr: [int])
  if arr.count == 7
    sum(arr) == 100 -> print
    return

  dfs(idx+1, arr)
  dfs(idx+1, arr+a[idx])
*/

var a = [Int]()
for _ in 0..<9 {
  a.append(Int(readLine()!)!)
}

var ans = [Int]()
func dfs(_ idx: Int, _ arr: [Int]) {
  if idx == 9 {
    if arr.count == 7 && arr.reduce(0, +) == 100 { ans = arr }
    return
  }

  dfs(idx+1, arr)
  dfs(idx+1, arr+[a[idx]])
}
dfs(0,[])

ans.sort()
ans.forEach {
  print($0)
}