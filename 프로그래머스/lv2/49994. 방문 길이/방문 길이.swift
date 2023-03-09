import Foundation

/*
방문한 경로를 set에 넣고 관리하면 될 것 같음 -> 최종 set의 길이를 반환
*/

/// Pair
/// - x: x 좌표
/// - y: y 좌표
struct Pair: Hashable {
    let x: Int
    let y: Int
    
    init(_ x: Int, _ y: Int) {
        self.x = x
        self.y = y
    }
}

func solution(_ dirs:String) -> Int {
    let move: [String: Pair] = ["U": Pair(0,-1), "D": Pair(0, 1), "R": Pair(1, 0), "L": Pair(-1, 0)]
    var ret = Set<Set<Pair>>()  // (0,0) - (2,0) 과 (2,0) - (0,0)은 같은 길이라는 것 기억하기
    var cur = Pair(0, 0)
    
    for dir in dirs {
        let dir = move[String(dir)]!                    // 방향
        let (nx, ny) = (cur.x + dir.x, cur.y + dir.y)   // 다음 좌표
        let next = Pair(nx, ny)                         // 다음 좌표를 Pair로 감싸기
        
        // 범위 안에 있는 경우만 길 놓기
        if (-5...5) ~= nx && (-5...5) ~= ny {
            let pairs: Set<Pair> = [cur, next]
            ret.insert(pairs)
            cur = next
        }
    }

    return ret.count
}