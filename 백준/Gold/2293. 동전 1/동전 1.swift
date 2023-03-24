import Foundation

let nk = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let (n,k) = (nk[0],nk[1])

var coins = [Int]()
for _ in 0..<n {
    coins.append(Int(readLine()!)!)
}

var dp = Array(repeating: 0, count: k + 1)
dp[0] = 1

for i in 0..<n {
    for j in stride(from: coins[i], through: k, by: 1) {
        if dp[j] + dp[j - coins[i]] >= Int(pow(2.0, 31.0)) {
            dp[j] = 0
        } else{
            dp[j] += dp[j - coins[i]]
        }
    }
}
print(dp[k])