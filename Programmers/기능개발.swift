import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
        
    let release = zip(progresses, speeds).map { ceil(Double(100 - $0)/Double($1)) }
    var value = release[0]
    var count = 1
    var result: [Int] = []
    
    for index in 1..<release.count {
        if value < release[index] {
            value = release[index]
            result.append(count)
            count = 1
        } else {
            count += 1
        }
    }
    result.append(count)
    
    return result
}

assert(solution([93, 30, 55], [1, 30, 5]) == [2, 1], "❌ 테스트 케이스를 만족하지 못했어요")
assert(solution([95, 90, 99, 99, 80, 99], [1, 1, 1, 1, 1, 1]) == [1, 3, 2], "❌ 테스트 케이스를 만족하지 못했어요")