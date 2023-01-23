// 제곱 S, D, T
// *(2배) : 중첩가능
// #(마이너스) : *와 중첩 시 -2배

// 각 기호에 따른 점수를 정확하게 계산할 수 있는가
// S : 1제곱
// D : 2제곱
// T : 3제곱
// * : 이전 점수 o - 이전 점수, 현재 점수 각각 2배 / 이전 점수 x - 현재 점수만 2배

// # : -1, * : x2
// **: 중첩 가능 ex. ** - 4배
// *#: 중첩 가능 ex. ** - -2배

// 3번의 기회 -> 3개씩 끊으면 될 것 같음 -> |점수|보너스|[옵션]
// 점수 : 0 ~ 10
// 보너스 : S, D, T
// 옵션 : *, # 중 하나 or 없음

// split이 관건 - 어떻게 끊을까?
// 다음 숫자가 나오기전까지 끊어야 하나

// 다음 숫자 나오면 계산 후, 초기화

import Foundation

@frozen
enum Bonus: String {
    case single = "S"
    case double = "D"
    case triple = "T"
    
    var powValue: Double {
        switch self {
        case .single: return 1.0
        case .double: return 2.0
        case .triple: return 3.0
        }
    }
}

func cal(_ score: Int, _ bonus: String) -> Int {
    let bonus = Bonus(rawValue: bonus)!
    var score: Int {
        return Int(pow(Double(score), bonus.powValue))
    }
    return score
}

func totalScore(_ scores: [Int], _ optionQueue: [Int]) -> Int {
    var options = optionQueue
    
    for (i, op) in optionQueue.enumerated() {
        if i != 0 && op == 2 {
            options[i-1] *= 2
        }
    }
    
    return zip(scores, options).map { $0 * $1 }.reduce(0, +)
}

func solution(_ dartResult:String) -> Int {
    var scoreQueue: [Int] = []
    var bonusQueue: [String] = []
    var optionQueue: [Int] = [1, 1, 1]
    
    var score = ""
    var count = -1
    
    for (i, c) in dartResult.enumerated() {
        if c == "S" || c == "D" || c == "T" {
            bonusQueue.append(String(c))
            scoreQueue.append(Int(score)!)
            score = ""
            count += 1
        }
        
        else if c == "*" {
            optionQueue[count] = 2
        }
        
        else if c == "#" {
            optionQueue[count] = -1
        }
        
        else {
            score += String(c)
        }
    }
    
    var scores: [Int] = []
    for (s, b) in zip(scoreQueue, bonusQueue) {
        scores.append(cal(s, b))
    }
    return totalScore(scores, optionQueue)
}