// 경우의 수 문제 -> 조합 혹은 순열
// 모든 경우를 찾아서 풀 수 있는가 -> n이 최대 20
// 팀 절반만 찾으면 되니까 20개 중에 10개 뽑는 경우의 수

/*
visited
mx <- 0
func dfs(idx, arr)
  if arr.count == n/2
    mx = max(mx, calculate(arr))
    return

  for i in idx..<n
    if visited[i] { continue }

    visited[i] = true
    if !visited[i]
      dfs(i, arr + [i])
    visited[i] = false

for i in 0..<n/2
  dfs(i, [])
*/

let n = Int(readLine()!)!
var board = [[Int]]()
for _ in 0..<n {
  let input = readLine()!.split{$0==" "}.compactMap{Int(String($0))}
  board.append(input)
}

var mn = Int.max
var visited = [Bool](repeating: false, count: n)
func calculate(_ arr: [Int]) -> Int {
  let one = arr
  let other = (0..<n).filter{!arr.contains($0)}

  var oneSum = 0
  for i in one {
    for j in one {
      if i == j { continue }
      oneSum += board[i][j]
    }
  }

  var otherSum = 0
  for i in other {
    for j in other {
      if i == j { continue }
      otherSum += board[i][j]
    }
  }

  return abs(oneSum - otherSum)
}

func dfs(_ idx: Int, _ arr: [Int]) {
  if arr.count == n/2 {
    mn = min(mn, calculate(arr))
  }

  for i in idx..<n {
    if visited[i] { continue }
    visited[i] = true
    dfs(i, arr+[i])
    visited[i] = false
  }
}

dfs(0, [])
print(mn)