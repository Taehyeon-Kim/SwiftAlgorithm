let nm = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let (n, m) = (nm[0], nm[1])

var p = [Int]()
for i in 0..<n+1 {
    p.append(i)
}

func findParent(_ x: Int) -> Int {
    if p[x] == x { return x }
    p[x] = findParent(p[x])
    return p[x]
}

func union(_ u: Int, _ v: Int) {
    let u = findParent(u)
    let v = findParent(v)
    if u == v { return }
    if u < v { p[v] = u }
    else { p[u] = v }
}

func isSame(_ u: Int, _ v: Int) -> Bool {
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
        print(isSame(a, b) ? "YES" : "NO")
    }
}