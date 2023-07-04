import Foundation

public enum EdgeType {
  case directed   // 방향
  case undirected // 무방향
}

public protocol Graph {
  associatedtype Element // 노드
  
  func createVertex(data: Element) -> Vertex<Element> // 정점 생성
  func addDirectedEdge(from source: Vertex<Element>, to dest: Vertex<Element>, weight: Double?)
  func addUndirectedEdge(between source: Vertex<Element>, and dest: Vertex<Element>, weight: Double?)
  func add(_ edge: EdgeType, from source: Vertex<Element>, to dest: Vertex<Element>, weight: Double?)
  func edges(from source: Vertex<Element>) -> [Edge<Element>]
  func weight(from source: Vertex<Element>, to dest: Vertex<Element>) -> Double?
}

public struct Vertex<T> {
  public let index: Int
  public let data: T
}

extension Vertex: Hashable where T: Hashable {}
extension Vertex: Equatable where T: Equatable {}

extension Vertex: CustomStringConvertible {
  
  public var description: String {
    "\(index): \(data)"
  }
}

public struct Edge<T> {
  public let source: Vertex<T>
  public let destination: Vertex<T>
  public let weight: Double?
}
