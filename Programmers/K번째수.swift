import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    
    return commands.reduce(into: []) { result, command in
        let start = command[0] - 1
        let end = command[1] - 1
        let newArray = array[start...end].sorted()
        let index = command[2] - 1
        result.append(newArray[index])
    }
}

assert(solution([1, 5, 2, 6, 3, 7, 4], [[2, 5, 3], [4, 4, 1], [1, 7, 3]]) == [5, 6, 3], "❌ 테스트 케이스를 만족하지 못했어요")