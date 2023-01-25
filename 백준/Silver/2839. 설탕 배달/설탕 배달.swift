// d[k] -> d[k-3] + 1 or d[k-5] + 1
let n = Int(readLine()!)!
var d = Array(repeating: -1, count: 5001)

d[3] = 1; d[5] = 1

if n >= 6 {
  for i in 6...n {
    if i % 5 == 0 { d[i] = d[i-5] + 1 }
    else if i % 3 == 0 { d[i] = d[i-3] + 1 }
    else if d[i-3] > 0 && d[i-5] > 0 {
      d[i] = min(d[i-3], d[i-5]) + 1
    }
  }  
}

print(d[n])