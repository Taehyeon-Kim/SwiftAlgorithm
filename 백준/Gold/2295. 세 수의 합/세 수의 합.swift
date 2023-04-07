/* 1. 문제 파악 및 정의
집합 U에서 세수를 골랐을 때 그 합이 U에 포함되는 경우, 그 중에서 가장 큰 값을 구하라.

- 세수의 합을 계산
- 세수의 합이 집합에 포함되어있는지 탐색 후 갱신

좀 더 문장을 다듬으면(바킹독님 강의 참고)
a[i] + a[j] + a[k] = a[l]을 만족하는 a[l]중에서 최댓값

2. 아이디어
- 1) 완전탐색으로 세수의 조합을 구한다?
- -- 그런후에 집합을 전체 for문으로 돌면서 탐색한다.
- -- O(N^4) -> 딱봐도 시간초과 -> 완전탐색 불가
- -- 그럼 효율적인 방법을 찾아야 함
- 2) 다른 풀이를 찾아야 함
- 2개의 수의 조합을 모두 찾은 후에 -> n^2 for loop
- 하나씩 더해가면서 3개의 수의 합을 만들고
- 2개의 수의 조합에 대해서 탐색을 진행하는데 이분탐색의 방법으로 진행한다. -> log(N^2)

결국 시간 복잡도는 O(N^2 * lgN) = 1000000 * 3 = 3,000,000 -> 3백만정도
*/

// input
let n = Int(readLine()!)!
var a = [Int]()
for _ in 0..<n {
  a.append(Int(readLine()!)!)
}
a = a.sorted()  // 오름차순 정렬

/*
1 4 6
*/

var twos = [Int]() // 두수의 합 2 * for
for i in 0..<n {
  for j in i..<n {
    twos.append(a[i] + a[j])
  }
}
twos = twos.sorted()

let two_sum = Set(twos)
var ans = 0
for i in stride(from: n-1, to: -1, by: -1) {
  for j in stride(from: 0, to: i, by: 1) {
    if two_sum.contains(a[i] - a[j]) {
      ans = max(ans, a[i])
    }
  }
}
print(ans)