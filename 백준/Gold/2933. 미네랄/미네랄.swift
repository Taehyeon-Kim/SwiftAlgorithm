let rc = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let (r, c) = (rc[0], rc[1])

var map = [[String]]()
for _ in 0..<r {
  let line = readLine()!.map{String($0)}
  map.append(line)
}

let n = Int(readLine()!)!
var heights = readLine()!.split(separator: " ").compactMap{Int(String($0))}
// 방문 여부 체크 배열
var visited = [[Bool]](repeating: [Bool](repeating: false, count: c), count: r)

// Map debugging
func debug() {
  for i in 0..<r {
    for j in 0..<c {
      print(map[i][j], terminator: "")
    }
    print()
  }
}

// 부수는 메서드
func hit(_ idx: Int, _ height: Int) {
  // idx - 홀수: 왼쪽, 짝수: 오른쪽
  var pos = idx % 2 == 0 ? 0 : (c - 1)
  while true {
    // 범위 벗어났으면 종료
    if pos == -1 || pos == c { break }
    
    // 미네랄 만났으면 부수기
    if map[r - height][pos] == "x" {
      map[r - height][pos] = "."
      break
    } else {
      // 홀수면 우측으로 짝수면 좌측으로 이동
      let nxt = idx % 2 == 0 ? pos + 1 : pos - 1
      pos = nxt
    }
  }
}

// 미네랄이 잘 연결되어 있는지 확인
// 아니라면 중력 때문에 밑으로 계속 떨어뜨려야함
func check() -> Bool {

  // 방문 체크 초기화
  visited = [[Bool]](repeating: [Bool](repeating: false, count: c), count: r)
  
  func bfs(_ sx: Int, _ sy: Int) {
    visited[sx][sy] = true
    var q = [(sx, sy)]
    var idx = 0

    let dx = [1,-1,0,0]
    let dy = [0,0,1,-1]

    while q.count > idx {
      let (cx, cy) = q[idx]
      idx += 1

      for i in 0..<4 {
        let (nx, ny) = (cx+dx[i], cy+dy[i])

        if (0..<r) ~= nx && (0..<c) ~= ny && !visited[nx][ny] && map[nx][ny] == "x" {
          visited[nx][ny] = true
          q.append((nx, ny))
        }
      }
    }    
  }
  
  for i in 0..<c {
    if map[r-1][i] == "x" {
      bfs(r-1, i)
    }
  }

  let x = map.flatMap{$0}.filter{$0 == "x"}.count
  let t = visited.flatMap{$0}.filter{$0 == true}.count

  return x == t
}

// 어떻게 하나의 클러스터를 떨어뜨릴 수 있을까?
// 연결되지 않은 클러스터 덩어리에서 맨 아래에 있는 미네랄이 바닥 또는 다른 미네랄을 만날때까지 떨어뜨리면 된다.
// (x, false)인 것만 아래로 내린다.
func dropDown() {
  var minerals = [(Int, Int)]()
  
  for i in 0..<r {
    for j in 0..<c {
      if map[i][j] == "x" && !visited[i][j] {
        minerals.append((i, j))
      }
    }
  }

  minerals.sort(by: { $0.0 > $1.0 })

  var flag = true
  while flag {
    var copy_map = map
    var newMinerals = [(Int, Int)]()
    
    for (x, y) in minerals {  
      let (nx, ny) = (x+1, y)
      if !((0..<r) ~= nx) { flag = false; break }
      if copy_map[nx][ny] == "x" { flag = false; break }

      if copy_map[nx][ny] == "." {
        copy_map[x][y] = "."
        copy_map[nx][ny] = "x"
        newMinerals.append((nx, ny))
      }
    }

    if flag {
      minerals = newMinerals
      map = copy_map
    }
  }
}

// check -> not visited minerals -> dropDown
for (idx, height) in heights.enumerated() {
  hit(idx, height)
  while !check() {
    dropDown()
  }
}

debug()