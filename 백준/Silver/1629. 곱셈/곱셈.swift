import Foundation
let line = readLine()!.components(separatedBy: " ").map { Int($0)! }
let a = line[0], b = line[1], c = line[2]

func pow(_ a: Int, _ b: Int, _ c: Int) -> Int {
    if b == 1 { return a % c }
    
    var val = pow(a, b/2, c)
    val = val * val % c
    if b % 2 == 0 { return val }
    return a * val % c
}

print(pow(a, b, c))