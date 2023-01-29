func solution(_ seoul:[String]) -> String {
    return seoul.enumerated().filter { $0.element == "Kim" }.map { "김서방은 \($0.offset)에 있다" }.joined()
}