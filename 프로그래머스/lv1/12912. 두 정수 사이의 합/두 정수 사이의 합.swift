func solution(_ a:Int, _ b:Int) -> Int64 {
    var arr = a < b ? [a, b] : [b, a]
    var answer = 0
    
    for val in stride(from: arr[0], through: arr[1], by: 1) {
        answer += val
    }
    
    return Int64(answer)
}

/*
func solution(_ a:Int, _ b:Int) -> Int64 {    
    return Int64((a < b ? (a...b) : (b...a)).map { $0 }.reduce(0, +))
}
*/
