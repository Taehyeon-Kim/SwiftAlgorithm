import Foundation

// 4 -> 3 -> 2 -> 5
// 1 -> 2

// 4,3,1 사이는 순서를 매길 수 없음
// 2는 3명보다 아래이므로 4등
// 5는 5등

func solution(_ n:Int, _ results:[[Int]]) -> Int {
    var answer = 0
    var d = Array(repeating: Array(repeating: 0, count: n), count: n)
    
    // 테이블 초기화
    for result in results {
        let winner = result[0] - 1, loser = result[1] - 1
        d[winner][loser] = 1
        d[loser][winner] = -1
    }

    // 테이블 갱신
    for k in 0..<n {
        for i in 0..<n {
            for j in 0..<n {
                if d[i][k] == 1 && d[k][j] == 1 {
                    d[i][j] = 1
                    d[j][i] = -1
                }
            }
        }
    }
    
    // 이기고 지고 판별이 되는 지만 파악
    for row in d {
        if row.filter { $0 != 0 }.count == n-1 { answer += 1 }
    }
    
    return answer
}