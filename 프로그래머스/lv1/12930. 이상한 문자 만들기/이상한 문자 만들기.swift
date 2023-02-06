func solution(_ s:String) -> String {
    return s.split(separator: " ", omittingEmptySubsequences: false).map {
        $0.enumerated().map { (idx, value) in
            return idx % 2 == 0 ? value.uppercased() : value.lowercased()
        }.joined()
    }.joined(separator: " ")
}