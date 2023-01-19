// 1.11 - 22:16
import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int64 {
    
    var start = 1
    var end = times.max()! * n

    while start != end {
        let mid = (start + end) / 2
        let people = times.map { mid / $0 }.reduce(0, +)

        if people >= n {
            end = mid
        }
        
        else if people < n {
            start = mid + 1
        }
    }

    return Int64(start)
}