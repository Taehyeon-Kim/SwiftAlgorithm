import Foundation

func solution(_ gems:[String]) -> [Int] {
    let sets = Set(gems)
    var dict: [String: [Int]] = [gems.first!: [0]]
    var answer = [Int]()
    var s = 0, e = 0
    
    while true {
        if sets.count == dict.count {
            if answer.isEmpty { 
                answer = [s+1, e+1] 
            } else {
                answer = answer[1] - answer[0]  > e - s ? [s+1, e+1] : answer
            }
            
            dict[gems[s]]!.removeFirst()
            if dict[gems[s]]!.isEmpty {
                dict[gems[s]] = nil
            }
            
            s += 1
        } else {
            e += 1
            if e == gems.count { return answer }
            
            if dict[gems[e]] == nil {
                dict[gems[e]] = [e]
            } else {
                dict[gems[e]]!.append(e)
            }
        }
    }
}