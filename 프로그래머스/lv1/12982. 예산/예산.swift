import Foundation

// 작은 것으로 정렬한다음에 작은 것부터 빼주면 최대한 많은 개수를 구매할 수 있음

func solution(_ d:[Int], _ budget:Int) -> Int {
    var rest = budget
    return d.sorted(by: <).filter { num in
        rest -= num
        return rest >= 0
    }.count
}