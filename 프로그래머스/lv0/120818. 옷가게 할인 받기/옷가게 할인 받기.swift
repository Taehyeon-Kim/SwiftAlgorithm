import Foundation

func solution(_ price:Int) -> Int {
    var answer = 0.0
    
    if price >= 500_000 {
        answer = Double(price) * 0.8
    } else if price >= 300_000 {
        answer = Double(price) * 0.9
    } else if price >= 100_000 {
        answer = Double(price) * 0.95
    } else {
        answer = Double(price)
    }

    return Int(answer)
}