import Foundation

let n = Int(readLine()!)!
var cards = readLine()!.split(separator: " ").map{ Int($0)! }.sorted(by: <)
cards.append(cards[cards.count - 1] + 1)
let m = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map{ Int($0)! }

func lowerBound(arr: [Int], start: Int, end: Int, target: Int) -> Int {
    var start = start
    var end = end

    while end > start {
        let mid = start + ((end - start) / 2)

        if arr[mid] >= target {
            end = mid
        } else {
            start = mid + 1
        }
    }

    return start
}

func upperBound(arr: [Int], start: Int, end: Int, target: Int) -> Int {
    var start = start
    var end = end

    while end > start {
        let mid = start + ((end - start) / 2)

        if arr[mid] > target {
            end = mid
        } else {
            start = mid + 1
        }
    }

    return end
}

for i in 0..<m {
    let target = nums[i]
    let up = upperBound(arr: cards, start: 0, end: n, target: target)
    let low = lowerBound(arr: cards, start: 0, end: n, target: target)
    print("\(up - low)", terminator: " ")
}