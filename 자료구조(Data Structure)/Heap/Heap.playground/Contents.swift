var heap = Heap<Int>()  // 기본 최대힙

heap.push(30)
heap.push(50)
heap.push(20)
heap.push(7)
heap.push(8)

print(heap) // [50, 30, 20, 7, 8]

var heap2 = Heap<Int>(compareFunction: <)   // 최소힙

heap2.push(30)
heap2.push(50)
heap2.push(20)
heap2.push(7)
heap2.push(8)

print(heap2)    // [7, 8, 30, 50, 20]

let array = [30, 50, 20, 7, 8]
var heap3 = Heap<Int>(array, compareFunction: >)
print(heap3)    // [50, 30, 20, 7, 8]

_ = heap3.pop() // 50
_ = heap3.pop() // 30
_ = heap3.pop() // 20
_ = heap3.pop() // 8
_ = heap3.pop() // 7
_ = heap3.pop() // nil
