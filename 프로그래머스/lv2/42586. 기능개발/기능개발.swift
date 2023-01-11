// 23/1/11 14:46
// Queue 느낌이 강하다.
// while문도 돌려야 할 것 같다.

import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var answer = [Int]()
    
    var rests = progresses.map { 100 - $0 }
    var days = zip(rests, speeds).map { ceil(Double($0.0) / Double($0.1)) }
    
    while !days.isEmpty {
        let first = days.first!
        var count = 0
        
        for day in days {
            if day > first { break }
            if day <= first {
                days.removeFirst()
                count += 1
            }
        }
        
        answer.append(count)
    }

    return answer
}

