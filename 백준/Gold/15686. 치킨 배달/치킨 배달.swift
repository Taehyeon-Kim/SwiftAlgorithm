import Foundation

let nm = readLine()!.split{$0==" "}.compactMap{Int(String($0))}
let (n,m) = (nm[0],nm[1])

var map = [[Int]]()
for _ in 0..<n {
  let input = readLine()!.split{$0==" "}.compactMap{Int(String($0))}
  map.append(input)
}

struct Pair: Equatable {
  let x: Int 
  let y: Int

  init(_ x: Int, _ y: Int) {
    self.x = x
    self.y = y
  }

  static func == (lhs: Pair, rhs: Pair) -> Bool {
    return lhs.x == rhs.x && lhs.y == rhs.y
  }
}

var c = [Pair]()
var h = [Pair]()

for i in 0..<n {
  for j in 0..<n {
    // 집
    if map[i][j] == 1 {
      h.append(Pair(i, j))
    }

    // 치킨
    if map[i][j] == 2 {
      c.append(Pair(i, j))
    }
  }
}

var ret = Int.max

// 재귀
func go(_ idx: Int, _ v: [Pair]) {
  // 치킨집 개수까지만 재귀
  if idx == c.count {
    // 계산
    // v : 치킨집 경우의 수
    // 집좌표는 전역으로 고정
    if v.isEmpty { return }

    // 폐업시키지 않을 치킨집이 M개 일때만 계산
    if v.count == m {
      ret = min(ret, cal(v))
    }
    return
  }

  go(idx+1, v + [c[idx]]) // 포함
  go(idx+1, v)            // 미포함
}

// 치킨 거리의 합
func cal(_ v: [Pair]) -> Int {
  var ans = 0
  for hp in h {
    let (hx, hy) = (hp.x, hp.y)   
    var value = Int.max
    for cp in v {
      let (cx, cy) = (cp.x, cp.y)
      let dist = abs(hx-cx) + abs(hy-cy)
      value = min(value, Int(dist))
    }
    ans += value
  }
  return ans
}

go(0, [])
print(ret)