import Foundation

struct Heap<T: Comparable> {
    private var nodes: [T] = []
    private let sort: (T,T) -> Bool
    
    init(sort: @escaping (T,T) -> Bool) {
        self.sort = sort
    }
    
    var isEmpty: Bool {
        return nodes.isEmpty
    }
    
    mutating func insert(_ element: T) {
        var index = nodes.count
        nodes.append(element)
        
        while index > 0 , sort(nodes[index], nodes[(index-1)/2]) {
            nodes.swapAt(index, (index-1)/2)
            index = (index-1)/2
        }
    }
    
    mutating func delete() -> T {
        if nodes.count == 1 {
            return nodes.removeLast()
        }
        
        let result = nodes.first!
        nodes.swapAt(0, nodes.count - 1)
        _ = nodes.popLast()
        
        var index = 0
        
        while index < nodes.count {
            let leftChild = index * 2 + 1
            let rightChild = leftChild + 1
            
            let children = [leftChild, rightChild]
                .filter{$0 < nodes.count && sort(nodes[$0], nodes[index])}
                .sorted{sort(nodes[$0], nodes[$1])}
            
            if children.isEmpty {
                break
            }
            
            nodes.swapAt(index, children[0])
            index = children[0]
        }
        
        return result
    }
}
struct EdgeData: Comparable {
    static func < (lhs: EdgeData, rhs: EdgeData) -> Bool {
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

    var pq = Heap<EdgeData>(sort: <)
    pq.insert(EdgeData(cost: 0, node: start))
    
    
    while !pq.isEmpty {
        let current = pq.delete()
        let (curNode, curDist) = (current.node, current.cost)
        
        if distance[curNode] < curDist {
            continue
        }
        
        for (nxNode, nxCost) in graph[curNode] {
            let nextDistance = curDist + nxCost
            
            if nextDistance < distance[nxNode] {
                distance[nxNode] = nextDistance
                pq.insert(EdgeData(cost: nextDistance, node: nxNode))
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