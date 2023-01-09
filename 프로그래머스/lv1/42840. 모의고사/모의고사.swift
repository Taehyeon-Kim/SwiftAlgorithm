import Foundation


// 1 - 12345/
// 2 - 21232425/
// 3 - 3311224455/
// zip 쓰면 될 듯 -> x -> 길이가 동적이라 쓰면 잘못된 접근

func solution(_ answers:[Int]) -> [Int] {
    let num1 = [1,2,3,4,5]
    let num2 = [2,1,2,3,2,4,2,5]
    let num3 = [3,3,1,1,2,2,4,4,5,5]
    
    var count1 = 0, count2 = 0, count3 = 0
    
    for (index, answer) in answers.enumerated() {
        if answer == num1[index % num1.count] { count1 += 1 }
        if answer == num2[index % num2.count] { count2 += 1 }
        if answer == num3[index % num3.count] { count3 += 1 }
    }
    
    let result = [count1, count2, count3]
    return result
    .enumerated()
    .filter { $0.1 >= result.max()! }
    .map { $0.0 + 1 }
    .sorted()
}