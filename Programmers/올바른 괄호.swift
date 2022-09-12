/*
- 처음 풀이는 효율성을 통과하지 못함.

*/

import Foundation

func solution(_ s: String) -> Bool
{
    var stack: [String] = []
    let array = Array(s)

    for (index, br) in Array(s).enumerated() {
        if stack.isEmpty {
            stack.append(String(br))
        } else {
            if stack.last! == "(" && br == ")" {
                stack.removeLast()
            } else {
                stack.append(String(br))
            }
        }
    }

    return stack.isEmpty
}