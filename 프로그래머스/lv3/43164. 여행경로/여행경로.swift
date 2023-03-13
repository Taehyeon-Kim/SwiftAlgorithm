import Foundation

let START = "ICN"

func solution(_ tickets:[[String]]) -> [String] {
    let tickets = tickets.sorted{ $0[1] < $1[1] }
    var visited = Array(repeating: false, count: tickets.count)
    var ret = [String]()
    
    func dfs(_ start: String) {
        if ret.count == tickets.count {
            ret.append(start)
            return
        }
        
        for i in 0..<tickets.count {
            if !visited[i] && start == tickets[i][0] {
                visited[i] = true
                ret.append(start)
                
                dfs(tickets[i][1])
                
                // 종료 조건
                if ret.count == tickets.count + 1 {
                    return
                } else {
                    ret.removeLast()
                    visited[i] = false    
                }
            }
        }
    }

    dfs(START)
    return ret
}