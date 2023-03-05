let n = Int(readLine()!)!
var grid = [[String]](repeating: [], count: n)
var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)

for i in 0..<n {
  let line = readLine()!.map{String($0)}
  grid[i].append(contentsOf: line)
}

func bfs(_ board: [[String]], _ sx: Int, _ sy: Int) -> Int {
  let dx = [1,-1,0,0]
  let dy = [0,0,1,-1]

  var q = [(sx, sy)]
  var idx = 0
  visited[sx][sy] = true

  while q.count > idx {
    let (x, y) = q[idx]
    idx += 1
    
    for i in 0..<4 {
      let (nx, ny) = (x + dx[i], y + dy[i])

      if (0..<n) ~= nx && (0..<n) ~= ny && !visited[nx][ny] && board[x][y] == board[nx][ny] {
        visited[nx][ny] = true
        q.append((nx, ny))
      }
    }
  }

  return 1
}

// 정상
var ret1 = 0
for i in 0..<n {
  for j in 0..<n {
    if visited[i][j] { continue }
    
    if grid[i][j] == "R" {
      ret1 += bfs(grid, i, j)
    }

    else if grid[i][j] == "G" {
      ret1 += bfs(grid, i, j)
    }

    else if grid[i][j] == "B" {
      ret1 += bfs(grid, i, j)
    }
  }
}

// 적록색약
var other = grid
for i in 0..<n {
  for j in 0..<n {
    if other[i][j] == "G" {
      other[i][j] = "R"
    }
  }
}

visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
var ret2 = 0

for i in 0..<n {
  for j in 0..<n {
    if visited[i][j] { continue }
    
    if other[i][j] == "R" {
      ret2 += bfs(other, i, j)
    }
    
    else if other[i][j] == "B" {
      ret2 += bfs(other, i, j)
    }
  }
}

print(ret1, ret2)