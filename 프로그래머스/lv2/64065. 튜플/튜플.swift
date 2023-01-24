import Foundation

// 원본 튜플을 구하는 문제 -> 원소의 순서가 존재한다.
// - a1 / a1, a2 ... 이런식으로 순서대로 뽑힌다.
// 1. 길이가 짧은 순서대로 정렬
// 2. 1번에서 정렬한 원소를 순차적으로 배열에 넣으면 될듯(없는 것만)
// 3. 집합과 배열 각각 만들어서 체크 (집합은 없는 원소 체크용), (배열은 순서 체크용))

func split(_ s: String) -> [[Int]] {
    var answer = [[Int]]()
    var tmp = [Int]()
    var number = ""
    var s = Array(s)
    
    for (i, c) in s.enumerated() {
        if c.isNumber {
            number += String(c)
            
            if s[i+1] == "," {
                tmp.append(Int(number)!)
                number = ""
            }
            
            else if s[i+1] == "}" {
                tmp.append(Int(number)!)
                answer.append(tmp)

                number = ""
                tmp = []
            }
        }
    }

    return answer.sorted { $0.count < $1.count }
}

func solution(_ s:String) -> [Int] {
    var basket = Set<Int>()
    var answer = [Int]()
    var splited = split(s)
    
    for elem in splited {
        for num in elem {
            if !basket.contains(num) {
                basket.insert(num)
                answer.append(num)
            }
        }
    }

    return answer
}