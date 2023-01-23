import Foundation

let n = Int(readLine()!)!
var arr = Set<String>()

for _ in 0..<n {
    arr.insert(readLine()!)
}

print(arr.sorted {$0.count < $1.count || $0.count == $1.count && $0 < $1 }.joined(separator: "\n"))