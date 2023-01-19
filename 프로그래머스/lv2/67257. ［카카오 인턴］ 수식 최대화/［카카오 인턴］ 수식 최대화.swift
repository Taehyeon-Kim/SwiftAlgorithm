import Foundation

let operators = [
    ["*", "-", "+"],
    ["*", "+", "-"],
    ["+", "*", "-"],
    ["+", "-", "*"],
    ["-", "+", "*"],
    ["-", "*", "+"]
]

func split(_ expression: String) -> [String] {
    var arr = [String]()
    var tmp = ""
    for exp in expression.map { String($0) } {
        if ["*", "-", "+"].contains(exp) {
            arr.append(tmp)
            tmp = exp
            arr.append(tmp)
            tmp = ""
        } else {
            tmp += exp
        }
    }
    arr.append(tmp)
    return arr    
}

func calculate(_ expArr: [String], _ `operator`: [String]) -> Int {
    var queues = Array(repeating: [String](), count: 4)
    queues[0] = expArr
    
    for (i, op) in `operator`.enumerated() {  // ["*", "-", "+"]
        while !queues[i].isEmpty {
            let exp = queues[i].removeFirst()

            if exp == op {
                let num1 = queues[i+1].popLast()!
                let num2 = queues[i].removeFirst()
                let result = cal(num1, num2, op)
                queues[i+1].append(String(result))
                
            } else {
                queues[i+1].append(exp)
            }
        }
    }

    return abs(Int(queues[3][0])!)
}

func cal(_ num1: String, _ num2: String, _ op: String) -> Int {
    switch op {
    case "+":
        return Int(num1)! + Int(num2)!
    case "-":
        return Int(num1)! - Int(num2)!
    case "*":
        return Int(num1)! * Int(num2)!
    default:
        return -1
    }
}

func solution(_ expression:String) -> Int64 {
    let splited = split(expression)
    var answer = 0
    
    for op in operators {
        let result = calculate(splited, op)
        answer = max(answer, result)
    }
   
    return Int64(answer)
}