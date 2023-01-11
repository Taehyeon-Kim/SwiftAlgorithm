// 1/10 2:24 -
import Foundation

// 길이의 절반까지만 반복문을 돌리면 될 것 같음

func cut(_ target: String, unit: Int) -> [String] {
    var result: [String] = []
    let length = target.count - (target.count % unit)
    let array = target.map { String($0) }
    for i in stride(from: 0, to: length, by: unit) {
        let range = i..<i+unit
        result.append(array[range].joined())
    }
    let last = array[length..<target.count].joined()
    if last != "" { result.append(last) }
    return result
}

func removeDuplicates(_ arr: [String]) -> String {
    var count = 0
    var stack = [String]()
    var prev = arr[0]
    
    for str in arr {
        if prev == str {
            count += 1
        } else {
            stack.append("\(count == 1 ? "" : "\(count)")\(prev)")
            prev = str
            count = 1
        }
    }
    
    stack.append("\(count == 1 ? "" : "\(count)")\(prev)")
    return stack.joined()
}

func solution(_ s:String) -> Int {    
    var answer = s.count
    let len = s.count
    
    if len == 1 { return 1 }
    
    for unit in 1...len/2 {
        let compressed = removeDuplicates(cut(s, unit: unit))
        answer = min(answer, compressed.count)
    }
    
    return answer
}