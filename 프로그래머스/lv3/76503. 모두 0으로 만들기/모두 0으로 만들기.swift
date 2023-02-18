import Foundation

func solution(_ a:[Int], _ edges:[[Int]]) -> Int64 {
    
    var answer = 0
    var a = a
    
    // 합산이 0이 아니면 0으로 만들 수 있는 트리가 아님
    if a.reduce(0, +) != 0 {
        return Int64(-1)
    }
    
    var tree = Array(repeating: [Int](), count: a.count)
    for edge in edges {
        tree[edge[0]].append(edge[1])
        tree[edge[1]].append(edge[0])
    }
    
    func dfs(_ current: Int, _ parent: Int) {
        // 최대한 깊이 들어가고, 되돌아가면서 업데이트
        for child in tree[current] {
            if child != parent {
                dfs(child, current)
            }
        }
        
        a[parent] += a[current]
        answer += abs(a[current])
    }
    
    dfs(0, 0)
    
    return Int64(answer)
}