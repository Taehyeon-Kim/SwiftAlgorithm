func solution(_ s:String) -> String {
    return s.sorted(by: >).map { String($0) }.joined()
}