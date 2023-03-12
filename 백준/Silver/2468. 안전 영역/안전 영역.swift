let n = Int(readLine()!)!
var board = [[Int]](repeating: [Int](), count: n)
var (minH, maxH) = (Int.max, -1)

for i in 0..<n {
  let line = readLine()!.split(separator: " ").compactMap{Int(String($0))}
  board[i].append(contentsOf: line)

  minH = min(line.min()!, minH)
  maxH = max(line.max()!, maxH)
}

func fill(_ n: Int, _ height: Int, _ board: [[Int]]) -> [[Int]] {
  var ret = [[Int]](repeating: [Int](repeating: -1, count: n), count: n)
  
  for i in 0..<n {
    for j in 0..<n {
      if board[i][j] <= height { continue }
      ret[i][j] = 1
    }
  }
  return ret
}

var ans = 0
for height in stride(from: 0, to: maxH, by: 1) {
  var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
  let bd = fill(n, height, board)
  var cnt = 0

  func bfs(_ sx: Int, _ sy: Int, _ board: [[Int]]) {
    let dx = [1,-1,0,0]
    let dy = [0,0,1,-1]
    
    var q = [(sx, sy)]
    var idx = 0
    visited[sx][sy] = true
    
    while q.count > idx {
      let (cx, cy) = q[idx]
      idx += 1
  
      for i in 0..<4 {
        let (nx, ny) = (cx + dx[i], cy + dy[i])
        
        if (0..<n) ~= nx && (0..<n) ~= ny && !visited[nx][ny] && bd[nx][ny] == 1 {
            q.append((nx, ny))
            visited[nx][ny] = true
        }
      }
    }
  }
  
  for i in 0..<n {
    for j in 0..<n {
     if bd[i][j] == 1 && !visited[i][j] {
       bfs(i, j, bd)
       cnt += 1
     }
    }
  }

  ans = max(ans, cnt)
}

print(ans)