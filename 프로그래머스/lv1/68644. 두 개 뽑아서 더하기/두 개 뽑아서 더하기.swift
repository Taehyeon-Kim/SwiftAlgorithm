import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var sets = Set<Int>()
    for i in numbers.indices {
        for j in numbers.indices {
            if i == j { continue }
            else { sets.insert(numbers[i] + numbers[j]) }
        }
    }
    return sets.sorted()
}