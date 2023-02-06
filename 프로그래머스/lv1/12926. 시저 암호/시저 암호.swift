func solution(_ s:String, _ n:Int) -> String {
    return s.utf8.map {
        var value = Int($0)
        switch value {
        case 65...90:
            value = (value + n - 65) % 26 + 65
        case 97...122:
            value = (value + n - 97) % 26 + 97
        default:
            break
        }
        return String(UnicodeScalar(value)!)
    }.joined()
}