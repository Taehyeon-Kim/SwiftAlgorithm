let nm = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let (n, m) = (nm[0], nm[1])

var p = [Int]()
for i in 0..<n+1 {
    p.append(i)
}

/// 부모 노드 찾는 메서드
func findParent(_ x: Int) -> Int {
    if p[x] == x { return x }
    p[x] = findParent(p[x])
    return p[x]
}

/// 합치는 메서드
func union(_ u: Int, _ v: Int) {
    let u = findParent(u)
    let v = findParent(v)
    if u == v { return }
    if u < v { p[v] = u }
    else { p[u] = v }
}

/// 같은 부모를 가리키는지 즉, 같은 집합인지 체크하는 메서드
func sameParent(_ u: Int, _ v: Int) -> Bool {
    let u = findParent(u)
    let v = findParent(v)
    if u == v { return true }
    return false
}

for _ in 0..<m {
    let line = readLine()!.split(separator: " ").compactMap{Int(String($0))}
    let (cmd, a, b) = (line[0], line[1], line[2])
    
    if cmd == 0 {
        union(a, b)
    } else {
        print(sameParent(a, b) ? "YES" : "NO")
    }
}