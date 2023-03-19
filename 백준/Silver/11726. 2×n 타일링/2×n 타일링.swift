let n = Int(readLine()!)!
var d = Array(repeating: 0, count: n+2)

d[1] = 1
d[2] = 2

if n > 2 {
  for i in 3...n {
      d[i] = (d[i-1] + d[i-2]) % 10007
  }  
}
print(d[n])