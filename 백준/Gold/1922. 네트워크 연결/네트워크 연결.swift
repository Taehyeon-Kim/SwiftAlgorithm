import Foundation

// input
let (n, m) = (Int(readLine()!)!, Int(readLine()!)!)
var tuple = [(Int, Int, Int)]()
for _ in 0..<m {
  let line = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
  let (u, v, cost) = (line[0], line[1], line[2])
  tuple.append((cost, u, v))
}
tuple.sort(by: { $0.0 < $1.0 })

// 루트 노드 초기화
var p = [Int]()
for i in 0..<n+1 {
  p.append(i)
}

func findParent(_ v: Int) -> Int {
  if p[v] == v { return v }
  p[v] = findParent(p[v])
  return p[v]
}

func union(_ u: Int, _ v: Int) -> Bool {
  let u = findParent(u)
  let v = findParent(v)
  if u == v { return false }
  else { p[v] = u }
  return true
}

func kruskcal() -> Int {
  var (ret, edges) = (0, 0)

  for (cost, u, v) in tuple {
    // 합칠 수 있다 = 사이클 x = 서로소
    if union(u, v) {
      ret += cost
      edges += 1
      // vertex - 1 까지 반복 가능
      if edges == n - 1 {
        return ret
      }
    }
  }
  return -1
}

print(kruskcal())