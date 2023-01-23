import Foundation

// 보너스 계산 위한 열거형
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

// 계산 기능
func cal(_ score: Int, _ bonus: String) -> Int {
    let bonus = Bonus(rawValue: bonus)!
    var score: Int {
        return Int(pow(Double(score), bonus.powValue))
    }
    return score
}

func solution(_ dartResult:String) -> Int {
    // 숫자 배열
    let numbers = dartResult
    .components(separatedBy: ["*", "#"])
    .joined()
    .components(separatedBy: ["S", "D", "T"])
    .filter { $0 != "" }
    .map { Int($0)! }
    
    // 보너스 배열
    let bonus = dartResult
    .components(separatedBy: ["*", "#"])
    .joined()
    .components(separatedBy: .decimalDigits)
    .filter { $0 != "" }

    var options = [1, 1, 1]
    var count = -1
    
    // 옵션 배열 생성
    for c in dartResult {
        if c == "S" || c == "D" || c == "T" {
            count += 1
        } else if c == "*" {
            if count != 0 { options[count - 1] *= 2 }
            options[count] = 2  
        } else if c == "#" {
            options[count] = -1
        }
    }

    let scores = zip(numbers, bonus).map { cal($0, $1) }
    return zip(scores, options).map { $0 * $1 }.reduce(0, +)
}