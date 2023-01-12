import Foundation

// Deque(Double-ended queue)
// 덱의 경우 Storage의 앞 뒤에서 원소를 삽입하거나 삭제할 수 있는 특징을 가진다.

public struct Deque<T> {
  // Array를 2개 사용한다. Stack을 2개 사용하는 느낌이다.
  private var enQueue = [T]()
  private var deQueue = [T]()
  
  public var isEmpty: Bool {
    return enQueue.isEmpty && deQueue.isEmpty
  }
  
  public var first: T? {
    if deQueue.isEmpty {
      return enQueue.first
    }
    return deQueue.last
  }
  
  public init() {}
  
  // dequeue 쪽으로 추가
  public mutating func pushFirst(_ element: T) {
    deQueue.append(element)
  }
  
  // enqueue 쪽으로 추가
  public mutating func pushLast(_ element: T) {
    enQueue.append(element)
  }
  
  public mutating func popFirst() -> T? {
    if deQueue.isEmpty {
      deQueue = enQueue.reversed()
      enQueue.removeAll()
    }
    return deQueue.popLast()
  }
  
  public mutating func popLast() -> T? {
    if enQueue.isEmpty {
      deQueue.reverse()
      defer { deQueue.reverse() }
      return deQueue.popLast()
    } else {
      return enQueue.popLast()
    }
  }
  
  public mutating func removeAll() {
    enQueue.removeAll()
    deQueue.removeAll()
  }
}

extension Deque: CustomStringConvertible {
  
  public var description: String {
    let arr = deQueue.reversed() + enQueue
    return "Deque: \(arr)"
  }
}
