let input = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let (r, c) = (input[0], input[1])

var board = [[String]]()
for _ in 0..<r {
  let line = readLine()!.map {String($0)}
  board.append(line)
}

var visited = [[Bool]](repeating: [Bool](repeating: false, count: c), count: r)
let dx = [-1,0,1] // 우측으로만 이동(위, 중간, 아래순으로 길을 놓는게 많이 놓을 수 있음)

func dfs(_ x: Int, _ y: Int) -> Bool {
  /// 종료 조건
  if y == c-1 { return true }

  for i in 0..<3 {
    let nx = x+dx[i]

    if (0..<r) ~= nx && !visited[nx][y+1] && board[nx][y+1] != "x" {
      visited[nx][y+1] = true
      if dfs(nx, y+1) { return true }
    }
  }

  return false
}

var ret = 0
for i in 0..<r {
  if dfs(i, 0) { ret += 1 }
}
print(ret)