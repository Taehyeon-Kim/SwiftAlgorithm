import Foundation

// 1. 조합
// - numsC3
// 2. 소수 판별

// func isPrime(_ num: Int) -> Bool {
//     for i in 2..<num {
//         if num % i == 0 { return false }
//     }
//     return true
// }

func combi(_ target: [Int], _ count: Int) -> [[Int]] {
    var results = [[Int]]()
    if target.count < count { return results }
    
    func recursion(_ index: Int, _ result: [Int]) {
        if result.count == count {
            results.append(result)
            return
        }
        
        for i in index..<count {
            recursion(i + 1, result + [target[i]])
        }
    }
    
    recursion(0, [])
    return results
}

func combination<T: Comparable>(_ array: [T], _ n: Int) -> [[T]] {
    var result = [[T]]()
    if array.count < n { return result }

    func cycle(_ index: Int, _ now: [T]) {
        if now.count == n {
            result.append(now)
            return
        }

        for i in index..<array.count {
            cycle(i + 1, now + [array[i]])
        }
    }

    cycle(0,[])

    return result
}

func solution(_ nums:[Int]) -> Int {
    let answer = 0
    // var combinations: [[Int]] = []

    // print(combi([1,2,3,4], 3, 0, []))
    print(combi([1,2,3,4], 3))

    return answer
}