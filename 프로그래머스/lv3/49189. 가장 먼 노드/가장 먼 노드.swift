import Foundation

// 인접 리스트로 구현 + 무방향 그래프
func makeGraph(_ edge: [[Int]]) -> [Int: [Int]] {
    var graph: [Int: [Int]] = [:]
    for v in edge {
        if let e = graph[v[0]] {
            graph[v[0]] = e + [v[1]]
        } else {
            graph[v[0]] = [v[1]]
        }
        
        if let e = graph[v[1]] {
            graph[v[1]] = e + [v[0]]
        } else {
            graph[v[1]] = [v[0]]
        }
    }
    return graph
}

func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    let graph: [Int: [Int]] = makeGraph(edge)
    
    var visited = Set<Int>()
    var queue = [(level: 1, number: 1)]
    
    var maxLevel = 1
    var answer: [[Int]] = []
    
    while !queue.isEmpty {
        var (level, num) = queue.removeFirst()

        guard !visited.contains(num) else { continue }
        visited.insert(num)
        answer.append([level, num])
        
        for next in graph[num] ?? [] {
            queue.append((level + 1, next))
        }
        
        maxLevel = level
    }
    
    return answer.filter { maxLevel == $0[0] }.count
}