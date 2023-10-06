
let nk = readLine()!.split{$0 == " "}.compactMap{Int(String($0))}
let (n,k) = (nk[0],nk[1])

let MAX = 500_000

// 2차원 배열
var v = Array(repeating: Array(repeating: 0, count: MAX+4), count: 2)

var t  = 1
var flag = false

func bfs(_ st: Int) {
  v[0][st] = 1
  var q = [st]
  var b = k
  var idx = 0

  let range = (0...MAX)

  while idx < q.count {
    // 동생 좌표
    b += t

    // 동생 범위 넘어가면
    if b > MAX {
      break
    }

    // 수빈이가 먼저 도착하고 그 이후에 동생이 도착하면
    if v[t%2][b] > 0 {
      flag = true
      break
    }

    // 턴마다 계산
    let qSize = q.count - idx
    for _ in 0..<qSize {
      let x = q[idx]
      idx += 1

      for nx in [x-1,x+1,x*2] {
        // 범위 안에 있고, 아직 방문하지 않았다면
        if range ~= nx && v[t%2][nx] == 0 {
          // 홀짝번째 구분 위함
          v[t%2][nx] = v[(t+1)%2][x] + 1
          
          // 동생 위치에 도착했다면
          if nx == b {
            flag = true
            break
          }
          q.append(nx)
        }
      }
      if flag { break }
    }

    if flag { break }
    t += 1
  }
}

bfs(n)

if n == k {
  print(0)
} else {
  print(flag ? t : -1)
}