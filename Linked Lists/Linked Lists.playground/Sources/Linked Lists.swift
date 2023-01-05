import Foundation

public struct LinkedList<Value> {
  // head, tail -> list의 first, last node를 가리킴
  public var head: Node<Value>?
  public var tail: Node<Value>?
  
  public init() {}
  
  public var isEmpty: Bool {
    head == nil
  }
  
  // push - head firstly insertion
  public mutating func push(_ value: Value) {
    head = Node(value: value, next: head)
    if tail == nil {
      tail = head
    }
  }
  
  // append - tail end insertion
  public mutating func append(_ value: Value) {
    guard !isEmpty else {
      push(value) // head, tail
      return
    }
    
    // Force unwrapping 반드시 성공함을 보장 (최초 tail에 값을 넣어줬기 때문)
    tail!.next = Node(value: value)
    tail = tail!.next
  }
  
  // insert(after:node)
  // 1. find node
  // 2. insert node
  
  /// 1. find node
  public func node(at index: Int) -> Node<Value>? {
    var currentNode = head
    var currentIndex = 0
    
    while currentNode != nil && currentIndex < index {
      currentNode = currentNode!.next
      currentIndex += 1
    }
    
    return currentNode
  }
  
  @discardableResult
  public mutating func insert(_ value: Value, after node: Node<Value>) -> Node<Value> {
    
    /// 참조 비교 연산자 사용
    /// 동일한 객체 인스턴스를 참조하는지 확인, insert하려는 노드가 마지막 노드(tail)인지 확인
    guard tail !== node else {
      append(value)
      return tail!
    }
    
    node.next = Node(value, after: node.next)
    return node.next!
  }
  
  @discardableResult
  public mutating func pop() -> Value? {
    // 2. head pointer는 나중에 미룬다는 느낌
    defer {
      head = head.next!
      if isEmpty {
        tail = nil
      }
    }
    
    // 1. 먼저 return 하고
    return head?.value
  }
}

extension LinkedList: CustomStringConvertible {
  
  public var description: String {
    guard let head else {
      return "Empty list"
    }
    
    return String(describing: head)
  }
}
