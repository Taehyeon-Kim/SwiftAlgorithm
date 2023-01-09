import Foundation

// row 형태로 이루어진 board를 column의 관점으로 바라봐야함 -> 각각을 stack으로

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    // 1. stack으로 변환
    var stacks: [[Int]] = Array(repeating: Array(repeating: 0, count: board.count), count: board.first!.count)
    var baskets: [Int] = []
    
    for (i, row) in board.enumerated() {
        for (j, val) in row.enumerated() {
            stacks[j][i] = val
        }
    }
    
    // 2. 뽑기
    var count = 0
    for move in moves {
        for (index, doll) in stacks[move - 1].enumerated() {
            if doll == 0 { continue }
            else {
                stacks[move - 1][index] = 0
                // 스택에 넣기전
                if !baskets.isEmpty && baskets.last! == doll {
                    baskets.removeLast()
                    count += 2
                } else {
                    baskets.append(doll)
                }
                break
            }
        }
    }

    return count
}