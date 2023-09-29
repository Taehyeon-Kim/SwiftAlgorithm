let n = Int(readLine()!)!
let arr = readLine()!.split{$0 == " "}.compactMap{Int(String($0))}
let a = [[1, 3, 9], [1, 9, 3], [3, 1, 9], [3, 9, 1], [9, 1, 3], [9, 3, 1]]

/// 2차원이 넘어가는 다차원 배열인 경우 Swift는 코드가 많이 복잡해진다.
var visited = Array(repeating: Array(repeating: Array(repeating: 0, count: 61), count: 61), count: 61)

/// queue setting
var q = [(Int, Int, Int)]()
if arr.count == 1 {
  q.append((arr[0], 0, 0))
}else if arr.count == 2 {
  q.append((arr[0], arr[1], 0))
}else{
  q.append((arr[0], arr[1], arr[2]))
}

/// bfs
var idx = 0
while idx < q.count {
  let pop = q[idx]
  idx += 1

  if pop.0 == 0 && pop.1 == 0 && pop.2 == 0 {
    print(visited[0][0][0])
    break
  }

  for i in 0..<6 {
    let aa = max(0, pop.0 - a[i][0])
    let bb = max(0, pop.1 - a[i][1])
    let cc = max(0, pop.2 - a[i][2])

    if visited[aa][bb][cc] > 0 { continue }
    q.append((aa,bb,cc))
    visited[aa][bb][cc] = visited[pop.0][pop.1][pop.2] + 1
  }
}