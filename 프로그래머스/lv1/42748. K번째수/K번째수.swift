import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    
    return commands.map { cmd in
        return array[cmd[0]-1...cmd[1]-1].sorted()[cmd[2]-1]
    }
}

/* swift
// 분할
// 1. 슬라이싱
// - Swift에서의 Slicing
// 2. 정렬
// 3. peek
return commands.map {
    let i = $0[0] - 1, j = $0[1] - 1, k = $0[2] - 1
    return array[i...j].sorted()[k]
}
/*
