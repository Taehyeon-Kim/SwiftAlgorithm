import Foundation

func solution(_ n:Int) -> Int {
    let num = String(n, radix: 3).map { Int(String($0))! }
    return num.enumerated().map { index, num in
        return Int(pow(3, Double(index))) * num
    }.reduce(0, +)
}