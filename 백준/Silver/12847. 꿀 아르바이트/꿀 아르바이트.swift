import Foundation
let input = readLine()!.components(separatedBy: " ")
let n = Int(input[0])!, k = Int(input[1])!

let array = readLine()!.components(separatedBy: " ")
var nums = [Int]()
for i in 0..<n {
    nums.append(Int(array[i])!)
}

var window = nums[0..<k].reduce(0,+)
var answer = window

for i in k..<nums.count {
    window += nums[i] - nums[i-k]
    answer = max(answer, window)
}

print(answer)