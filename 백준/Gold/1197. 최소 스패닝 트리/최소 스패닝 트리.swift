func input() -> (v: Int, e: Int, tuple: [(Int, Int, Int)]) {
  let ve = readLine()!.split(separator: " ").compactMap{Int(String($0))}

  var tuple = [(Int, Int, Int)]()
  for _ in 0..<ve[1] {
    let line = readLine()!.split(separator: " ").compactMap{Int(String($0))}
    let (cost, a, b) = (line[2], line[0], line[1])
    tuple.append((cost, a, b))
  }
  tuple.sort(by:{$0.0 < $1.0})
  return (ve[0], ve[1], tuple)
}

func kruskal() -> Int {
  let (v, e, tuple) = input()
  var p = [Int](repeating: 0, count: v+1)
  for i in 1..<v+1 {
    p[i] = i
  }

  func findParent(_ x: Int) -> Int {
    if p[x] == x { return x }
    p[x] = findParent(p[x])
    return p[x]
  }

  func union(_ u: Int, _ v: Int) -> Bool {
    let u = findParent(u)
    let v = findParent(v)
    if u == v { return false }
    if u < v { p[v] = u }
    else { p[u] = v }
    return true
  }

  var (cnt, costs) = (0, 0)
  for (cost, a, b) in tuple {
    if union(a, b) {
      cnt += 1
      costs += cost
      if cnt == v-1  {
        return costs
      }
    }
  }

  return -1
}

print(kruskal())