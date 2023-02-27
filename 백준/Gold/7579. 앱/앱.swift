let nk = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
let (n, m) = (nk[0], nk[1])

let memories = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
let costs = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
var dp = Array(repeating: Array(repeating: 0, count: 10001), count: n + 1)

for i in 1...n {
    for j in 0...10000 {
        if j >= costs[i-1] {
            dp[i][j] = max(dp[i-1][j], dp[i-1][j-costs[i-1]] + memories[i-1])
        } else {
            dp[i][j] = dp[i-1][j]
        }
    }
}

for j in 0...10000 {
    if dp[n][j] >= m {
        print(j)
        break
    }
}