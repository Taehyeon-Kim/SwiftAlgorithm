/*
- 불을 먼저 이동시키면 각 지점에 불이 도착하는 시점을 알 수 있음
- 그 이후에 지훈이를 이동시키는 것임, 지훈이가 다음 이동할 지점에 도착할 시점이 불보다 먼저 도착할 수 있다면 이동 가능한 것으로 판단
- 지훈이가 영역 바깥으로 갈 수 있다면 탈출 가능한 것
*/

/// 입력
let rc = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let (r, c) = (rc[0], rc[1])

var board = [[String]](repeating: [String](), count: r)
for i in 0..<r {
  let line = readLine()!.map { String($0) }
  board[i].append(contentsOf: line)
}

/// 이동 거리 파악
var fire = Array(repeating: Array(repeating: -1, count: c), count: r)
var man = Array(repeating: Array(repeating: -1, count: c), count: r)

/// 방향
let dx = [-1,1,0,0]
let dy = [0,0,-1,1]

/// 큐
var fireQ = [(Int, Int)]()
var manQ = [(Int, Int)]()

/// 불 bfs
func fbfs() {
  var idx = 0
  while fireQ.count > idx {
    let (cx, cy) = fireQ[idx]
    idx += 1

    for i in 0..<4 {
      let (nx, ny) = (cx + dx[i], cy + dy[i])

      if (0..<r) ~= nx && (0..<c) ~= ny && fire[nx][ny] < 0 && board[nx][ny] != "#" {
        fire[nx][ny] = fire[cx][cy] + 1
        fireQ.append((nx, ny))
      }
    }
  }
}

/// 지훈 bfs
func mbfs() {
  var idx = 0
  
  while manQ.count > idx {
    let (cx, cy) = manQ[idx]
    idx += 1

    for i in 0..<4 {
      let (nx, ny) = (cx + dx[i], cy + dy[i])

      /// 탈출 성공      
      if !((0..<r) ~= nx && (0..<c) ~= ny) {
        print(man[cx][cy] + 1)
        return
      }

      // 이미 방문했거나 벽이라면
      if man[nx][ny] >= 0 || board[nx][ny] == "#" { continue }

      /// 불이 지나간 자리를 지훈이가 지나갈 수 있는지 체크
      if fire[nx][ny] != -1 && man[cx][cy] + 1 >= fire[nx][ny] { continue }

      man[nx][ny] = man[cx][cy] + 1
      manQ.append((nx, ny))
    }
  }
  
  print("IMPOSSIBLE")
}

for i in 0..<r {
  for j in 0..<c {
    if board[i][j] == "J" {
      manQ.append((i,j))
      man[i][j] = 0
    }

    if board[i][j] == "F" {
      fireQ.append((i,j))
      fire[i][j] = 0
    }
  }
}

fbfs()
mbfs()