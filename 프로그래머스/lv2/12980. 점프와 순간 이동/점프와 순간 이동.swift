import Foundation

func solution(_ n:Int) -> Int 
{
    var ans = 0
    func recur(_ n: Int) {
        if n == 0 { return }
        
        if n % 2 == 0 { 
            recur(n/2) 
        } else {
            ans += 1
            recur(n-1)
        }
    }
    recur(n)
    return ans
}