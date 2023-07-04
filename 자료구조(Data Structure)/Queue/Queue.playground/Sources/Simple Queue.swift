import Foundation

// Array로 Queue 구현
public struct Queue<T> {
  private var array: [T] = []
  
  // 비어있는지 검사
  public var isEmpty: Bool {
    return array.isEmpty
  }
  
  // 개수
  public var count: Int {
    return array.count
  }
  
  // enqueue
  // 배열의 마지막에 원소를 추가하는 것이기 때문에 O(1)
  public mutating func enqueue(_ element: T) {
    array.append(element)
  }
  
  // dequeue
  public mutating func dequeue() -> T? {
    if isEmpty {
      return nil
    } else {
      return array.removeFirst()
    }
  }
  
  // 맨 앞 원소
  public var front: T? {
    return array.first
  }
}
