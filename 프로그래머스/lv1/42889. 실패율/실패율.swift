import Foundation

/*
N + 1 => clear
1    2    3    4    5
1/8  3/7  2/4  1/2  0/1
*/

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var rate = [(Int, Double)]()
    var failure: [Int: Int] = [:]
    
    // Failure
    for val in stages {
        failure[val, default: 0] += 1
    }

    // Calculate
    var arrived = stages.count
    for i in 1...N {
        let notClear = failure[i, default: 0]

        if arrived == 0 { rate.append((i, 0)) }
        else { rate.append((i, Double(notClear) / Double(arrived)))}
        
        arrived -= notClear
    }
    
    // Sort
    return rate.sorted { lhs, rhs in
        if lhs.1 == rhs.1 {
            return lhs.0 < rhs.0
        }
        return lhs.1 > rhs.1
    }.map { $0.0 }
}