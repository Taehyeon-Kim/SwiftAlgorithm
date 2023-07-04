import Foundation

public func example(of description: String, _ action: () -> Void) {
  print("===== Example of \(description) =====")
  action()
}
