func solution(_ s:String) -> String {
    let s = s.split(separator: " ").compactMap{Int(String($0))}
    return "\(s.min()!) \(s.max()!)"
}