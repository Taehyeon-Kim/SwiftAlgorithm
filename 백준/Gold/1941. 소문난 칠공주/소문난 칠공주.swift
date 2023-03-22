// Input
var map = [[String]](repeating: [String](), count: 5)
for i in 0..<5 {
  let line = readLine()!.map{String($0)}
  map[i].append(contentsOf: line)
}

// 방문 체크 배열
var visited = [Bool](repeating: false, count: 25)

func bfs() -> Bool {
  let dx = [1,-1,0,0]
  let dy = [0,0,1,-1]
  var q = [(Int, Int)]()
  var check = [[Bool]](repeating: [Bool](repeating: false, count: 5), count: 5)

  for i in 0..<25 {
    if visited[i] {
      check[i/5][i%5] = true
      q.append((i/5, i%5))
      break
    }
  }

  var idx = 0
  var cnt = 1
  
  while q.count > idx {
    let (cx, cy) = q[idx]
    idx += 1

    for i in 0..<4 {
      let (nx, ny) = (cx+dx[i], cy+dy[i])

      if !((0..<5) ~= nx && (0..<5) ~= ny) { continue }
      if check[nx][ny] { continue }
      if !visited[nx*5 + ny] { continue }
      check[nx][ny] = true
      q.append((nx, ny))
      cnt += 1
    }
  }

  if cnt == 7 { return true }
  else { return false }
}

var ans = 0
func dfs(_ cnt: Int, _ start: Int, _ yim: Int) {
  if cnt == 7 {
    if bfs() {
      ans += 1
      return
    }
    return
  }
  else {
    for i in stride(from: start, to: 25, by: 1) {
      if map[i/5][i%5] == "Y" && yim + 1 < 4 {
        visited[i] = true
        dfs(cnt+1, i+1, yim+1)
        visited[i] = false
      }
  
      if map[i/5][i%5] == "S" {
        visited[i] = true
        dfs(cnt+1, i+1, yim)
        visited[i] = false
      }
    }
  }
}

dfs(0,0,0)
print(ans)