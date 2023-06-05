let mn = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let (m,n) = (mn[0], mn[1])
var board = [[Int]]()

for _ in 0..<n {
  let input = readLine()!.compactMap { Int(String($0)) }
  board.append(input)
}

var walls = [[Int]](repeating: [Int](repeating: 999999, count: m), count: n)
walls[0][0] = 0

func bfs() {
  let dx = [1,-1,0,0]
  let dy = [0,0,1,-1]

  var q = [(0,0)]

  while !q.isEmpty {
    let cur = q.removeFirst()

    if cur.0 == n-1 && cur.1 == m-1 {
      break
    }

    for i in 0..<4 {
      let (nx, ny) = (cur.0 + dx[i], cur.1 + dy[i])

      if !((0..<n) ~= nx && (0..<m) ~= ny) { continue }
      if walls[nx][ny] == 0 { continue }

      // 벽 부수는 게 더 적으면 갱신
      if board[nx][ny] == 1 {
        if walls[nx][ny] > walls[cur.0][cur.1] + 1 {
          walls[nx][ny] = walls[cur.0][cur.1] + 1
          q.append((nx, ny))  
        }
        
      } else if board[nx][ny] == 0 {
        if walls[nx][ny] > walls[cur.0][cur.1] {
          walls[nx][ny] = walls[cur.0][cur.1]
          q.insert((nx, ny), at: 0)
        }
      }
    }
  }
}

bfs()
print(walls[n-1][m-1])