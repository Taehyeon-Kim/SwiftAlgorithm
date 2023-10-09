let rc = readLine()!.split{$0 == " "}.compactMap{Int(String($0))}
let (r,c) = (rc[0],rc[1])
var board = [[Int]]()
for _ in 0..<r {
  board.append(readLine()!.map{ Int($0.asciiValue!) - 65 })
}

let dx = [1,-1,0,0]
let dy = [0,0,1,-1]
var ans = 0

func go(_ x: Int, _ y: Int, _ cnt: Int, _ bit: Int) {
  ans = max(ans, cnt)
  for i in 0..<4 {
    let (nx,ny) = (x+dx[i],y+dy[i])

    if (0..<r) ~= nx && (0..<c) ~= ny {
      let n = 1 << board[nx][ny]
      if bit&n == 0 {
        go(nx,ny,cnt+1,bit|n)
      }
    }
  }
}

go(0,0,1, 1<<board[0][0])
print(ans)