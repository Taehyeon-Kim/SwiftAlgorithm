// 놓을 수 있는지 확인
func check(_ x: Int, _ y: Int) -> Bool {
  if v[x][y] { return false }

  for i in 0..<4 {
    let nx = x+dx[i]
    let ny = y+dy[i]
    
    if !((0..<n) ~= nx && (0..<n) ~= ny) { return false }
    if v[nx][ny] { return false }
  }

  return true
}

// 꽃 놓기
func setFlower(_ x: Int, _ y: Int) -> Int {
  v[x][y] = true
  var sm = p[x][y]
  for i in 0..<4 {
    let nx = x+dx[i]
    let ny = y+dy[i]
    v[nx][ny] = true
    sm += p[nx][ny]
  }
  return sm
}

// 꽃 제거하기
func eraseFlower(_ x: Int, _ y: Int) {
  v[x][y] = false
  for i in 0..<4 {
    let nx = x+dx[i]
    let ny = y+dy[i]
    v[nx][ny] = false
  }
}

// 완전 탐색
var ret = Int.max
func go(_ cnt: Int, _ sm: Int) {
  if cnt == 3 {
    ret = min(ret, sm)
    return
  }

  for i in 0..<n {
    for j in 0..<n {
      if check(i, j) {
        go(cnt+1, sm + setFlower(i, j))
        eraseFlower(i, j)
      }
    }
  }
}

let dx = [1,-1,0,0]
let dy = [0,0,1,-1]
let n = Int(readLine()!)!
var v = Array(repeating: Array(repeating: false, count: 20), count: 20)
var p = [[Int]]()
for _ in 0..<n {
  p.append(readLine()!.split{$0 == " "}.compactMap{Int(String($0))})
}

go(0,0)
print(ret)