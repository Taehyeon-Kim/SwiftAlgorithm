import Foundation

func solution(_ n:Int) -> [Int] {
    var ret = Array(repeating: Array(repeating: 0, count: n), count: n)
    var (row, col, num, cnt) = (-1, 0, 1, 0)
    
    // 전체
    for i in stride(from: n, to: 0, by: -1) {
        
        // 한방향
        for j in 0..<i {
            switch cnt % 3 {
            case 0: // down
                row += 1
                ret[row][col] = num
                num += 1
                
            case 1: // right
                col += 1
                ret[row][col] = num
                num += 1
                
            case 2: // up
                row -= 1
                col -= 1
                ret[row][col] = num
                num += 1
            default: break
            }   
        }
        
        cnt += 1
    }
    
    return ret.flatMap { $0.filter { $0 != 0 } }
}