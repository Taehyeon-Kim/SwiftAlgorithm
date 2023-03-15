// MARK: Input
let nm = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let input = readLine()!.split(separator: " ").compactMap{Int(String($0))}

let (n,m) = (nm[0], nm[1])

// 로봇 청소기 좌표(r, c) + 방향(d)
let (r,c) = (input[0], input[1])
var d = input[2]

var board = [[Int]](repeating: [Int](), count: n)
for i in 0..<n {
  let line = readLine()!.split(separator: " ").compactMap{Int(String($0))}
  board[i].append(contentsOf: line)
}

// 방향
// 0: 북, 1: 동, 2: 남, 3: 서
let dirs: [(x: Int, y: Int)] = [(-1,0),(0,1),(1,0),(0,-1)]
var ans = 0

// 현재 좌표 기준으로 주변 청소 여부 판별
// - 하나라도 청소되지 않은 빈칸 있으면 true
// - 없으면 false
func checkAround(_ cx: Int, _ cy: Int) -> Bool {
  var ret = false
  for dir in dirs {
    let (nx, ny) = (cx + dir.x, cy + dir.y)
    if (0..<n) ~= nx && (0..<m) ~= ny && board[nx][ny] == 0 {
      ret = true
    }
  }
  return ret
}

// 청소되지 않은 빈칸 있을때만 실행
// - 앞쪽이 빈칸일때까지 회전 반복
// - return 방향 -> 방향 전역변수로 변경
func rotate(_ x: Int, _ y: Int) {
  d -= 1 // 반시계 회전
  d = d < 0 ? d + 4 : d // 음수 값인 경우에는 4 더해주기
}

func moveToFront(_ x: Int, _ y: Int) -> (x: Int, y: Int) {
  // 좌표 이동(전진)
  // - 좌표 (방향 기준으로 +1)
  let (nx, ny) = (x + dirs[d].x, y + dirs[d].y)
  if (0..<n) ~= nx && (0..<m) ~= ny && board[nx][ny] == 0 {
    return (nx, ny)
  }
  return (x, y)
}

func moveToBack(_ x: Int, _ y: Int) -> (x: Int, y: Int, keepGoing: Bool) {
  // 좌표 이동(후진)
  let point = d < 2 ? d + 2 : d - 2
  let (nx, ny) = (x + dirs[point].x, y + dirs[point].y)

  // 벽이라면
  if board[nx][ny] == 1 {
    return (x, y, false)
  }

  return (nx, ny, true)
}

func cleanUp(_ x: Int, _ y: Int) {
  // 0(빈칸) -> 2(청소)
  if board[x][y] == 0 {
    board[x][y] = 2
    ans += 1
  }
}

// func debug() {
//   print("======== BOARD =========")
//   for i in 0..<n {
//     for j in 0..<m {
//       print(board[i][j], terminator: " ")

//       if board[i][j] == 2 {
//         ans += 1
//       }
//     }
//     print()
//   }
// }

func solution(_ sx: Int, _ sy: Int) {
  // 현재 좌표
  var (cx, cy) = (sx, sy)

  while true {
    cleanUp(cx, cy) // 현재 칸 청소

    // 빈칸 있는 경우
    if checkAround(cx, cy) {
      rotate(cx, cy)
      (cx, cy) = moveToFront(cx, cy)
    } else {
      let (x, y, keepGoing) = moveToBack(cx, cy)
      if keepGoing {
        (cx, cy) = (x, y)
      } else {
        return
      }
    }
  }
}

solution(r, c)
// debug()
print(ans)