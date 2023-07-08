let n = Int(readLine()!)!
let m = Int(readLine()!)!
var a = readLine()!.split{$0==" "}.compactMap{Int(String($0))}.sorted()

var (s, e) = (0, n-1)
var cnt = 0

for _ in 0..<n {
  if s == e { break }
  if a[s] + a[e] == m { cnt += 1; s += 1 }
  else if a[s] + a[e] > m { e -= 1 }
  else if a[s] + a[e] < m { s += 1 }
}
print(cnt)