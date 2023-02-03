import Foundation

public struct Heap<T> {
    
    // nodes
    public var nodes: [T] = []
    public let compareFunction: (T,T) -> Bool

    var isEmpty: Bool {
        return nodes.isEmpty
    }
    
    var top: T? {
        return isEmpty ? nil : nodes.first!
    }
  
    public init(
        _ elements: [T] = [],
        compareFunction: @escaping (T,T) -> Bool
    ) {
        self.nodes = elements
        self.compareFunction = compareFunction
        
        if !nodes.isEmpty {
            heapify()
        }
    }
    
    // 가장 마지막에 추가만 해주면 됨
    public mutating func push(_ element: T) {
        nodes.append(element)
        moveUp(from: nodes.endIndex - 1)
    }
    
    // 기능을 분리한 이유는 나중에 heapify에서도 사용해야하기 때문
    public mutating func moveUp(from index: Int) {
        var index = index
        
        // compare의 기준은 현재 바라보는 노드가 되어야 함
        while index > 0 && compareFunction(nodes[index], nodes[(index-1)/2]) {
            nodes.swapAt(index, (index-1)/2)
            index = (index-1)/2
        }
    }
    
    // - 루트 노드와 마지막 노드 교체
    // - 루트 노드 제거
    // - moveDown 반복
    public mutating func pop() -> T? {
        if nodes.isEmpty { return nil }
        
        // 1)
        nodes.swapAt(0, nodes.endIndex - 1)
        
        // 2)
        let popped = nodes.removeLast()
        
        // 3)
        moveDown(from: 0)
        
        return popped
    }
    
    public mutating func moveDown(from index: Int) {
        var cIndex = index   // 시작 인덱스
        
        let left = index * 2 + 1
        let right = left + 1
        
        // moveDown을 할 때에는 항상 마지막 인덱스보다 작은지 체크, bounds 체크
        
        if left < nodes.endIndex && compareFunction(nodes[left], nodes[cIndex]) {
            cIndex = left
        }
        
        if right < nodes.endIndex && compareFunction(nodes[right], nodes[cIndex]) {
            cIndex = right
        }
        
        // 재귀
        if cIndex != index {
            nodes.swapAt(cIndex, index)
            moveDown(from: cIndex)
        }
    }
    
    public mutating func heapify() {
        for index in (0...(nodes.count-1)/2).reversed() {
            moveDown(from: index)
        }
    }
}

extension Heap where T: Comparable {
    // 기본 최대 힙(Max heap)
    init() {
        self.init(compareFunction: <)
    }

    // static func < (lhs: T, rhs: T) -> Bool {
    //   return lhs.1 > rhs.1
    // }
}

func input() -> (Int, Int, [[(Int,Int)]], Int, Int){
    let n = Int(readLine()!)!
    let m = Int(readLine()!)!

    var graph: [[(Int,Int)]] = Array(repeating: [], count: n+1)
    for _ in 0..<m {
        let line = readLine()!.split(separator: " ").map { Int($0)! }
        let (from, to, cost) = (line[0], line[1], line[2])
        graph[from].append((to,cost))
    }

    let startEnd = readLine()!.split(separator: " ").map { Int($0)! }
    let (start,end) = (startEnd[0], startEnd[1])
    return (n, m, graph, start, end)
}

func dijkstra(n: Int, graph: [[(Int,Int)]], start: Int) -> [Int] {
    var distances: [Int] = Array(repeating: Int.max, count: n+1)
    distances[start] = 0
    var heap = Heap([(start, 0)], compareFunction: <)

    while !heap.isEmpty {
        let first = heap.pop()!
        let (node, cost) = (first.0, first.1)

        if cost > distances[node] { continue }

        for (nextNode, nextCost) in graph[node] {
            if nextCost + cost < distances[nextNode] {
                distances[nextNode] = nextCost + cost
                heap.push((nextNode, distances[nextNode]))
            }
        }
    }

    return distances
}

func solution() {
    let (n, _, graph, start, end) = input()
    let distances = dijkstra(n: n, graph: graph, start: start)
    print(distances[end])
}

solution()