func go(_ x: Int, _ y: Int) -> Int {
  if x == 0 && y == c - 1 {
    if v[x][y] == k {
      return 1
    }
    return 0
  }

  var ret = 0
  for i in 0..<4 {
    let nx = x+dx[i]
    let ny = y+dy[i]
    if (0..<r) ~= nx && (0..<c) ~= ny && v[nx][ny] == 0 && map[nx][ny] != "T" {
      v[nx][ny] = v[x][y] + 1
      ret += go(nx,ny)
      v[nx][ny] = 0
    }
  }
  return ret
}

// Main
let rck = readLine()!.split{$0 == " "}.compactMap{Int(String($0))}
let (r,c,k) = (rck[0],rck[1],rck[2])

let dx = [1,-1,0,0]
let dy = [0,0,1,-1]
var v = Array(repeating: Array(repeating: 0, count: c), count: r)

var map = [[String]]()
for _ in 0..<r {
  map.append(readLine()!.map{String($0)})
}

v[r-1][0] = 1
print(go(r-1,0))