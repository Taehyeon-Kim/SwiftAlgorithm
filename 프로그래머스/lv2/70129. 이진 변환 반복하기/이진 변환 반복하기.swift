import Foundation

func removeZero(_ str: String) -> (zero: Int, str: String) {
    let zero = str.map { String($0) }.filter { $0 == "0" }.count
    let length = str.map { String($0) }.filter { $0 == "1" }.count
    let str = String(length, radix: 2)
    return (zero, str)
}

func solution(_ s:String) -> [Int] {
    var (zero, count, letter) = (0, 0, s)
    
    repeat {
        let (cnt, str) = removeZero(letter)
        count += 1
        zero += cnt
        letter = str
    } while letter != "1"
    
    return [count, zero]
}