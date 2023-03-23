let nm = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let (n,m) = (nm[0], nm[1])

var values = [(a: Int, b: Int)]()
// 선수 조건
for _ in 0..<m {
  let line = readLine()!.split(separator: " ").compactMap{Int(String($0))}
  let (a, b) = (line[0], line[1])
  values.append((a, b))
}
values.sort(by: {$0.a < $1.a})

var pre = Array(repeating: 0, count: n+1)
for value in values {
  // a: pre
  let (a, b) = (value.a, value.b)
  pre[b] = max(pre[a] + 1, pre[b])
}

for i in 1..<n+1 {
  print(pre[i] + 1, terminator: " ")
}