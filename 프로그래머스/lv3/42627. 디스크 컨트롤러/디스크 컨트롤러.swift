import Foundation

// 어떨때 최소가 될까
// 총 걸린시간이 작으려면 대기시간 + 작업시간이 최소가 되어야 하는데
// 대기시간이 작으려면 작은 일부터 처리를 해주어야 된다.
// 1개의 일을 처리하는데 걸리는 시간이 T라고 할 때, n-1개의 대기시간은 (n-1) * T 가 되므로 T를 작게 가져가야 한다.

func solution(_ jobs:[[Int]]) -> Int {    

    // 첫 정렬 -> 요청 시점이 가장 빠른 작업, 요청 시점이 같다면 작업 시간이 짧은 작업
    var tasks = jobs.sorted { lhs, rhs in lhs[0] == rhs[0] ? lhs[1] < rhs[1] : lhs[0] < rhs[0] }
    tasks.sort { lhs, rhs in lhs[1] == rhs[1] ? lhs[0] < rhs[0] : lhs[1] < rhs[1] }
    
    var currentTime = 0     // 시점 파악에 쓰이는 시간(endTime)
    var totalTime = 0       // 최종 시간
    
    // Tasks 모두 수행하기 전까지 반복
    while !tasks.isEmpty {
        for i in 0..<tasks.count {
            // Ready Queue에 들어가 있는 작업 선택 : 이미 위에서 작업 시간 기준으로 정렬했기 때문에 순차적으로 반복문 돌리면 조건에 맞게 앞에서 제거
            if tasks[i][0] <= currentTime {
                currentTime += tasks[i][1]              // 작업 요청 시점
                totalTime += currentTime - tasks[i][0]  // 요청 시간 ~ 작업 종료 시간
                tasks.remove(at: i)
                break
            }
            
            // 아직 작업이 들어오지 않은 경우가 있을 수 있으므로, 시간을 1씩 계속 증가
            // ex. 중간에 텀이 있는 경우
            if i == tasks.count - 1 {
                currentTime += 1
            }
        }
    }

    return totalTime / jobs.count
}