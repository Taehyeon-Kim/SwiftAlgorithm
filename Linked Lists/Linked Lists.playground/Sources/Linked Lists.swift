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
    head = Node(value, next: head)
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
    tail!.next = Node(value)
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
    
    node.next = Node(value, next: node.next)
    return node.next!
  }
  
  @discardableResult
  public mutating func pop() -> Value? {
    // 2. head pointer는 나중에 미룬다는 느낌
    defer {
      head = head?.next!
      if isEmpty {
        tail = nil
      }
    }
    
    // 1. 먼저 return 하고
    return head?.value
  }
  
  // 처음에는 단순하게 tail node 값을 return 하면 된다고 생각했는데
  // 참조가 순차적으로 이어져 있기 때문에
  // tail node에 대한 참조가 있다고 하더라도 그 앞에 있는 노드에 대한 참조 없이는 잘라낼 수 없다.
  // 탐색을 순차적으로 계속 해주어야 한다.
  public mutating func removeLast() -> Value? {
    // 1. head가 없다면 remove할 대상이 없기 때문에 nil 반환
    guard let head else {
      return nil
    }
    
    // 2. 하나의 노드만 있는 상황이라면, pop과 동일한 상황이다. (앞에서 빼내는)
    // pop() 메서드는 head, tail을 업데이트 해준다.
    guard head.next != nil else {
      return pop()
    }
    
    // 3. head, tail update
    // current가 마지막 노드를 가리킬 때까지 반복
    var prev = head
    var current = head
    
    while let next = current.next {
      prev = current
      current = next
    }
    
    // 4. 마지막 노드 바로 앞 노드를 tail이 가리키도록 설정
    prev.next = nil
    tail = prev
    return current.value
  }
  
  // 특정 노드 뒤에 있는 노드를 제거하고, 참조를 제거하는 것은 간단함
  // 1. node.next?.value 반환
  // 2. 참조를 다다음 노드로 연결해주기(다음 노드가 tail인 경우에만 tail로 바꿔주기)
  @discardableResult
  public mutating func remove(after node: Node<Value>) -> Value? {
    defer {
      if node.next === tail {
        tail = node
      }
      node.next = node.next?.next
    }
    return node.next?.value
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
