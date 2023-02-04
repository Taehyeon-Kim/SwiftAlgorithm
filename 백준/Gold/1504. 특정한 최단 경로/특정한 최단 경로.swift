import Foundation

public struct Heap<T: Comparable> {
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

    public mutating func push(_ element: T) {
        nodes.append(element)
        moveUp(from: nodes.endIndex - 1)
    }

    public mutating func moveUp(from index: Int) {
        var index = index
        while index > 0 && compareFunction(nodes[index], nodes[(index-1)/2]) {
            nodes.swapAt(index, (index-1)/2)
            index = (index-1)/2
        }
    }

    public mutating func pop() -> T? {
        if nodes.isEmpty { return nil }
        nodes.swapAt(0, nodes.endIndex - 1)
        let popped = nodes.removeLast()
        moveDown(from: 0)
        return popped
    }
    
    public mutating func moveDown(from index: Int) {
        var cIndex = index
        let left = index * 2 + 1
        let right = left + 1

        if left < nodes.endIndex && compareFunction(nodes[left], nodes[cIndex]) {
            cIndex = left
        }
        
        if right < nodes.endIndex && compareFunction(nodes[right], nodes[cIndex]) {
            cIndex = right
        }

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
    init() {
        self.init(compareFunction: <)
    }
}
struct Edges: Comparable {
    static func < (lhs: Edges, rhs: Edges) -> Bool {
        return lhs.cost < rhs.cost
    }
    let cost: Int
    let node: Int
}

func input() -> (n: Int, e: Int, graph: [[(Int, Int)]], v1: Int, v2: Int) {
  let info = readLine()!.split(separator: " ").map { Int($0)! }
  let (n, e) = (info[0], info[1])

  var graph = Array(repeating: [(Int,Int)](), count: n+1)
  for _ in 0..<e {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let (from, to, cost) = (line[0], line[1], line[2])
    graph[from].append((to, cost))
    graph[to].append((from, cost))
  }
  
  let vertex = readLine()!.split(separator: " ").map { Int($0)! }
  let (v1, v2) = (vertex[0], vertex[1])

  return (n, e, graph, v1, v2)
}

func dijkstra(_ n: Int, _ graph: [[(Int, Int)]], _ start: Int) -> [Int] {
    var distance = Array(repeating: 999999999, count: n+1)
    distance[start] = 0

    var pq = Heap<Edges>()
    pq.push(Edges(cost: 0, node: start))
    
    
    while let current = pq.pop() {
        let (curNode, curDist) = (current.node, current.cost)
        
        if distance[curNode] < curDist {
            continue
        }
        
        for (nxNode, nxCost) in graph[curNode] {
            let nextDistance = curDist + nxCost
            
            if nextDistance < distance[nxNode] {
                distance[nxNode] = nextDistance
                pq.push(Edges(cost: nextDistance, node: nxNode))
            }
        }
    }
    return distance
}

func solution() {
  let (n, _, graph, v1, v2) = input()
  let dist1 = dijkstra(n, graph, 1)
  let dist2 = dijkstra(n, graph, v1)
  let dist3 = dijkstra(n, graph, v2)

  let first = dist1[v1] + dist2[v2] + dist3[n]
  let second = dist1[v2] + dist3[v1] + dist2[n]

  let answer = min(first, second)
  print(answer >= 999999999 ? -1 : answer)
}

solution()