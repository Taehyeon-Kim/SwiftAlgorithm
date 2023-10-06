let nk = readLine()!.split{$0 == " "}.compactMap{Int(String($0))}
let (n,k) = (nk[0],nk[1])
let MAX = 100_001
var visited = Array(repeating: 0, count: MAX)
var prev = Array(repeating: 0, count: MAX)
var ans = 0
visited[n] = 1

/// BFS

var q = [n]
var idx = 0
while idx < q.count {
  let cx = q[idx]
  idx += 1

  if cx == k {
    ans = visited[cx]
    break
  }

  for nx in [cx-1, cx+1, cx*2] {
    // 범위 안에 있는지, 방문 안했는지 체크
    if (0...100_000) ~= nx && visited[nx] == 0 {
      visited[nx] = visited[cx] + 1 // 방문 거리 체크
      prev[nx] = cx                 // 이전 노드 기록
      q.append(nx)
    }
  }
}

/// 출력

var nx = k
var ret = [k]
while nx != n {
  nx = prev[nx]
  ret.append(nx)
}

print(ans-1)
ret.reverse()
print(ret.map(String.init).joined(separator: " "))