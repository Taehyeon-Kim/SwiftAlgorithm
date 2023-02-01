import Foundation

func solution(_ citations:[Int]) -> Int {
    for (i, cit) in citations.sorted(by: >).enumerated() {
        if i >= cit {
            return i
        }
    }
    return citations.count
}