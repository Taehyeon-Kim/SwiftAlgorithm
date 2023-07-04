import Foundation

var q = Deque<Int>()

q.pushFirst(1)
q.pushLast(2)
q.pushFirst(3)
q.pushLast(4)

// expectation
// 3 1 2 4

print(q)

q.popLast()
q.popFirst()

print(q)

q.popLast()
q.popLast()

print(q)

q.popLast()
q.pushFirst(5)
q.pushFirst(6)
q.pushFirst(7)
q.pushFirst(8)

print(q)
