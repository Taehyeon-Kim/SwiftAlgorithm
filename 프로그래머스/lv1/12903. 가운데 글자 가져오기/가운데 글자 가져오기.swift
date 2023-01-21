func solution(_ s:String) -> String {
    let length = s.count
    if length == 1 { return s }
    
    let odd = s.map { String($0) }[length/2...length/2].joined()
    let even = s.map { String($0) }[length/2-1...length/2].joined()
    return length.isMultiple(of: 2) ? even : odd
}