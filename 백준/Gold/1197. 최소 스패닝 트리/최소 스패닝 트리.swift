func input() -> (p: [Int], tuple: [(Int, Int, Int)], v: Int, e: Int) {
    let ve = readLine()!.split(separator: " ").compactMap {Int(String($0))}
    let (v, e) = (ve[0], ve[1])
    var tuple = [(Int, Int, Int)]()
    for _ in 0..<e {
        let line = readLine()!.split(separator: " ").compactMap {Int(String($0))}
        let (a, b, c) = (line[0], line[1], line[2])
        tuple.append((c, a, b))
    }
    tuple = tuple.sorted(by: { $0.0 < $1.0 })
  
    var p = [Int]()
    for i in 0..<v+1 {
        p.append(i)
    }
    
    return (p, tuple, v, e)
}

func kruskcal() -> Int {
    var (p, tuple, V, _) = input()

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
    
    var (ans, cnt) = (0, 0)
    for (cost, u, v) in tuple {
        if union(u, v) {
            cnt += 1
            ans += cost
            if cnt == V - 1 {
                return ans
            }
        }
    }
    return ans
}

print(kruskcal())