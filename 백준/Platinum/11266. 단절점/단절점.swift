func input() -> (v: Int, e: Int, graph: [[Int]]) {
  let input = readLine()!.split(separator: " ").compactMap{Int(String($0))}
  let (v, e) = (input[0], input[1])

  var graph = [[Int]](repeating: [Int](), count: v)
  for _ in 0..<e {
    let line = readLine()!.split(separator: " ").compactMap{Int(String($0))}
    let (u, v) = (line[0]-1, line[1]-1)
    graph[u].append(v)
    graph[v].append(u)
  }
  return (v, e, graph)
}

let (v, e, graph) = input()

/// 단절점 찾는 함수
func solution(_ v: Int, _ graph: [[Int]]) -> [Int] {
    var discovery = Array(repeating: -1, count: v)
    var low = Array(repeating: -1, count: v)
    var points = Array(repeating: false, count: v)

    func dfs(_ u: Int, _ p: Int, _ time: inout Int, _ child: inout [Int]) -> Int {
        discovery[u] = time
        low[u] = time
        time += 1

        for v in graph[u] {
            if discovery[v] == -1 {
                child[u] += 1
                let subLow = dfs(v, u, &time, &child)
                low[u] = min(low[u], subLow)

                if p == -1 {
                    if child[u] >= 2 {
                        points[u] = true
                    }
                } else if subLow >= discovery[u] {
                    points[u] = true
                }
            } else if v != p {
                low[u] = min(low[u], discovery[v])
            }
        }

        return low[u]
    }

    var time = 0
    var child = Array(repeating: 0, count: v)
    for u in 0..<v {
        if discovery[u] == -1 {
            _ = dfs(u, -1, &time, &child)
            if child[u] >= 2 {
                points[u] = true
            }
        }
    }

    return points.indices.filter { points[$0] }
}

let points = solution(v, graph)
print(points.count)
print(points.map { String($0 + 1) }.joined(separator: " "))