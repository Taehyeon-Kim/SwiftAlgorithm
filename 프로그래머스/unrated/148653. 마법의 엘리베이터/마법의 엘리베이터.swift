import Foundation

func solution(_ storey:Int) -> Int {
    var value = storey
    var numbers = [Int]()
    var answer = 0
    
    while value > 0 {
        numbers.append(value % 10)
        value /= 10
    }
    
    numbers.append(0)

    for i in numbers.indices {
        // 자릿수가 5보다 클때
        if numbers[i] > 5 {
            answer += (10 - numbers[i])
            numbers[i + 1] += 1    
        }
        
        // 자릿수가 5와 같을때
        else if numbers[i] == 5 {
            if numbers[i + 1] >= 5 {
                answer += (10 - numbers[i])
                numbers[i + 1] += 1    
            } else {
                answer += numbers[i]   
            }
        } 
        
        // 자릿수가 5보다 작을때
        else {
            answer += numbers[i]
        }
    }
    
    return answer
}