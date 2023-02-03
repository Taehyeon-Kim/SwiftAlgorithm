import Foundation

func makeGraph(_ N:Int, _ road:[[Int]]) -> [[Int]] {
    var graph: [[Int]] = [[Int]](repeating: [Int](repeating: INF, count: N), count: N)
    
    for i in 0..<N {
        graph[i][i] = 0
    }
    
    for info in road {
        let v1 = info[0] - 1, v2 = info[1] - 1, cost = info[2]
        graph[v1][v2] = min(graph[v1][v2], cost)
        graph[v2][v1] = min(graph[v2][v1], cost)
    }
    
    return graph
}

func debug(_ graph: [[Int]]) {
    for i in graph.indices {
        for j in graph.indices {
            print(graph[i][j], terminator: " ")
        }
        print()
    }
}

struct Heap {
    var nodes = [Int]()
    let comparer: (Int, Int) -> Bool
    
    init(comparer: @escaping (Int, Int) -> Bool) {
        self.comparer = comparer
    }
    
    mutating func push(_ element: Int) {
        nodes.append(element)
        
        var index = nodes.endIndex - 1
        while index != 0 && comparer(nodes[index], nodes[(index-1)/2]) {
            nodes.swapAt(index, (index-1)/2)
            index = (index-1)/2
        }
    }
    
    mutating func moveDown(from index: Int) {
        var cIndex = index
        let left = index * 2 + 1
        let right = left + 1
        
        if left < nodes.endIndex && comparer(nodes[left], nodes[cIndex]) {
            cIndex = left
        }
        
        if right < nodes.endIndex && comparer(nodes[right], nodes[cIndex]) {
            cIndex = right
        }
        
        if cIndex != index {
            nodes.swapAt(cIndex, index)
            moveDown(from: cIndex)
        }
    }
    
    mutating func pop() -> Int? {
        if nodes.isEmpty { return nil }
        nodes.swapAt(0, nodes.endIndex - 1)
        let popped = nodes.removeLast()
        moveDown(from: 0)
        return popped
    }
}

extension Heap {
    init() {
        self.init(comparer: <)
    }
}

let INF = Int.max

func solution(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {
    let graph = makeGraph(N, road)    
    var pq = Heap()
    var dist = [Int](repeating: INF, count: N)
    
    dist[0] = 0
    pq.push(0)
    
    while let cur = pq.pop() {
        for dest in graph[cur].indices {
            if graph[cur][dest] == INF || graph[cur][dest] == 0 { continue }
            
            let curViaDest = dist[cur] + graph[cur][dest]
            if curViaDest < dist[dest] {
                dist[dest] = curViaDest
                pq.push(dest)
            }
        }
    }

    return dist.filter { $0 <= k }.count
}