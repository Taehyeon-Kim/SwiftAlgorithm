let n = Int(readLine()!)!
var map: [[Int]] = []
for _ in 0..<n {
  let line = readLine()!.split(separator: " ").compactMap{Int(String($0))}
  map.append(line)
}

var dp = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)

let dx = [1,-1,0,0]
let dy = [0,0,1,-1]

func dfs(_ sx: Int, _ sy: Int) -> Int {
  if dp[sx][sy] > 0 { return dp[sx][sy] }
  
  dp[sx][sy] = 1
  for i in 0..<4 {
    let (nx, ny) = (sx + dx[i], sy + dy[i])
    if !((0..<n) ~= nx && (0..<n) ~= ny) { continue }
    if map[sx][sy] < map[nx][ny] {
      dp[sx][sy] = max(dfs(nx, ny) + 1, dp[sx][sy])
    }
  }

  return dp[sx][sy]
}

for i in 0..<n {
  for j in 0..<n {
    _ = dfs(i, j)
  }
}

print(dp.flatMap{$0}.max()!)