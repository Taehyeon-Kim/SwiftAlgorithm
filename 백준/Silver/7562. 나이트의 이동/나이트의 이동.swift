let tc = Int(readLine()!)!

for _ in 0..<tc {
  let n = Int(readLine()!)!
  let from = readLine()!.split(separator: " ").compactMap{Int(String($0))}
  let to = readLine()!.split(separator: " ").compactMap{Int(String($0))}

  func bfs(_ n: Int, _ sx: Int, _ sy: Int, _ to: [Int]) -> Int {
    var board = [[Int]](repeating: [Int](repeating: -1, count: n), count: n)
    let dirs = [(-2, -1), (-1, -2), (1, -2), (2, -1), (-2, 1), (-1, 2), (1, 2), (2, 1)]

    var q = [(sx, sy)]
    var idx = 0
    
    let (toX, toY) = (to[0], to[1])
    board[sx][sy] = 0
  
    while q.count > idx {
      let (cx, cy) = q[idx]
      idx += 1
  
      if toX == cx && toY == cy {
        return board[toX][toY]
      }
  
      for dir in dirs {
        let (dx, dy) = dir
        let (nx, ny) = (cx + dx, cy + dy)
  
        if (0..<n) ~= nx && (0..<n) ~= ny && board[nx][ny] == -1 {
          q.append((nx, ny))
          board[nx][ny] = board[cx][cy] + 1
        }
      }
    }
  
    return board[toX][toY]
  }
  
  let ans = bfs(n, from[0], from[1], to)
  print(ans)
}