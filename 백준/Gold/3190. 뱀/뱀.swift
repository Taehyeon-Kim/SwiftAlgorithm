/*
사과를 먹으면 뱀 길이가 늘어난다.
벽 또는 자기자신의 몸과 부딪히면 게임이 끝난다.

뱀은 처음에 맨위 맨좌측에 위치하고, 뱀의 길이는 1이다.
뱀은 처음에 오른쪽을 향한다.

매초마다 규칙 3단계
먼저 뱀은 몸길이를 늘려 머리를 다음칸에 위치시킨다.
만약 이동한 칸에 사과가 있다면, 그 칸에 있던 사과가 없어지고 꼬리는 움직이지 않는다.
만약 이동한 칸에 사과가 없다면, 몸길이를 줄여서 꼬리가 위치한 칸을 비워준다. 즉, 몸길이는 변하지 않는다.

목표
- 사과의 위치와 뱀의 이동경로가 주어질 때 이 게임이 몇 초에 끝나는지 계산하라.

6    보드 크기 n
3    사과 개수 k
3 4  행 열
2 5
5 3

3    방향 변환 횟수 l
3 D  x, c : 3초 후에 오른쪽으로 90도 회전
15 L
17 D

1. 사과 위치 시킨 보드 구성 -> board, map
2. 방향 변환 횟수 배열 구성(딕셔너리로 구성)
3. 방향 변환 횟수 배열을 탐색하는 루프 구성

  3-1. 매초마다 현재 설정된 방향으로 한칸이동 (x++ or y++)
      if time++
      if 이동한 칸이 벽 또는 몸이면 게임 종료
      if 이동한 칸에 사과 있으면 꼬리는 움직이지 않음 -> 뱀 길이 증가
      if 이동한 칸에 사과 없으면 꼬리쪽을 한칸 줄임 -> 이동
  3-2. 시간 체크 몇 초 후에 특정 방향으로 방향 전환 (이동과 독립적)
      if 현재 오른쪽 -> l : x--, d : x++
      if 현재 왼쪽  -> l : x++, d : x--
      if 현재 아래 -> l : y++, d : y--
      if 현재 위 -> l : y--, d : y++

0 0 0 x 0 0
0 0 0 0 a 0
0 0 0 a 0 0
0 0 0 0 0 0
0 0 a x 0 0
0 0 0 x 0 0
*/

let n = Int(readLine()!)!
let k = Int(readLine()!)!

var board = Array(repeating: Array(repeating: 0, count: n), count: n)
var d = Array(repeating: Array(repeating: (0, 1), count: n), count: n)

for _ in stride(from: 0, to: k, by: 1) {
  let apple = readLine()!.split(separator: " ").compactMap{Int(String($0))}
  let (r, c) = (apple[0] - 1, apple[1] - 1)
  board[r][c] = 2  // 사과를 2로 표시
}

var dir = [Int: String]()
let l = Int(readLine()!)!

for _ in 0..<l {
  let input = readLine()!.split(separator: " ").map{String($0)}
  let (x, c) = (Int(input[0])!, input[1])
  dir[x, default: ""] = c
}

// 보드, 방향 전환 배열 구성
// print(board, dir)

func solution() -> Int {
  var time = 0
  var go = (0, 1)  // 시작 방향 : 우측
  var head = (0, 0)  // 머리
  var tail = (0, 0)  // 꼬리
  board[0][0] = 1     // 뱀 시작 지점(뱀 == 1)

  while true {
    time += 1  // 시간 증가
    let tail_go = d[tail.0][tail.1]
    let nxt = (head.0 + go.0, head.1 + go.1)

    // 벽이면 종료
    if !((0..<n) ~= nxt.0 && (0..<n) ~= nxt.1) { break }

    // 자기 몸이면 종료
    if board[nxt.0][nxt.1] == 1 { break }

    // 다음 칸에 사과 있으면
    if board[nxt.0][nxt.1] == 2 {
      board[nxt.0][nxt.1] = 1
      head = (nxt.0, nxt.1)
    } else if board[nxt.0][nxt.1] == 0 {
      board[nxt.0][nxt.1] = 1
      head = (nxt.0, nxt.1)
      // 꼬리
      board[tail.0][tail.1] = 0
      tail = (tail.0 + tail_go.0, tail.1 + tail_go.1)
    }

    /// 방향 전환
    /*
      3-2. 시간 체크 몇 초 후에 특정 방향으로 방향 전환 (이동과 독립적)
      if 현재 오른쪽 -> l : x--, d : x++
      if 현재 왼쪽  -> l : x++, d : x--
      if 현재 아래 -> l : y++, d : y--
      if 현재 위 -> l : y--, d : y++
    */

    d[head.0][head.1] = go
    if let direction = dir[time] {

      // 우
      if go == (0, 1) {
        if direction == "L" {
          d[head.0][head.1] = (-1, 0)
        }
        if direction == "D" {
          d[head.0][head.1] = (1, 0)
        }
      }

      // 좌
      else if go == (0, -1) {
        if direction == "L" {
          d[head.0][head.1] = (1, 0)
        }
        if direction == "D" {
          d[head.0][head.1] = (-1, 0)
        }
      }

      else if go == (1, 0) {
        if direction == "L" {
          d[head.0][head.1] = (0, 1)
        }
        if direction == "D" {
          d[head.0][head.1] = (0, -1)
        }
      }

      else if go == (-1, 0) {
        if direction == "L" {
          d[head.0][head.1] = (0, -1)
        }
        if direction == "D" {
          d[head.0][head.1] = (0, 1)
        }
      }

      go = d[head.0][head.1]
    }
  }

  return time
}

let time = solution()
print(time)