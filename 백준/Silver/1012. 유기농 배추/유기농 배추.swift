let tc = Int(readLine()!)!

for _ in 0..<tc {
  let nmk = readLine()!.split{$0==" "}.compactMap{Int(String($0))}
  let (n,m,k) = (nmk[0], nmk[1], nmk[2])
  var arr = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
  var cnt = 0
  
  for _ in 0..<k {
    let xy = readLine()!.split{$0==" "}.compactMap{Int(String($0))}
    let (x,y) = (xy[0], xy[1])
    arr[x][y] = 1
  }

  func bfs(_ x: Int, _ y: Int) {
    var q = [(x,y)]
    var idx = 0
    let dx = [1,-1,0,0]
    let dy = [0,0,1,-1]

    while q.count > idx {
      let (cx,cy) = q[idx]
      idx += 1

      for i in 0..<4 {
        let (nx,ny) = (cx+dx[i], cy+dy[i])

        if !((0..<n) ~= nx && (0..<m) ~= ny) { continue }
        if arr[nx][ny] == 0 { continue }

        q.append((nx,ny))
        arr[nx][ny] = 0
      }
    }
  }

  for i in 0..<n {
    for j in 0..<m {
      if arr[i][j] == 1 {
        bfs(i, j)
        cnt += 1
      }
    }
  }

  print(cnt)
}