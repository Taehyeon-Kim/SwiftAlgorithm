import Foundation

/*
3 <- 4 -> 5 : 앞 뒤로 체육복 빌려줄 수 있음
lost : 체육복 x
reverse: : 체육복 +
최대한 다 수업을 들을 수 있도록(= 체육복을 최대한 다 가지게 할 수 있도록)

// 1.
20202
11112 => 5

// 2.
11111
10201 => 좌,우 탐색 후 없는 쪽에 부여
11101 => 4

// 3.
111
210 => 2
*/

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    
    // 1. n만큼 원소가 1인 배열을 만든다.
    // 2. lost, reverse에 따라서 -1, +1을 해준다.
    // 3. 처음부터 돌면서 2(reserve)인 원소의 경우 좌, 우를 탐색해서 0(lost)인 쪽에 +1을 해준다.
    // 4. 0보다 큰 원소만 count한다.
    
    // - 완전탐색으로 접근
    
    // 1.
    var array = [Int]()
    
    // 2.
    for index in 0..<n {
        var state = 1
        if lost.contains(index + 1) {
            state -= 1
        } 
        
        if reserve.contains(index + 1) {
            state += 1
        } 
        
        array.append(state)
    }
    
    // 3.
    for (index, value) in array.enumerated() {
        if value == 2 {
            // 좌
            if index - 1 >= 0 && array[index - 1] == 0 {
                array[index - 1] += 1
                array[index] -= 1
            } 
            // 우
            else if index + 1 < n && array[index + 1] == 0 {
                array[index + 1] += 1
                array[index] -= 1
            }
        }
    }
    
    return array.filter { $0 > 0 }.count
}