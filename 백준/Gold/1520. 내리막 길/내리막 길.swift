// 경로 상에서의 dp인가?
/*
0 1 1 1 1
1 x x 2 1
1 x x 2 x
1 1 1 3 3
*/
// dfs + dp

let mn = readLine()!.split{ $0 == " " }.compactMap{Int(String($0))}
let (m,n) = (mn[0], mn[1])

let dx = [1,-1,0,0]
let dy = [0,0,1,-1]

var map = [[Int]]()
var dp = [[Int]](repeating: [Int](repeating: -1, count: n), count: m)

for _ in 0..<m {
  let line = readLine()!.split{ $0 == " " }.compactMap{Int(String($0))}
  map.append(line)
}

func dfs(_ x: Int, _ y: Int) -> Int {
  // 기저 사례 => 종료 조건
  if x == m-1 && y == n-1 {
    // 시작점 (0,0)
    return 1
  }

  // 계산 1회만 해주기 위함
  if dp[x][y] == -1 {
    // 누적 위해 초기화
    dp[x][y] = 0

    // 네방향 계산
    for i in 0..<4 {
      let (nx,ny) = (x+dx[i], y+dy[i])

      guard (0..<m) ~= nx, (0..<n) ~= ny else { continue }

      // 내리막길인 경우에만 경로 수 갱신
      // 경로 없다면 위에서 0으로 초기화 해주었으니까 0
      if map[x][y] > map[nx][ny] {
        dp[x][y] += dfs(nx, ny)
      }
    }
  }

  // 값 있는 경우 dp 값 사용
  return dp[x][y]
}

print(dfs(0,0))