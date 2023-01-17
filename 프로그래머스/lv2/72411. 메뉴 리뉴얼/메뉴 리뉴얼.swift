import Foundation

// 1.17 8:55

// [[-], [2개 메뉴], [3개 메뉴], [4개 메뉴]...[N개 메뉴]]
// 조합이 생각났다.

// 조합
func combi(_ targets: [String], _ targetNum: Int) -> [String] {
    var result = [String]()
    
    func combination(_ index: Int, _ nowCombi: [String]) {
        if nowCombi.count == targetNum {
            result.append(nowCombi.joined())
            return
        }
        for i in index..<targets.count {
            combination(i + 1, nowCombi + [targets[i]])
        }
    }
    
    combination(0, [])
    
    return result
}

func solution(_ orders:[String], _ course:[Int]) -> [String] {

    var results = [String]()
    
    for c in course {
        var dict: [String: Int] = [:]
        for order in orders {
            for comb in combi(order.sorted().map { String($0) }, c) {
                dict[comb, default: 0] += 1
            }
        }
        
        if let max = dict.values.max() {
            for key in dict.filter { $0.value == max }.filter { $0.value != 1 }.keys {
                results.append(key)   
            }
        }
    }

    return results.sorted()
}