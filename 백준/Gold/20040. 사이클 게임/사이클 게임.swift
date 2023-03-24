let nm = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let (n, m) = (nm[0], nm[1])

var p = [Int]()
for i in 0..<n {
  p.append(i)
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
  else { p[v] = u }
  return true
}

var edges = [(Int, Int)]()
var answer = 0

for i in 0..<m {
  let line = readLine()!.split(separator: " ").compactMap{Int(String($0))}
  let (u, v) = (line[0], line[1])
  
  if !union(u, v) { 
    answer = i + 1
    break
  }
}

print(answer)