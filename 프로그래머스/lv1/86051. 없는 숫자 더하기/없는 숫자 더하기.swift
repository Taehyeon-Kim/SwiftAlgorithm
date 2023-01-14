import Foundation

func solution(_ numbers:[Int]) -> Int {
    var answer = 0
    for num in [0,1,2,3,4,5,6,7,8,9] {
        if !numbers.contains(num) {
            answer += num
        }
    }
    return answer
}