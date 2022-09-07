import Foundation

func solution(_ clothes:[[String]]) -> Int {
    
    let types = clothes.compactMap { $0.last }
    let categories = Set(types)
    
    let counts = categories.map({ category in
        return clothes.filter({ $0.last == category }).count + 1
    })

    return counts.reduce(1, { $0 * $1 }) - 1
}

assert(solution([["yellow_hat", "headgear"], ["blue_sunglasses", "eyewear"], ["green_turban", "headgear"]]) == 5, "❌ 테스트 케이스를 만족하지 못했어요")
assert(solution([["crow_mask", "face"], ["blue_sunglasses", "face"], ["smoky_makeup", "face"]]) == 3, "❌ 테스트 케이스를 만족하지 못했어요")