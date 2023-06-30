// 경로 상에서의 dp인가?
/*
0 1 1 1 1
1 x x 2 1
1 x x 2 x
1 1 1 3 3
*/
// 처음부터 시작했는데 관찰이 어려워 밑에서부터 추적도 시도
// 위에서 오거나 왼쪽에서 오거나

// 1. map 가지 못하는 길 x 표시
// 2. bfs

let mn = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let (m,n) = (mn[0], mn[1])

var map = [[Int]]()
for _ in 0..<m {
  let line = readLine()!.split(separator: " ").compactMap{Int(String($0))}
  map.append(line)
}

func debugMap(_ arr: [[Int]]) {
  for i in 0..<m {
    for j in 0..<n {
      print(arr[i][j], terminator: " ")
    }
    print()
  }
}

var dp = [[Int]](repeating: [Int](repeating: -1, count: n), count: m)

let dx = [1,-1,0,0]
let dy = [0,0,1,-1]

func dfs(_ x: Int, _ y: Int) -> Int {
  // 기저 사례 => 종료 조건
  if x == m-1 && y == n-1 {
    return 1
  }

  if dp[x][y] == -1 {
    dp[x][y] = 0

    for i in 0..<4 {
      let (nx,ny) = (x+dx[i], y+dy[i])

      if !((0..<m) ~= nx && (0..<n) ~= ny) {
        continue
      }

      if map[x][y] > map[nx][ny] {
        dp[x][y] += dfs(nx, ny)
      }
    }
  }

  return dp[x][y]
}

let ans = dfs(0,0)
print(ans)