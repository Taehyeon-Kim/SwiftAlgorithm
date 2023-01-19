import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var answer = 0
    var visited = Array(repeating: false, count: n)
    
    func bfs(_ n: Int, _ graph: [[Int]], _ start: Int, _ visited: inout [Bool]) {
        var queue = [start]
        visited[start] = true
        
        while !queue.isEmpty {
            let v = queue.removeFirst()
            
            for i in 0..<n {
                if !visited[i] && graph[v][i] == 1 {
                    queue.append(i)
                    visited[i] = true
                }
            }
        }
    }
    
    for i in 0..<n {
        if !visited[i] {
            bfs(n, computers, i, &visited)
            answer += 1
        }
    }
    
    return answer
}