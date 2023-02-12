import Foundation

func solution(_ numbers:[Int]) -> Int {
    var ret = -Int.max
    for i in 0..<numbers.count {
        for j in 0..<numbers.count {
            if i == j { continue }
            ret = max(ret, numbers[i] * numbers[j])
        }
    }
    return ret
}