import Foundation

/*
18m
*/

func solution(_ survey:[String], _ choices:[Int]) -> String {
    var dict: [String: Int] = [:]
    let score: [Int: Int] = [1: 3, 2: 2, 3: 1, 4: 0, 5: 1, 6: 2, 7: 3]
    
    // 반복한다. 
    // 3번 이하이면 첫번째 원소의 점수를 +
    // 5번 이상이면 두번째 원소의 점수를 +
    for (s, c) in zip(survey, choices) {
        let s = s.map { String($0) }
        if c <= 3 {
            dict[s[0], default: 0] += score[c, default: 0]
        } else if c >= 5 {
            dict[s[1], default: 0] += score[c, default: 0]
        }
    }
    
    var answer = ""
    let table = [["R", "T"], ["C", "F"], ["J", "M"], ["A", "N"]]
    for t in table {
        answer += dict[t[0], default: 0] >= dict[t[1], default: 0] ? t[0] : t[1]
    }
    return answer
}