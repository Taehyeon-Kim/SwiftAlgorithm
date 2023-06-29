let n = Int(readLine()!)!
var a = [[Int]]()
for _ in 0..<n {
  let input = readLine()!.split(separator: " ").compactMap{Int(String($0))}
  a.append(input)
}

var dp = Array(repeating: 0, count: n+1)
for i in stride(from: n-1, through: 0, by: -1) {
  // 상담 가능
  if i + a[i][0] <= n {
    dp[i] = max(dp[i + a[i][0]] + a[i][1], dp[i+1])
  } 
  // 상담 불가
  else {
    dp[i] = dp[i+1]
  }
}
// print(dp)
print(dp[0])