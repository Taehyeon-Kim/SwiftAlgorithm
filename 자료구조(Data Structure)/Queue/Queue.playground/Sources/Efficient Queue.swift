import Foundation

public struct EfficientQueue<T> {
  
  // 배열 요소를 비어 있는 것으로 표시해야 하기 때문에 옵셔널 타입의 요소를 저장
  public var array = [T?]()
  // 배열의 맨 앞에 있는 요소의 인덱스
  public var head = 0
  
  public init() {}
  
  public var isEmpty: Bool {
    return count == 0
  }

  public var count: Int {
    return array.count - head
  }
  
  public mutating func enqueue(_ element: T) {
    array.append(element)
  }
  
  public mutating func dequeue() -> T? {
    guard head < array.count, let element = array[head] else { return nil }

    array[head] = nil
    head += 1

    // 사용하지 않는 공간
    let percentage = Double(head)/Double(array.count)
    
    // Array의 25% 이상이 사용되지 않으면 낭비되는 공간 제거
    if array.count > 50 && percentage > 0.25 {
      // removeFirst: 컬렉션의 시작 부분에서 지정된 수의 요소를 제거
      array.removeFirst(head)
      head = 0
    }
    
    return element
  }
  
  public var front: T? {
    if isEmpty {
      return nil
    } else {
      return array[head]
    }
  }
}
