func solution(_ s:String) -> Bool {
    return [4, 6].contains(s.count) && s.filter { !$0.isNumber }.count == 0
}