// 공기청정기 시작+끝 좌표를 알아야 함
// - (r, c), (r+1, c)

// 미세먼지 확산
// 1. 상하좌우로 확산
// 2. 공기청정기 있거나, 칸이 없으면 확산 x
// 3. 확산의 양은 5로 나누고 소수점을 버린 값만큼
// 4. 확산의 시작점은 인접한 칸으로 확산된 양만큼 감소

// 공기청정기 바람 작동
// 위 - 반시계, 아래 - 시계

/**
모두 큐에 넣고 한번에 확산시키기
1. 인접한 칸 체크
2. 인접한 칸은 더하고, 시작점은 뺀다.
3. map 갱신
6 15 11
  10 7
  6  12
*/

let rct = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let (r, c, t) = (rct[0], rct[1], rct[2])

var map = [[Int]]()
for _ in 0..<r {
  let line = readLine()!.split(separator: " ").compactMap{Int(String($0))}
  map.append(line)
}

// Debug Map
func debugMap(_ arr: [[Int]]) {
  print("====== Debuging ======")
  for i in 0..<r {
    for j in 0..<c {
      print(arr[i][j], terminator: " ")
    }
    print()
  }
}

// debugMap(map)

// Spread - 확산 처리 함수 구현
func spread(_ arr: [[Int]]) -> [[Int]] {
  let _map = arr
  var q = [(Int, Int)]()
  
  // for loop
  for i in 0..<r {
    for j in 0..<c {
      // 미세먼지는 큐에 담기
      if _map[i][j] > 0 {
        q.append((i, j)) 
      }
    }
  }

  let dx = [1,-1,0,0]
  let dy = [0,0,1,-1]
  var idx = 0

  while q.count > idx {
    let (cx, cy) = q[idx]
    idx += 1

    for i in 0..<4 {
      let (nx, ny) = (cx + dx[i], cy + dy[i])

      // 확산 일어나지 않는 경우들
      if !((0..<r) ~= nx && (0..<c) ~= ny) { continue }
      if _map[nx][ny] == -1 { continue }

      let value = _map[cx][cy] / 5
      if value == 0 { continue }

      // 확산
      // 실제 전체 map의 변화는 여기서 처리
      map[nx][ny] += value  // 확산
      map[cx][cy] -= value  // 감소
    }

    // debugMap(map)
  }

  return map
}

// 공기청정기 시작점 체크
var m = [(Int, Int)]()
for i in 0..<r {
  if map[i][0] == -1 {
    m.append((i, 1))
  }
}

// 공기청정기 동작
func actFromTop(_ arr: [[Int]]) {
  // 방향 정의
  enum Dir {
    case t, b, l, r
  }

  let ts = m[0]
  var (cx, cy) = (ts.0, ts.1)
  var td: Dir = .r
  var cur = map[cx][cy]
  map[cx][cy] = 0
  var nxt = 0
  
  while true {
    // 방향 전환
    if td == .r {
      if cy == c - 1 {
        td = .t
      } else {
        // 현재 값 기억후 0으로 만들기
        // 칸 이동
        cy = cy + 1

        // 다음 칸 값 기억
        nxt = map[cx][cy]
        map[cx][cy] = cur
        cur = nxt
      }
    } 
    
    else if td == .t {
      if cx == 0 {
        td = .l 
      } else {
        cx = cx - 1  
        nxt = map[cx][cy]
        map[cx][cy] = cur
        cur = nxt
      }
    } 
    
    else if td == .l {
      if cy == 0 {
        td = .b
      } else {
        cy = cy - 1
        nxt = map[cx][cy]
        map[cx][cy] = cur
        cur = nxt
      }
    } 
    
    else if td == .b {
      cx = cx + 1
      if map[cx][cy] == -1 {
        break
      }
      nxt = map[cx][cy]
      map[cx][cy] = cur
      cur = nxt
    }
  }
}

func actFromBottom(_ arr: [[Int]]) {
  // 방향 정의
  enum Dir {
    case t, b, l, r
  }

  let ts = m[1]
  var (cx, cy) = (ts.0, ts.1)
  var td: Dir = .r
  var cur = map[cx][cy]
  map[cx][cy] = 0
  var nxt = 0
  
  while true {
    // 방향 전환
    if td == .r {
      if cy == c - 1 {
        td = .b
      } else {
        // 현재 값 기억후 0으로 만들기
        // 칸 이동
        cy = cy + 1
        // 다음 칸 값 기억
        nxt = map[cx][cy]
        map[cx][cy] = cur
        cur = nxt
      }
    } 
    
    else if td == .b {
      if cx == r - 1 {
        td = .l
      } else {
        cx = cx + 1  
        nxt = map[cx][cy]
        map[cx][cy] = cur
        cur = nxt
      }
    } 
    
    else if td == .l {
      if cy == 0 {
        td = .t
      } else {
        cy = cy - 1
        nxt = map[cx][cy]
        map[cx][cy] = cur
        cur = nxt
      }
    } 
    
    else if td == .t {
      cx = cx - 1
      if map[cx][cy] == -1 {
        break
      }
      nxt = map[cx][cy]
      map[cx][cy] = cur
      cur = nxt
    }
  }
}

for _ in 0..<t {
  // print("==== \(i + 1)초 때 ====")
  _ = spread(map)
  actFromTop(map)
  actFromBottom(map)
  // debugMap(map)
}

let result = map.flatMap{$0}.filter { $0 > 0 }.reduce(0,+)
print(result)