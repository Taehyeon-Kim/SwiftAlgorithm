func solution(_ s:String) -> String {
    return s.split(separator: " ", omittingEmptySubsequences: false)
        .map { $0.lowercased() }
        .map { !$0.isEmpty && $0.first!.isLetter ? $0.capitalized : $0 }
        .joined(separator: " ")
}