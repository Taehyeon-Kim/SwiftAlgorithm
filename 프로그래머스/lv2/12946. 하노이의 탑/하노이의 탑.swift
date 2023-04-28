import Foundation

// a기둥 -> b기둥
// n번 원판
var ret = [[Int]]()

func hanoi(_ a: Int, _ b: Int, _ n: Int) {
    if n == 1 {
        ret.append([a, b])
        return
    }
    
    hanoi(a, 6-a-b, n-1)
    ret.append([a, b])
    hanoi(6-a-b, b, n-1)
}

func solution(_ n:Int) -> [[Int]] {
    hanoi(1, 3, n)
    return ret
}