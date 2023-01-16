import Foundation

/*

1 [2] 3 [4] 5 [6] 7 [8]

- 짝수 우측으로 생각
- 홀수 좌측으로 생각

*/

func solution(_ n:Int, _ a:Int, _ b:Int) -> Int
{
    var answer = 1
    
    var a = a.isMultiple(of: 2) ? a : a + 1
    var b = b.isMultiple(of: 2) ? b : b + 1
    
    while a != b {
        answer += 1
        
        a /= 2
        b /= 2
        
        a = a.isMultiple(of: 2) ? a : a + 1
        b = b.isMultiple(of: 2) ? b : b + 1
    }
    
    return answer
}