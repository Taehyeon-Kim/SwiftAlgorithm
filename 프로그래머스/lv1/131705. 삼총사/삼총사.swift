import Foundation

func combination(_ target: [Int], _ n: Int) -> [[Int]] {
    var ret = [[Int]]()
    if target.count < n { return ret }
    
    func recur(_ arr: [Int], _ idx: Int) {
        if arr.count == n { ret.append(arr); return }
        
        for i in idx..<target.count {
            recur(arr + [target[i]], i+1)
        }
    }
    
    recur([], 0)
    return ret
}

func solution(_ number:[Int]) -> Int {
    return combination(number, 3).filter { $0.reduce(0,+) == 0 }.count
}