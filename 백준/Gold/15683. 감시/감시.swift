let nm = readLine()!.split{$0==" "}.compactMap{Int(String($0))}
let (n,m) = (nm[0], nm[1])

var map = [[Int]]()
for _ in 0..<n {
  map.append(readLine()!.split{$0==" "}.compactMap{Int(String($0))})
}

// cctv 좌표 배열
var arr = [(x: Int, y: Int)]()

func debugMap(_ arr: [[Int]]) {
  for i in 0..<n {
    for j in 0..<m {
      print(arr[i][j], terminator: " ")
    }
    print()
  }
}

// 1: 시계 90도 / 2: 시계 180도 / 3: 시계 270도 / 0: 시계 360도
func cal(_ map: [[Int]], _ idx: Int, _ dir: Int, _ pos: (x: Int, y: Int)) -> [[Int]] {
  if idx == 1 {
    var map = map
    if dir == 0 {
      var (cx, cy) = (pos.x, pos.y)
      while true {
        let (nx, ny) = (cx, cy + 1)
        if !((0..<n) ~= nx && (0..<m) ~= ny) { break }
        // cctv 있거나 이미 감시한 영역이면 break
        if map[nx][ny] == 6 { break }
        map[nx][ny] = -1
        (cx, cy) = (nx, ny)
      }
    }

    else if dir == 1 {
      var (cx, cy) = (pos.x, pos.y)
      while true {
        let (nx, ny) = (cx + 1, cy)
        if !((0..<n) ~= nx && (0..<m) ~= ny) { break }
        // cctv 있거나 이미 감시한 영역이면 break
        if map[nx][ny] == 6 { break }
        map[nx][ny] = -1
        (cx, cy) = (nx, ny)
      }
    }

    else if dir == 2 {
      var (cx, cy) = (pos.x, pos.y)
      while true {
        let (nx, ny) = (cx, cy - 1)
        if !((0..<n) ~= nx && (0..<m) ~= ny) { break }
        // cctv 있거나 이미 감시한 영역이면 break
        if map[nx][ny] == 6 { break }
        map[nx][ny] = -1
        (cx, cy) = (nx, ny)
      }
    }

    else if dir == 3 {
      var (cx, cy) = (pos.x, pos.y)
      while true {
        let (nx, ny) = (cx - 1, cy)
        if !((0..<n) ~= nx && (0..<m) ~= ny) { break }
        // cctv 있거나 이미 감시한 영역이면 break
        if map[nx][ny] == 6 { break }
        map[nx][ny] = -1
        (cx, cy) = (nx, ny)
      }
    }
    return map
  }

  else if idx == 2 {
    var map = map
    // 좌우
    if dir == 0 || dir == 2 {
      var (cx, cy) = (pos.x, pos.y)

      // 좌측
      while true {
        let (nx, ny) = (cx, cy - 1)
        if !((0..<n) ~= nx && (0..<m) ~= ny) { break }
        // cctv 있거나 이미 감시한 영역이면 break
        if map[nx][ny] == 6 { break }
        map[nx][ny] = -1
        (cx, cy) = (nx, ny)
      }

      (cx, cy) = (pos.x, pos.y)
      // 우측
      while true {
        let (nx, ny) = (cx, cy + 1)
        if !((0..<n) ~= nx && (0..<m) ~= ny) { break }
        // cctv 있거나 이미 감시한 영역이면 break
        if map[nx][ny] == 6 { break }
        map[nx][ny] = -1
        (cx, cy) = (nx, ny)
      }
    }

    // 상하
    else if dir == 1 || dir == 3 {
      var (cx, cy) = (pos.x, pos.y)

      // 상
      while true {
        let (nx, ny) = (cx - 1, cy)
        if !((0..<n) ~= nx && (0..<m) ~= ny) { break }
        // cctv 있거나 이미 감시한 영역이면 break
        if map[nx][ny] == 6 { break }
        map[nx][ny] = -1
        (cx, cy) = (nx, ny)
      }

      (cx, cy) = (pos.x, pos.y)
      // 하
      while true {
        let (nx, ny) = (cx + 1, cy)
        if !((0..<n) ~= nx && (0..<m) ~= ny) { break }
        // cctv 있거나 이미 감시한 영역이면 break
        if map[nx][ny] == 6 { break }
        map[nx][ny] = -1
        (cx, cy) = (nx, ny)
      }
    }

    return map
  }

  else if idx == 3 {
    var map = map
    if dir == 0 {
      var (cx, cy) = (pos.x, pos.y)

      // 상
      while true {
        let (nx, ny) = (cx - 1, cy)
        if !((0..<n) ~= nx && (0..<m) ~= ny) { break }
        // cctv 있거나 이미 감시한 영역이면 break
        if map[nx][ny] == 6 { break }
        map[nx][ny] = -1
        (cx, cy) = (nx, ny)
      }

      (cx, cy) = (pos.x, pos.y)
      // 우
      while true {
        let (nx, ny) = (cx, cy + 1)
        if !((0..<n) ~= nx && (0..<m) ~= ny) { break }
        // cctv 있거나 이미 감시한 영역이면 break
        if map[nx][ny] == 6 { break }
        map[nx][ny] = -1
        (cx, cy) = (nx, ny)
      }
    }

    else if dir == 1 {
      var (cx, cy) = (pos.x, pos.y)

      // 우
      while true {
        let (nx, ny) = (cx, cy + 1)
        if !((0..<n) ~= nx && (0..<m) ~= ny) { break }
        // cctv 있거나 이미 감시한 영역이면 break
        if map[nx][ny] == 6 { break }
        map[nx][ny] = -1
        (cx, cy) = (nx, ny)
      }

      (cx, cy) = (pos.x, pos.y)
      // 하
      while true {
        let (nx, ny) = (cx + 1, cy)
        if !((0..<n) ~= nx && (0..<m) ~= ny) { break }
        // cctv 있거나 이미 감시한 영역이면 break
        if map[nx][ny] == 6 { break }
        map[nx][ny] = -1
        (cx, cy) = (nx, ny)
      }
    }

    else if dir == 2 {
      var (cx, cy) = (pos.x, pos.y)

      // 좌
      while true {
        let (nx, ny) = (cx, cy - 1)
        if !((0..<n) ~= nx && (0..<m) ~= ny) { break }
        // cctv 있거나 이미 감시한 영역이면 break
        if map[nx][ny] == 6 { break }
        map[nx][ny] = -1
        (cx, cy) = (nx, ny)
      }

      (cx, cy) = (pos.x, pos.y)
      // 하
      while true {
        let (nx, ny) = (cx + 1, cy)
        if !((0..<n) ~= nx && (0..<m) ~= ny) { break }
        // cctv 있거나 이미 감시한 영역이면 break
        if map[nx][ny] == 6 { break }
        map[nx][ny] = -1
        (cx, cy) = (nx, ny)
      }
    }

    else if dir == 3 {
      var (cx, cy) = (pos.x, pos.y)

      // 좌
      while true {
        let (nx, ny) = (cx, cy - 1)
        if !((0..<n) ~= nx && (0..<m) ~= ny) { break }
        // cctv 있거나 이미 감시한 영역이면 break
        if map[nx][ny] == 6 { break }
        map[nx][ny] = -1
        (cx, cy) = (nx, ny)
      }

      (cx, cy) = (pos.x, pos.y)
      // 상
      while true {
        let (nx, ny) = (cx - 1, cy)
        if !((0..<n) ~= nx && (0..<m) ~= ny) { break }
        // cctv 있거나 이미 감시한 영역이면 break
        if map[nx][ny] == 6 { break }
        map[nx][ny] = -1
        (cx, cy) = (nx, ny)
      }
    }

    return map
  }

  else if idx == 4 {
    var map = map
    if dir == 0 {
      var (cx, cy) = (pos.x, pos.y)

      // 좌
      while true {
        let (nx, ny) = (cx, cy - 1)
        if !((0..<n) ~= nx && (0..<m) ~= ny) { break }
        // cctv 있거나 이미 감시한 영역이면 break
        if map[nx][ny] == 6 { break }
        map[nx][ny] = -1
        (cx, cy) = (nx, ny)
      }

      (cx, cy) = (pos.x, pos.y)
      // 상
      while true {
        let (nx, ny) = (cx - 1, cy)
        if !((0..<n) ~= nx && (0..<m) ~= ny) { break }
        // cctv 있거나 이미 감시한 영역이면 break
        if map[nx][ny] == 6 { break }
        map[nx][ny] = -1
        (cx, cy) = (nx, ny)
      }

      (cx, cy) = (pos.x, pos.y)
      // 우
      while true {
        let (nx, ny) = (cx, cy + 1)
        if !((0..<n) ~= nx && (0..<m) ~= ny) { break }
        // cctv 있거나 이미 감시한 영역이면 break
        if map[nx][ny] == 6 { break }
        map[nx][ny] = -1
        (cx, cy) = (nx, ny)
      }
    }

    else if dir == 1 {
      var (cx, cy) = (pos.x, pos.y)

      // 하
      while true {
        let (nx, ny) = (cx + 1, cy)
        if !((0..<n) ~= nx && (0..<m) ~= ny) { break }
        // cctv 있거나 이미 감시한 영역이면 break
        if map[nx][ny] == 6 { break }
        map[nx][ny] = -1
        (cx, cy) = (nx, ny)
      }

      (cx, cy) = (pos.x, pos.y)
      // 상
      while true {
        let (nx, ny) = (cx - 1, cy)
        if !((0..<n) ~= nx && (0..<m) ~= ny) { break }
        // cctv 있거나 이미 감시한 영역이면 break
        if map[nx][ny] == 6 { break }
        map[nx][ny] = -1
        (cx, cy) = (nx, ny)
      }

      (cx, cy) = (pos.x, pos.y)
      // 우
      while true {
        let (nx, ny) = (cx, cy + 1)
        if !((0..<n) ~= nx && (0..<m) ~= ny) { break }
        // cctv 있거나 이미 감시한 영역이면 break
        if map[nx][ny] == 6 { break }
        map[nx][ny] = -1
        (cx, cy) = (nx, ny)
      }
    }

    else if dir == 2 {
      var (cx, cy) = (pos.x, pos.y)

      // 좌
      while true {
        let (nx, ny) = (cx, cy - 1)
        if !((0..<n) ~= nx && (0..<m) ~= ny) { break }
        // cctv 있거나 이미 감시한 영역이면 break
        if map[nx][ny] == 6 { break }
        map[nx][ny] = -1
        (cx, cy) = (nx, ny)
      }

      (cx, cy) = (pos.x, pos.y)
      // 하
      while true {
        let (nx, ny) = (cx + 1, cy)
        if !((0..<n) ~= nx && (0..<m) ~= ny) { break }
        // cctv 있거나 이미 감시한 영역이면 break
        if map[nx][ny] == 6 { break }
        map[nx][ny] = -1
        (cx, cy) = (nx, ny)
      }

      (cx, cy) = (pos.x, pos.y)
      // 우
      while true {
        let (nx, ny) = (cx, cy + 1)
        if !((0..<n) ~= nx && (0..<m) ~= ny) { break }
        // cctv 있거나 이미 감시한 영역이면 break
        if map[nx][ny] == 6 { break }
        map[nx][ny] = -1
        (cx, cy) = (nx, ny)
      }
    }

    else if dir == 3 {
      var (cx, cy) = (pos.x, pos.y)

      // 좌
      while true {
        let (nx, ny) = (cx, cy - 1)
        if !((0..<n) ~= nx && (0..<m) ~= ny) { break }
        // cctv 있거나 이미 감시한 영역이면 break
        if map[nx][ny] == 6 { break }
        map[nx][ny] = -1
        (cx, cy) = (nx, ny)
      }

      (cx, cy) = (pos.x, pos.y)
      // 상
      while true {
        let (nx, ny) = (cx - 1, cy)
        if !((0..<n) ~= nx && (0..<m) ~= ny) { break }
        // cctv 있거나 이미 감시한 영역이면 break
        if map[nx][ny] == 6 { break }
        map[nx][ny] = -1
        (cx, cy) = (nx, ny)
      }

      (cx, cy) = (pos.x, pos.y)
      // 하
      while true {
        let (nx, ny) = (cx + 1, cy)
        if !((0..<n) ~= nx && (0..<m) ~= ny) { break }
        // cctv 있거나 이미 감시한 영역이면 break
        if map[nx][ny] == 6 { break }
        map[nx][ny] = -1
        (cx, cy) = (nx, ny)
      }
    }

    return map
  }

  else if idx == 5 {
      var map = map
      var (cx, cy) = (pos.x, pos.y)

      // 좌
      while true {
        let (nx, ny) = (cx, cy - 1)
        if !((0..<n) ~= nx && (0..<m) ~= ny) { break }
        // cctv 있거나 이미 감시한 영역이면 break
        if map[nx][ny] == 6 { break }
        map[nx][ny] = -1
        (cx, cy) = (nx, ny)
      }

      (cx, cy) = (pos.x, pos.y)
      // 상
      while true {
        let (nx, ny) = (cx - 1, cy)
        if !((0..<n) ~= nx && (0..<m) ~= ny) { break }
        // cctv 있거나 이미 감시한 영역이면 break
        if map[nx][ny] == 6 { break }
        map[nx][ny] = -1
        (cx, cy) = (nx, ny)
      }

      (cx, cy) = (pos.x, pos.y)
      // 우
      while true {
        let (nx, ny) = (cx, cy + 1)
        if !((0..<n) ~= nx && (0..<m) ~= ny) { break }
        // cctv 있거나 이미 감시한 영역이면 break
        if map[nx][ny] == 6 { break }
        map[nx][ny] = -1
        (cx, cy) = (nx, ny)
      }

      (cx, cy) = (pos.x, pos.y)
      // 하
      while true {
        let (nx, ny) = (cx + 1, cy)
        if !((0..<n) ~= nx && (0..<m) ~= ny) { break }
        // cctv 있거나 이미 감시한 영역이면 break
        if map[nx][ny] == 6 { break }
        map[nx][ny] = -1
        (cx, cy) = (nx, ny)
      }

      return map
  }

  else {
    return map
  }
}

// cctv
var cctv = [Int]()
for i in 0..<n {
  for j in 0..<m {
    if (1...5) ~= map[i][j] {
      arr.append((i,j))
      cctv.append(map[i][j])
    }
  }
}

var ans = Int.max
// dir 0 ~ 3
func dfs(_ idx: Int, _ dir: Int, _ map: [[Int]]) {
  if idx == cctv.count {
    // map의 감시 영역 계산 -> 0으로만 된 지역
    let res = map.flatMap{$0}.filter{$0==0}.count
    ans = min(ans, res)
    return
  }

  var map = map
  map = cal(map, cctv[idx], dir, arr[idx])

  for i in 0..<4 {
    dfs(idx+1, i, map)
  }
}

for i in 0..<4 {
  dfs(0, i, map)
}
print(ans)