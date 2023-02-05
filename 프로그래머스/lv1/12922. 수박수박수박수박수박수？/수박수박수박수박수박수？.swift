func solution(_ n:Int) -> String {
    var answer = ""
    for i in 0..<n {
        answer += i % 2 == 0 ? "수" : "박"
    }
    return answer
}