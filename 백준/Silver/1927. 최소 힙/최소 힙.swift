struct Heap {
    var nodes: [Int] = []
    let comparer: (Int, Int) -> Bool
    var isEmpty: Bool { return nodes.isEmpty }
    
    init(comparer: @escaping (Int, Int) -> Bool) {
        self.comparer = comparer
    }
    
    mutating func push(_ element: Int) {
        nodes.append(element)
        var index = nodes.endIndex - 1
        
        while index > 0 && comparer(nodes[index], nodes[(index-1)/2]) {
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
        if isEmpty { return 0 }
        
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

let n = Int(readLine()!)!
var heap = Heap()

for _ in 0..<n {
    let num = Int(readLine()!)!
    if num == 0 {
        print(heap.pop()!)
    } else {
        heap.push(num)
    }
}