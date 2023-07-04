func solution(_ numbers:[Int]) -> String {

    let numberString =  numbers.sorted { 
        String(repeating: "\($0)", count: 6).prefix(5) > String(repeating: "\($1)", count: 6).prefix(5)
    }
    .map { String($0) }
    
    return numberString.first == "0" ? "0" : numberString.joined()
}

assert(solution([6, 10, 2]) == "6210", "❌ 테스트 케이스를 만족하지 못했어요")
assert(solution([3, 30, 34, 5, 9]) == "9534330", "❌ 테스트 케이스를 만족하지 못했어요")