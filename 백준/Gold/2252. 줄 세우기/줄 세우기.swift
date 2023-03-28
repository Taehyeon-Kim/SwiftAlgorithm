let nm = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let (n,m) = (nm[0], nm[1])

var adj: [Int: [Int]] = [:]
for _ in 0..<m {
    let ab = readLine()!.split(separator: " ").compactMap{Int(String($0))}
    adj[ab[0], default: []].append(ab[1])
}

var indegrees = [Int](repeating: 0, count: n+1)
for i in indegrees.indices {
    if let values = adj[i] {
        for j in values {
            indegrees[j] += 1
        }
    }
}

var q = [Int]()
var idx = 0

for (idx, value) in indegrees.enumerated() {
    if value == 0 && idx != 0 {
        q.append(idx)
    }
}

var ret = [Int]()
while q.count > idx {
    let v = q[idx]
    ret.append(v)
    idx += 1
    
    if let values = adj[v] {
        for i in values {
            indegrees[i] -= 1
            if indegrees[i] == 0 {
                q.append(i)
            }
        }
    }
}

print(ret.map{String($0)}.joined(separator: " "))