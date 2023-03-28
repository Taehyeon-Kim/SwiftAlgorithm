import Foundation

/*
1  2  3  5
5  6  7. 8
4. 3. 2. 1

1  2  3  5
10 11.12.11
16.15.13.13

마지막 줄은
d[n][3]
max(d[n-1][0], d[n-1][1], d[n-1][2])

d[n][2]
max(d[n-1][0], d[n-1][1], d[n-1][3])

d[n][1]
max(d[n-1][0], d[n-1][2], d[n-1][3])

d[n][0]
max(d[n-1][1], d[n-1][2], d[n-1][3])
*/


func solution(_ land:[[Int]]) -> Int{
    var answer = 0
    let n = land.count
    // 2차원 dp table
    var dp = [[Int]](repeating: [Int](repeating: 0, count: 4), count: n)
    
    // 첫 줄
    for i in 0..<4 {
        dp[0][i] = land[0][i]
    }
    
    for i in 1..<n {
        for j in 0..<4 {
            for k in 0..<4 {
                if j != k { 
                    dp[i][j] = max(dp[i][j], land[i][j] + dp[i-1][k])
                }
            }
        }
    }
    return dp[n-1].max()!
}