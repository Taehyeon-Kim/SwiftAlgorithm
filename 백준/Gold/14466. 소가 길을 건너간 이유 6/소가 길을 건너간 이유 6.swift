/// tuple로 비교못하니까, Pair쌍을 구조체로 만들고 작업
/// 꽤 많이 사용
struct Pair: Equatable {
  let x: Int
  let y: Int
}

let nkr = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let (n, k, r) = (nkr[0], nkr[1], nkr[2])

var graph = Array(repeating: Array(repeating: [Pair](), count: n), count: n)
for _ in 0..<r {
    let line = readLine()!.split(separator: " ").compactMap{Int(String($0))}
    let (r1, c1, r2, c2) = (line[0]-1, line[1]-1, line[2]-1, line[3]-1)
    graph[r1][c1].append(Pair(x: r2, y: c2))
    graph[r2][c2].append(Pair(x: r1, y: c1))
}

var cowPosition = [(Int, Int)]()
for _ in 0..<k {
  let line = readLine()!.split(separator: " ").compactMap{Int(String($0))}
  let (x, y) = (line[0]-1, line[1]-1)
  cowPosition.append((x, y))
}

/// bfs
/// - 길이 있으면 안가면 됨
/// - 결국 bfs를 돌려보고 다른 소가 있는 곳에 도착할 수 있는지 체크하면 됨
func bfs(_ sx: Int, _ sy: Int, _ visited: inout [[Bool]]) -> [[Bool]] {
  let dx = [1,-1,0,0]
  let dy = [0,0,1,-1]
  
  var q = [(sx, sy)]
  visited[sx][sy] = true
  var idx = 0
  
  while q.count > idx {
    let (cx, cy) = q[idx]
    idx += 1

    for i in 0..<4 {
      let (nx, ny) = (cx + dx[i], cy + dy[i])

      if (0..<n) ~= nx && (0..<n) ~= ny && !visited[nx][ny] && !graph[cx][cy].contains(Pair(x: nx, y: ny)) {
        q.append((nx, ny))
        visited[nx][ny] = true
      }
    }
  }

  return visited
}

var ret = 0
for (idx, cow) in cowPosition.enumerated() {
  var visited = Array(repeating: Array(repeating: false, count: n), count: n)
  let (cowX, cowY) = (cow.0, cow.1)
  visited = bfs(cowX, cowY, &visited)

  for (nCowX, nCowY) in cowPosition[idx...] {
    if !visited[nCowX][nCowY] { ret += 1 }
  }
}
print(ret)