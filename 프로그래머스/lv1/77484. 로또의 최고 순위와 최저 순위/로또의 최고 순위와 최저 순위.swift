import Foundation

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    let rate: [Int: Int] = [6:1, 5:2, 4:3, 3:4, 2:5, 1:6, 0:6]
    let num = lottos.filter { win_nums.contains($0) }.count
    let zero = lottos.filter { $0 == 0 }.count
    return [rate[num + zero]!, rate[num]!]
}