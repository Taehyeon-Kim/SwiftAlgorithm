import Foundation

struct Heap<T: Comparable> {
    var nodes = [T]()
    let comparer: (T, T) -> Bool
    
    init(comparer: @escaping (T, T) -> Bool) {
        self.comparer = comparer
    }
    
    mutating func push(_ element: T) {
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
    
    mutating func pop() -> T? {
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

struct Edge: Comparable {
  static func < (lhs: Edge, rhs: Edge) -> Bool {
    return lhs.cost < rhs.cost
  }

  let cost: Int
  let node: Int
}

func input() -> (Int, Int, Int, [[(Int, Int)]]) {
    let ve = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
    let (v, e) = (ve[0], ve[1])
    let start = Int(readLine()!)!
    
    var graph = Array(repeating: [(Int,Int)](), count: v+1)
    for _ in 0..<e {
        let line = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
        let (from, to, cost) = (line[0], line[1], line[2])
        graph[from].append((to, cost))
    }
    
    return (v, e, start, graph)
}

func dijkstra(n: Int, graph: [[(Int,Int)]], start: Int) -> [Int] {    
    var dist = Array(repeating: Int.max, count: n+1)
    dist[start] = 0

    var pq = Heap<Edge>()
    pq.push(Edge(cost: 0, node: start))
    
    while let cur = pq.pop() {
        let (cost, node) = (cur.cost, cur.node)
        if dist[node] < cost { continue }
        
        for (nextNode, nextCost) in graph[node] {
            let nextDist = cost + nextCost
            
            if nextDist < dist[nextNode] {
                dist[nextNode] = nextDist
                pq.push(Edge(cost: nextDist, node: nextNode))
            }
        }
    }
    
    return dist
}

func solution() {
  let (v, _, start, graph) = input()
  let dists = dijkstra(n: v, graph: graph, start: start)
  for i in 1..<dists.count {
    dists[i] == Int.max ? print("INF") : print(dists[i])
  }
}

solution()