import UIKit

example(of: "Stack") {
  var stack = Stack<Int>()
  stack.push(1)
  stack.push(2)
  stack.push(3)
  stack.push(4)
  print(stack)
  
  if let poppedValue = stack.pop() {
    print("Popped \(poppedValue)")
  }
}

example(of: "Init stack with array literal") {
  var stack: Stack = [1.0, 2.0, 3.0, 4.0]
  print(stack)
}

// MARK: - Reverse
func printInReverse<T>(_ array: [T]) {
  var stack = Stack(array)
  
  /// while let
  while let value = stack.pop() {
    print(value)
  }
}

// MARK: - 괄호 체크
func checkParentheses(_ string: String) -> Bool {
  var stack = Stack<Character>()
  
  for character in string {
    if character == "(" {
      stack.push(character)
    } else if character == ")" {
      if stack.isEmpty {
        return false
      } else {
        stack.pop()
      }
    }
  }
  return stack.isEmpty
}
