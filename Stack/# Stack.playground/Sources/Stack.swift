import Foundation

public struct Stack<T> {
  
  // MARK: Items(Array)
  
  private var items: [T] = []
  
  // MARK: Initializer
  
  public init() {}
  
  public init(_ array: [T]) {
    items = array
  }
  
  // MARK: Operation
  
  /// push
  public mutating func push(_ element: T) {
    items.append(element)
  }
  
  /// pop
  @discardableResult
  public mutating func pop() -> T? {
    return items.popLast()
  }
  
  /// peek
  public func peek() -> T? {
    return items.last
  }
  
  /// isEmpty
  public var isEmpty: Bool {
    return peek() == nil
  }
}

extension Stack: CustomDebugStringConvertible {
  public var debugDescription: String {
    """
    --- top ---
    \(items.map { "\($0)" }.reversed().joined(separator: "\n"))
    --- --- ---
    """
  }
}

extension Stack: ExpressibleByArrayLiteral {
  /// init with array literal
  public init(arrayLiteral elements: T...) {
    items = elements
  }
}
