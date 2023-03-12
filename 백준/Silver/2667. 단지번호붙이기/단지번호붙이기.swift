let n = Int(readLine()!)!

var board = [[String]](repeating: [String](), count: n)
var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)

for i in 0..<n {
  let line = readLine()!.map { String($0) }
  board[i].append(contentsOf: line)
}

func bfs(_ sx: Int, _ sy: Int) -> Int {
  var area = 1
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
      
      if (0..<n) ~= nx && (0..<n) ~= ny && !visited[nx][ny] && board[nx][ny] == "1" {
          q.append((nx, ny))
          visited[nx][ny] = true
          area += 1
      }
    }
  }

  return area
}

var ret = [Int]()
for i in 0..<n {
  for j in 0..<n {
    if board[i][j] == "1" && !visited[i][j] {
      let area = bfs(i, j)
      ret.append(area)
    }
  }
}
ret.sort()

print(ret.count)
for area in ret {
  print(area)
}