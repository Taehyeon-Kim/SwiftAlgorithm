let nk = readLine()!.split{$0 == " "}.compactMap{Int(String($0))}
let (n,k) = (nk[0],nk[1])

let MAX = 100_000

var visited = Array(repeating: 0, count: MAX+4)
var cnt = Array(repeating: 0, count: MAX+4)

visited[n] = 1
cnt[n] = 1
var q = [n]

while !q.isEmpty {
  let cx = q.removeFirst()

  for nx in [cx-1, cx+1, cx*2] {
    if (0...MAX) ~= nx {
      // 방문한 적이 없다면,
      if visited[nx] == 0 {
        q.append(nx)
        visited[nx] = visited[cx] + 1
        cnt[nx] += cnt[cx]
      } else if visited[nx] == visited[cx] + 1 {
        cnt[nx] += cnt[cx]
      }
    }
  }
}

if n == k {
  print(0)
  print(1)
} else {
  print(visited[k]-1)
  print(cnt[k])
}