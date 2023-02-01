import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var numbers = numbers
    
    var stack: [Int] = [numbers.removeLast()]
    var answer: [Int] = [-1]
    
    while !numbers.isEmpty {
        let popped = numbers.removeLast()
        
        while !stack.isEmpty {
            let top = stack.last!
            
            if top > popped {
                answer.append(top)
                stack.append(popped)
                break
            } else {
                _ = stack.removeLast()
            }
        }
        
        if stack.isEmpty { 
            answer.append(-1)
            stack.append(popped) 
        }
    }

    return answer.reversed()
}