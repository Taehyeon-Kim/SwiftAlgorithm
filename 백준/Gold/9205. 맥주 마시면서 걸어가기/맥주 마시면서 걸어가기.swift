let tc = Int(readLine()!)!

for _ in 0..<tc {
  let store = Int(readLine()!)!
  var points = [[Int]]()
  var visited = [Bool](repeating: false, count: store+2)

  for _ in 0..<store+2 {
    let line = readLine()!.split(separator: " ").compactMap{Int(String($0))}
    points.append(line)
  }

  func cal(_ a: [Int], _ b: [Int]) -> Int {
    return abs(a[0] - b[0]) + abs(a[1] - b[1])
  }

  func go(_ idx: Int) {
    visited[idx] = true
    for i in 0..<store+2 {
      if !visited[i] && cal(points[i],  points[idx]) <= 1000 {
        go(i)
      }
    }
  }

  go(0)

  if visited.last! {
    print("happy")
  } else {
    print("sad")
  }
}