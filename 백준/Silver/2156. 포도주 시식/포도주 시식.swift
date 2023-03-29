let n = Int(readLine()!)!
var wines: [Int] = [0]
for _ in 0..<n {
  wines.append(Int(readLine()!)!)
}
var dp = Array(repeating: 0, count: n+1)

dp[0] = 0
dp[1] = wines[1]
if n >= 2 {
    dp[2] = wines[1] + wines[2]    
}

for i in stride(from: 3, through: n, by: 1) {
  dp[i] = max(dp[i-3] + wines[i-1] + wines[i], dp[i-2] + wines[i], dp[i-1])
}

print(dp[n])