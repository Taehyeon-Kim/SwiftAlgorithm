import Foundation

// N(입력)이 크지 않다.
// 조합의 수가 엄청 많다.
// 연산을 줄일 수 있는 방법에 대해 고민

// 입력값(N)만큼만 범위 만들어서 하면 될 줄 알았는데 8까지 범위를 줬어야 했음

func solution(_ N:Int, _ number:Int) -> Int {
    var answer = -1
    var s = Array(repeating: Set<Int>(), count: 9)
    
    // 1. N, NN, NNN, ...
    var sum = 0
    for i in 0..<8 {
        sum = 10*sum + N
        s[i].insert(sum)
    }

    // 2. DP 이용해서 조합 찾기
    for i in 1..<8 {
        for j in 0..<i {
            for a in s[j] {
                for b in s[i-j-1] {
                    s[i].insert(a+b)
                    s[i].insert(a-b)
                    s[i].insert(a*b)
                    if b != 0 { s[i].insert(a/b) }
                }
            }
        }
    }
    
    // 3. 찾기
    for i in 0..<8 {
        if s[i].contains(number) {
            answer = i + 1
            break
        }
    }

    return answer
}