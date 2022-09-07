import Foundation

func solution(_ clothes:[[String]]) -> Int {

    var result = 1
    var dict: [String: Int] = [:]
    let clothes = clothes.map { $0[1] }
    
    for i in clothes {
        if dict.keys.contains(i) {
            dict[i]! += 1
        } else {
            dict[i] = 2
        }
    }
    
    for i in dict.values {
        result *= i
    }
    return result - 1
}

assert(solution([["yellow_hat", "headgear"], ["blue_sunglasses", "eyewear"], ["green_turban", "headgear"]]) == 5, "❌ 테스트 케이스를 만족하지 못했어요")
assert(solution([["crow_mask", "face"], ["blue_sunglasses", "face"], ["smoky_makeup", "face"]]) == 3, "❌ 테스트 케이스를 만족하지 못했어요")