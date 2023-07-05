/*
1. 읽기
트럭 3대 --> 고정
주차 비용
트럭 수에 따라 주차 요금 할인
1대주차 -> a원
2대주차 -> b원
3대주차 -> c원

2. 문제 분석
tc -> 그림으로 분석해야함
5 3 1 // a b c

1 2 3 4 5 6 7 8
---------
    ---
  -----------

3. 전략
구현
1 : 5 1 = 5
2 : 3 2 = 6
3 : 1 3 = 3
4 : 1 3 = 3
5 : 3 2 = 6
6 : 5 1 = 5
7 : 5 1 = 5

4. 손코딩
차 배열 초기화
arr = [[int]]() // 4행 101열

값 채워넣기
for i in 1...3
  let input = readLine()!.split().map{int}
  for j in (input[0]..<input[1])
    arr[i][j] = 1

for i in 1...100 {
  let cnt = arr[1][i] + arr[2][i] + arr[3][i]
  if cnt == 1 { sum += a * cnt }
  if cnt == 2 { sum += b * cnt }
  if cnt == 3 { sum += c * cnt }
}
..
*/

let abc = readLine()!.split{$0 == " "}.compactMap{Int(String($0))}
let (a,b,c) = (abc[0],abc[1],abc[2])

var arr = [[Int]](repeating: [Int](repeating: 0, count: 102), count: 4)

// 초기화
for i in 1...3 {
  let line = readLine()!.split{$0 == " "}.compactMap{Int(String($0))}
  for j in (line[0]..<line[1]) {
    arr[i][j] = 1
  }
}

// 계산
var ans = 0
for i in 1...100 {
  let cnt = arr[1][i] + arr[2][i] + arr[3][i]
  if cnt == 1 { ans += a*cnt }
  else if cnt == 2 { ans += b*cnt }
  else if cnt == 3 { ans += c*cnt }
}
print(ans)