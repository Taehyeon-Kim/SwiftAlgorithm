let n = Int(readLine()!)!
let m = Int(readLine()!)!

var graph: [[Int]] = []
var route: [Int] = []
var visited: [Bool] = Array(repeating: false, count: n)

for _ in 0 ..< n {
  let line = readLine()!.split(separator: " ").compactMap{Int(String($0))}
  graph.append(line)
}

route = readLine()!.split(separator: " ").compactMap{Int(String($0))}

func dfs(_ x: Int) {
  visited[x] = true
  
  for i in 0..<n {
    if graph[x][i] == 1 && !visited[i] {
      dfs(i)
    }
  }
}

dfs(route[0] - 1)

var answer = true
for r in route {
    if !visited[r-1] {
        answer = false
        break
    }
}
print(answer ? "YES" : "NO")