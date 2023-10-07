let nm = readLine()!.split{$0 == " "}.compactMap{Int(String($0))}
let (n,m) = (nm[0],nm[1])
let pos = readLine()!.split{$0 == " "}.compactMap{Int(String($0))}
let (x1,y1,x2,y2) = (pos[0],pos[1],pos[2],pos[3])
var map = [[String]]()
for _ in 0..<n {
  map.append(readLine()!.map{String($0)})
}

let dx = [1,-1,0,0]
let dy = [0,0,1,-1]

var v = Array(repeating: Array(repeating: -1, count: m), count: n)

func bfs(_ x: Int, _ y: Int) {
  var q = [(x, y)]
  v[x][y] = 0
  var idx = 0
  var cnt = 0

  while map[x2-1][y2-1] != "0" {
    cnt += 1 // 레벨 증가
    var temp = [(Int, Int)]()

    while idx < q.count {
      let (cx,cy) = q[idx]
      idx += 1

      for i in 0..<4 {
        let (nx,ny) = (cx+dx[i], cy+dy[i])
        if (0..<n) ~= nx && (0..<m) ~= ny && v[nx][ny] == -1 {
          v[nx][ny] = cnt

          if map[nx][ny] != "0" {
            map[nx][ny] = "0"
            temp.append((nx,ny))
          } else {
            q.append((nx,ny))
          }
        }
      }
    }

    q = temp
    idx = 0
  }
}

bfs(x1-1, y1-1)
print(v[x2-1][y2-1])