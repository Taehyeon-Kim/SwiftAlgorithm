import Foundation

// 1. 조합
// - numsC3
// 2. 소수 판별

func isPrime(_ num: Int) -> Bool {
    for i in 2..<num {
        if num % i == 0 { return false }
    }
    return true
}

func combinations(_ target: [Int], _ count: Int) -> [[Int]] {
    var results = [[Int]]()
    
    func recursion(_ array: [Int], _ index: Int) {
        if array.count == count {
            results.append(array)
            return
        }
        
        for i in index..<target.count {
            recursion(array + [target[i]], i + 1)
        }
    }
    
    recursion([], 0)
    return results
}

func solution(_ nums:[Int]) -> Int {
    return combinations(nums, 3).map { $0.reduce(0, +) }.filter { isPrime($0) }.count
}