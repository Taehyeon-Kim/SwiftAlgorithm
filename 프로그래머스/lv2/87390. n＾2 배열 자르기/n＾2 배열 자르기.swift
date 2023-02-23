import Foundation

// 이중 for문 쓰면 안 될 것 같음, 그럼 dp?

// 1차원 배열 만들기
func makeOneLineArray(_ left: Int, _ right: Int, _ n: Int) -> [(x: Int, y: Int)] {
    return (left...right).map { ($0/n, $0%n) }
}

func convertToNum(_ point: (x: Int, y: Int)) -> Int {
    let (x, y) = (point.x, point.y)
    
    if x == y { return x + 1 }
    if x > y { return x + 1 }
    else { return y + 1 }
}

func solution(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {
    let ret = makeOneLineArray(Int(left), Int(right), n).map { convertToNum($0) }
    return ret
}