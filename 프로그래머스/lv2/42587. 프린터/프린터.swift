import Foundation

// 반복
// max보다 작으면 append

func solution(_ priorities:[Int], _ location:Int) -> Int {
    
    var printer = priorities.enumerated().map { $0 }
    
    var count = 0
    while !printer.isEmpty {
        let max = printer.map { $1 }.max()!
        let popped = printer.removeFirst()
        
        if popped.1 < max {
            printer.append(popped)
        } else {
            count += 1
            if popped.0 == location { return count }
        }
    }
    
    return -1
}