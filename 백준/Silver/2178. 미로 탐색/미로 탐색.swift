let input = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let (row, col) = (input[0], input[1])

var board = [[Int]]()
for _ in 0..<row {
  let line = readLine()!.compactMap{Int(String($0))}
  board.append(line)
}

var dist = [[Int]](repeating: [Int](repeating: -1, count: col), count: row)

var dx = [1,0,-1,0]
var dy = [0,1,0,-1]
var q = [(0,0)]

func bfs() {
  while !q.isEmpty {
    let (x, y) = q.removeFirst()
    for i in 0..<4 {
      let (nx, ny) = (dx[i] + x, dy[i] + y)
      if nx < 0 || nx >= row || ny < 0 || ny >= col { continue }
      if dist[nx][ny] >= 0 || board[nx][ny] != 1 { continue }

      dist[nx][ny] = dist[x][y] + 1
      q.append((nx, ny))
    }
  }
}

bfs()
print(dist[row-1][col-1] + 2)