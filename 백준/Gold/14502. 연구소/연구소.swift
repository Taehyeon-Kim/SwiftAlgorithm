/*
1. 벽을 3개 세운다
2. 바이러스를 퍼트린다.
3. 안전영역의 max값을 카운트한다.

벽을 `무식`하게 세운다. -> 모든 경우의 수 -> 습관화

문제의 최대 범위를 기반으로 시간복잡도를 유추
64C3 x (64+64) -> 약 400만
*/

let nm = readLine()!.split{$0 == " "}.compactMap{Int(String($0))}
let (n,m) = (nm[0], nm[1])

var a = [[Int]]()
for _ in 0..<n {
  let line = readLine()!.split{$0 == " "}.compactMap{Int(String($0))}
  a.append(line)
}

var virusLists = [(Int, Int)]()
var wallLists = [(Int, Int)]()

for i in 0..<n {
  for j in 0..<m {
    if a[i][j] == 0 {
      wallLists.append((i,j))     
    } else if a[i][j] == 2 {
      virusLists.append((i,j))     
    }
  }
}

var visited = [[Bool]]()
let dx = [1,-1,0,0]
let dy = [0,0,1,-1]

///
/// 바이러스 퍼뜨리기
///
func dfs(_ x: Int, _ y: Int) {
  for i in 0..<4 {
    let nx = x + dx[i]
    let ny = y + dy[i]

    if (0..<n) ~= nx && (0..<m) ~= ny && !visited[nx][ny] && a[nx][ny] != 1 {
      visited[nx][ny] = true
      dfs(nx, ny)
    }
  }

  return
}

///
/// dfs + 카운팅
///
func solve() -> Int {
  visited = Array(repeating: Array(repeating: false, count: m), count: n)

  for tup in virusLists {
    visited[tup.0][tup.1] = true
    dfs(tup.0, tup.1)
  }

  var cnt = 0
  for i in 0..<n {
    for j in 0..<m {
      if a[i][j] == 0 && !visited[i][j] {
        cnt += 1
      }
    }
  }

  return cnt
}

///
/// 벽 세우기(브루트포스/완전탐색/백트래킹)
///
var ret = 0
for i in 0..<wallLists.count {
  for j in 0..<i {
    for k in 0..<j {
      a[wallLists[i].0][wallLists[i].1] = 1
      a[wallLists[j].0][wallLists[j].1] = 1
      a[wallLists[k].0][wallLists[k].1] = 1
      ret = max(ret, solve())
      a[wallLists[i].0][wallLists[i].1] = 0
      a[wallLists[j].0][wallLists[j].1] = 0
      a[wallLists[k].0][wallLists[k].1] = 0
    }
  }
}
print(ret)