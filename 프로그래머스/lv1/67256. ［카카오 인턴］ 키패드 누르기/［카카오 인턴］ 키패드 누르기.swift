import Foundation

// 2열의 숫자를 어느 손으로 누르는지가 중요
// 1. 거리 계산 후 가까운 쪽
// 2. 거리가 같은 경우에는 hand를 기준으로 반환

var keys = [
    ["1", "2", "3"],
    ["4", "5", "6"],
    ["7", "8", "9"],
    ["*", "0", "#"]
]

// 포인트
func point(_ key: String) -> (Int, Int) {
    for (i, row) in keys.enumerated() {
        for (j, val) in row.enumerated() {
            if val == key { 
                return (i, j) 
            }
        }
    }
    return (0, 0)
}

// 거리 계산
func distance(_ x: (Int, Int), _ y: (Int, Int)) -> Int {    
    return abs(x.0 - y.0) + abs(x.1 - y.1)
}

func solution(_ numbers:[Int], _ hand:String) -> String {
    let left = ["1", "4", "7"], middle = ["2", "5", "8", "0"], right = ["3", "6", "9"]
    var lp = "*", rp = "#"
    
    return numbers
    .map { String($0) }
    .map { num -> String in
        if left.contains(num) {
            lp = num
            return "L"
        }
        
        else if right.contains(num) {
            rp = num
            return "R"
        }
        
        else {
            let ld = distance(point(lp), point(num))
            let rd = distance(point(rp), point(num))
            if ld == rd { 
                if hand == "left" { lp = num }
                else if hand == "right" { rp = num }
                return hand.capitalized.map { String($0) }[0] 
            }
            if ld > rd {
                rp = num
                return "R"
            } else {
                lp = num
                return "L"
            }
        }
    }.joined()
    
    
}