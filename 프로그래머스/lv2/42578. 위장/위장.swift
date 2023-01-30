import Foundation

func solution(_ clothes:[[String]]) -> Int {
    let types = clothes.compactMap { $0.last }
    let categories = Set(types)
    
    let counts = categories.map({ category in
        return clothes.filter({ $0.last == category }).count + 1
    })

    return counts.reduce(1, { $0 * $1 }) - 1
}