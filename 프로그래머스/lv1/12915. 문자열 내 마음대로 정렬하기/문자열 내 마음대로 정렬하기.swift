func solution(_ strings:[String], _ n:Int) -> [String] {
    return strings.sorted {
        let index = $0.index($0.startIndex, offsetBy: n)
        return $0[index] == $1[index] ? $0 < $1 : $0[index] < $1[index]
    }
}