func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {    
    return zip(arr1, arr2)
    .map { String($0|$1, radix: 2).map { $0 == "1" ? "#" : " " } }
    .map { String(repeating: " ", count: n - $0.count) + $0 }
}