let nm = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
let (n, m) = (nm[0], nm[1])

var graph = [[Int]](repeating: [Int](), count: n)
for i in 0..<n {
  let line = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
  graph[i].append(contentsOf: line)
}

var q: [(Int, Int)] = []
var idx = 0

/// 시작점이 여러개인 bfs
for i in 0..<n {
  for j in 0..<m {
    if graph[i][j] == 1 {
      q.append((i,j))
    }
  }
}

let dx = [-1,-1,-1,0,0,1,1,1]
let dy = [-1,0,1,-1,1,-1,0,1]

while q.count > idx {
  let (cx, cy) = q[idx]
  idx += 1

  for i in 0..<8 {
    let (nx, ny) = (cx + dx[i], cy + dy[i])
    if (0..<n) ~= nx && (0..<m) ~= ny && graph[nx][ny] == 0 {
      q.append((nx, ny))
      graph[nx][ny] = graph[cx][cy] + 1
    }
  }
}

var ret = 0
for i in 0..<n {
  for j in 0..<m {
    ret = max(ret, graph[i][j])
  }
}

/// 1부터 시작했기 때문에 마지막에 1을 빼주어야 거리가 나옴
print(ret - 1)