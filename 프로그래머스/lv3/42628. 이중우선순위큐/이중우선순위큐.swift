import Foundation

func solution(_ operations:[String]) -> [Int] {
    var arr = [Int]()

    operations.forEach {
        defer { arr.sort(by: >) }
        
        let op = $0.split(separator: " ")
        let cmd = op.first!
        let value = op.last!
        
        if cmd == "I" {
            arr.append(Int(value)!)
        }
        
        if cmd == "D" {
            if arr.isEmpty { return }
            if value == "1" { arr.removeFirst() }
            if value == "-1" { arr.removeLast() }
        }
    }    
    
    return arr.isEmpty ? [0,0] : [arr.max()!, arr.min()!]
}