let nk = readLine()!.split{$0==" "}.compactMap{Int(String($0))}
let (n, k) = (nk[0], nk[1])
let a = readLine()!.split{$0==" "}.compactMap{Int(String($0))}
var mx = -Int.max
var p = [Int](repeating: 0, count: n+1)

p[0] = a[0]
for i in 1..<a.count {
  p[i] = p[i-1] + a[i]
}

for i in (k-1)..<a.count {
  if i == k-1 { mx = max(mx, p[i]) }
  else { mx = max(mx, p[i] - p[i-k]) }
}

print(mx)