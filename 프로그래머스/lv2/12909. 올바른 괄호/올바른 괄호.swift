import Foundation

func solution(_ s: String) -> Bool {

    var stack = [Character]()
    
    for ch in s {
        if stack.isEmpty {
            stack.append(ch)
        }
        
        else if ch == "(" {
            stack.append(ch)
        }
        
        else if ch == ")" {
            let last = stack.last!
            if last == "(" { stack.removeLast() }
            else { stack.append(ch) }
        }
    }

    return stack.isEmpty
}