import Foundation

// 런타임 에러 나는 이유?

func solution(_ a:[Int], _ b:[Int]) -> Int {
    return zip(a, b).map(*).reduce(0,+)
}