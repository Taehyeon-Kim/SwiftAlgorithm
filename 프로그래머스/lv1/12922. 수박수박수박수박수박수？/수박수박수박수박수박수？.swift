func solution(_ n:Int) -> String {
    return (0..<n).map { $0 % 2 == 0 ? "수" : "박" }.joined()
}