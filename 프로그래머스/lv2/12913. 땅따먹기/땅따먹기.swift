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
    let (n, m) = (land.count, 4)
    
    // 2차원 dp table
    var dp = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
    
    // 첫 줄
    for i in 0..<m {
        dp[0][i] = land[0][i]
    }
    
    for i in 1..<n {
        for j in 0..<m {
            if j == 0 {
                dp[i][j] = land[i][j] + max(dp[i-1][1], dp[i-1][2], dp[i-1][3])
            }
            
            if j == 1 {
                dp[i][j] = land[i][j] + max(dp[i-1][0], dp[i-1][2], dp[i-1][3])
            }
            
            if j == 2 {
                dp[i][j] = land[i][j] + max(dp[i-1][0], dp[i-1][1], dp[i-1][3])
            }
            
            if j == 3 {
                dp[i][j] = land[i][j] + max(dp[i-1][0], dp[i-1][1], dp[i-1][2])
            }
        }
    }
    
    return dp[n-1].max()!
}