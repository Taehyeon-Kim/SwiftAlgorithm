let n = Int(readLine()!)!
var d = Array(repeating: 0, count: n+1)

for i in 2..<n+1 {
    d[i] = d[i-1] + 1
    if i%3 == 0 { 
      d[i] = min(d[i], d[i/3] + 1)
    }
    if i%2 == 0 { 
      d[i] = min(d[i], d[i/2] + 1)
    }

}
print(d[n])