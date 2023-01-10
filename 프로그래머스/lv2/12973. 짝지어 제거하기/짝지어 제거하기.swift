import Foundation

func solution(_ s:String) -> Int{    
    var arr: [String] = []
    
    for char in Array(s).map { String($0) } {
        if arr.isEmpty { arr.append(char) }
        else {
            if arr.last! == char {
                arr.popLast()
            } else {
                arr.append(char)
            }
        }
    }
    
    return arr.isEmpty ? 1 : 0
}