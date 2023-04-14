let nm = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let (n,m) = (nm[0], nm[1])

// 좌표 쌍
struct Pair: Hashable {
  let x: Int
  let y: Int
  init(_ x: Int, _ y: Int) {
    self.x = x
    self.y = y
  }
}

var map = [[Bool]](repeating: [Bool](repeating: false, count: n+1), count: n+1) // 불
var visited = [[Bool]](repeating: [Bool](repeating: false, count: n+1), count: n+1)
var canMove = [[Bool]](repeating: [Bool](repeating: false, count: n+1), count: n+1)
var dict = [Pair: [Pair]]() // 스위치

for _ in 0..<m {
  let xyab = readLine()!.split(separator: " ").compactMap{Int(String($0))}
  let (x,y,a,b) = (xyab[0], xyab[1], xyab[2], xyab[3])
  dict[Pair(x,y), default: []].append(Pair(a,b))
}

func debug(_ arr: [[Bool]]) {
  for i in 0...n {
    for j in 0...n {
      print(arr[i][j], terminator: " ")
    }
    print()
  }

  print()
}

var ans = 1

func solution() {
  let dx = [1,-1,0,0]
  let dy = [0,0,1,-1]
  var q = [Pair(1,1)]
  map[1][1] = true
  visited[1][1] = true
  canMove[1][1] = true

  while !q.isEmpty {
    let cur = q.removeFirst()

    for room in dict[cur] ?? [] {
      if map[room.x][room.y] { continue }
      map[room.x][room.y] = true // 현재 지점에서 켤 수 있는 불 켜기
      ans += 1
    }

    for i in 0..<4 {
      let (nx, ny) = (cur.x + dx[i], cur.y + dy[i])
      if !((1...n) ~= nx && (1...n) ~= ny) { continue }
      canMove[nx][ny] = true
    }

    // 방문가능한 지점에서 불 켜져 있는 지점 큐에 넣기
    for i in 1...n {
      for j in 1...n {
        if canMove[i][j] && map[i][j] && !visited[i][j] {
          visited[i][j] = true
          q.append(Pair(i,j))
        }
      }
    }
  }
}

solution()
print(ans)