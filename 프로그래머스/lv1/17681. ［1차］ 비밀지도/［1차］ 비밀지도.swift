
// 이진수 계산
func asBinary(_ x: Int, n: Int) -> String {
    let string = String(x, radix: 2).map { $0 == "1" ? "#" : " "}
    let len = string.count
    return (string.count < n ? (0..<n - string.count).map { _ in " " } + string : string).joined()
}

// 합성
func compose(_ l: String, _ r: String) -> String {
    return zip(l, r).map { $0 == "#" || $1 == "#" ? "#" :  " " }.joined()
}

func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {    
    let arr1 = arr1.map { asBinary($0, n: n) }
    let arr2 = arr2.map { asBinary($0, n: n) }

    return zip(arr1, arr2).map { compose($0, $1) }
}