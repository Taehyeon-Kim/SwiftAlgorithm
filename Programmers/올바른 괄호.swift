/*
- 처음 풀이는 효율성을 통과하지 못함.

*/

import Foundation

func solution(_ s: String) -> Bool
{
    var count = 0

    for br in s {
        if br == "(" {
            count += 1
        } else if br == ")" {
            count -= 1
        } 
        
        if count < 0 {
            return false
        }
    }

    return count == 0
}