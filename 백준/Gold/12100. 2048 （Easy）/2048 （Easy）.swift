/*
목표: 5번 움직였을 때 얻을 수 있는 가장 큰 블록
== 모든 경우의 수 중에서 가장 큰 블록 찾기

한쪽방향으로 움직이는 것을 어떻게 처리할지가 관건
< 왼쪽으로 움직인다면 >
- 1행 (1열의 블록부터 움직일수있는만큼 움직인다.)
- 1행 (2열의 블록도 움직일수있는만큼 움직이는데 왼쪽에 있는 값이 같은 값이면 충돌한다. 한번 충돌하면 그 뒤로는 충돌불가)

0) 움직일 수 있는만큼 움직인다. -> 벽을 만날때까지 이동 -> loop
1) 충돌여부 o
  1-1) 멈추기(같은 값이라고 하더라도 멈춰있기)

2) 충돌여부 x
  2-1) 같은값 -> 합쳐지기
  2-2) 다른값 -> 멈추기

- 매순간 상하좌우 4방향으로 이동가능
- 최대 5번 이동
- 4^5 = 2^10 = 1024
- 모든 경우 찾아도 괜찮을듯

- 재귀로 풀고 마지막 횟수에서 최댓값 찾아서 갱신하기
*/

let n = Int(readLine()!)!
var map = [[Int]]()

for _ in 0..<n {
  let line = readLine()!.split(separator: " ").compactMap{Int(String($0))}
  map.append(line)
}

// 왼쪽으로 밀기, 나머지 방향에 대해서는 보드 자체를 회전
func moveToLeft(_ board: [[Int]]) -> [[Int]] {
  var ret = [[Int]]()
  let n = board.count

  for i in 0..<n {
    var row = [Int](repeating: 0, count: n)
    var idx = 0
    
    for j in 0..<n {
      if board[i][j] == 0 { continue }

      // 빈칸이면 채우기
      if row[idx] == 0 {
        row[idx] = board[i][j]
      }
      
      // 같은 숫자면 합치기
      // 이후에 idx 증가시키면 merge 여부 판별하지 않아도 됨
      else if row[idx] == board[i][j] {
        row[idx] *= 2
        idx += 1
      }

      else {
        idx += 1
        row[idx] = board[i][j]
      }
    }

    ret.append(row)
  }

  return ret
}

// 반시계 방향 회전
func rotate90L(_ board: [[Int]]) -> [[Int]] {
  let n = board.count
  var ret = board
  
  for i in 0..<n {
    for j in 0..<n {
      ret[i][j] = board[j][n-1-i]
    }
  }
  return ret
}

// 시계 방향 회전
func rotate90R(_ board: [[Int]]) -> [[Int]] {
  let n = board.count
  var ret = board
  
  for i in 0..<n {
    for j in 0..<n {
      ret[i][j] = board[n-1-j][i]
    }
  }
  return ret
}

// 최댓값 체크 메서드
// O(400)
func check(_ board: [[Int]]) -> Int {
  return board.flatMap{$0}.max()!
}

// 디버깅 메서드
func debug(_ board: [[Int]]) {
  let n = board.count
  print(" === === === ")
  
  for i in 0..<n {
    for j in 0..<n {
      print(board[i][j], terminator: " ")
    }
    print()
  }

  print(" === === === ")
}

// 회전 후 복구
// 0: 좌, 1: 상, 2: 우, 3: 하
// 

func game(_ board: [[Int]], _ dir: Int) -> [[Int]] {
  var ret = board

  // 좌
  if dir == 0 {
    ret = moveToLeft(ret)
  }

  if dir == 1 {
    ret = rotate90L(ret)
    ret = moveToLeft(ret)
    ret = rotate90R(ret)
  }

  if dir == 2 {
    ret = rotate90L(ret)
    ret = rotate90L(ret)
    ret = moveToLeft(ret)
    ret = rotate90R(ret)
    ret = rotate90R(ret)
  }

  // 하
  if dir == 3 {
    ret = rotate90L(ret)
    ret = rotate90L(ret)
    ret = rotate90L(ret)
    ret = moveToLeft(ret)
    ret = rotate90L(ret)
  }

  return ret
}

// 메소드 조합 후 정답 도출
var mx = check(map)  // 최댓값
func dfs(_ board: [[Int]], _ n: Int) {
  if n == 5 {
    mx = max(mx, check(board))
    return
  }

  for i in 0..<4 {
    dfs(game(board, i), n+1)
  }
}

//https://www.acmicpc.net/board/view/61812
// var board = [[0,8,1024],[4,0,4],[0,1024,32]]
// board = game(board,0)  // 좌
// debug(board)

// board = game(board,1)  // 상
// debug(board)

// board = game(board,3)  // 하
// debug(board)

dfs(map, 0)
print(mx)