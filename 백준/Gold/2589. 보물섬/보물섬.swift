// 시작 지점(L의 모든 경우의 수)마다 bfs/dfs해서 가장 긴 거리를 ret에 담아서 리턴
// 시작값은 0부터

// 50 * 50 : 보물 위치 경우의 수
// 최대 6,250,000?

// 1. 시작 위치 : 반복문 - 모든 경우의 수
// 2. bfs

let rc = readLine()!.split{$0 == " "}.map{Int(String($0))!}
let (r,c) = (rc[0], rc[1])

var map = [[String]]()
for _ in 0..<r {
  let input = readLine()!.map{String($0)}
  map.append(input)
}

var ret = 0
for i in 0..<r {
  for j in 0..<c {
    if map[i][j] == "L" {
      // bfs
      ret = max(ret, bfs(i,j))
    }
  }
}
print(ret)

func bfs(_ i: Int, _ j: Int) -> Int {
  // 방문x -> -1
  var visited = [[Int]](repeating: [Int](repeating: -1, count: c), count: r)

  // 큐
  var queue: [(Int, Int)] = [(i,j)]
  var idx = 0
  visited[i][j] = 0 // 시작점은 0부터 거리 계산

  var dist = 0

  // 좌표
  let dx = [1,-1,0,0]
  let dy = [0,0,1,-1]

  while queue.count > idx {
    let (cx,cy) = queue[idx]
    idx += 1

    for i in 0..<4 {
      let (nx,ny) = (cx+dx[i], cy+dy[i])

      if (0..<r) ~= nx && (0..<c) ~= ny && visited[nx][ny] == -1 && map[nx][ny] == "L" {
        queue.append((nx,ny))
        visited[nx][ny] = visited[cx][cy] + 1
        dist = max(dist, visited[nx][ny])
      }
    }
  }

  return dist
}