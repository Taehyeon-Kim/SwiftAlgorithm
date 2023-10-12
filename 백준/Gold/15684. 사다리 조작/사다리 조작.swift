let nmh = readLine()!.split{$0 == " "}.compactMap{Int(String($0))}
let (n,m,h) = (nmh[0],nmh[1],nmh[2])

var v = Array(repeating: Array(repeating: false, count: n), count: h)

for _ in stride(from: 0, to: m, by: 1) {
  let input = readLine()!.split{$0 == " "}.compactMap{Int(String($0))}
  let (h,i) = (input[0], input[1])
  v[h-1][i-1] = true
}

// // i to i 판단 로직
func check() -> Bool {
  for i in stride(from: 0, to: n, by: 1) {
    var start = i
    
    for j in stride(from: 0, to: h, by: 1) {
      if v[j][start] { start += 1 }                     // 우
      else if start > 0 && v[j][start-1] { start -= 1 } // 좌
    }

    if start != i {
      return false
    }
  }
  return true
}

func go(_ cnt: Int, _ x: Int, _ y: Int) {
  if check() {
    ret = min(ret, cnt)
    return
  }

  if cnt == 3 || cnt >= ret {
    return
  }

  // 상하좌우 이동하면서 사다리 놓을 수 있는지 체크
  for i in stride(from: x, to: h, by: 1) {
    let cur = i == x ? y : 0
    if cur > n-1 { continue }

    for j in stride(from: cur, to: n-1, by: 1) {
      // 이미 놓여있으면 현재 사다리 가로로 못 놓음
      if j > 0 && v[i][j-1] { continue }
      if v[i][j] || v[i][j+1] { continue }

      v[i][j] = true
      go(cnt + 1, i, j+2)
      v[i][j] = false
    }
  }
}

var ret = 4
go(0,0,0)
print(ret < 4 ? ret : -1)