import Foundation

public struct LinkedList<Value> {
  // head, tail -> list의 first, last node를 가리킴
  public var head: Node<Value>?
  public var tail: Node<Value>?
  
  public init() {}
  
  public var isEmpty: Bool {
    head == nil
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
