import Foundation

func solution(_ number:String, _ k:Int) -> String {
    
    var stack = [Int]()
    var k = k
    var number = number.map { Int(String($0))! }
    
    for n in number {
        while !stack.isEmpty && stack.last! < n && k > 0 {
            _ = stack.popLast()
            k -= 1
        }
        stack.append(n)
    }

    if k > 0 {
        while k != 0 {
            _ = stack.popLast()
            k -= 1
        }   
    }
    
    return stack.map { String($0) }.joined()
}