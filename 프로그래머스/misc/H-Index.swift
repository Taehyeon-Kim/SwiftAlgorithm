func solution(_ citations:[Int]) -> Int {
    
    for (index, value) in citations.sorted(by: >).enumerated() {
        if index >= value { return index }
    }
    
    return citations.count
}

assert(solution([3, 0, 6, 1, 5]) == 3, "❌ 테스트 케이스를 만족하지 못했어요")