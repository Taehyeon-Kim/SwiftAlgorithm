func next(_ n: Int) -> Int {
    var nxtValue = n + 1
    while true {
        if n.nonzeroBitCount == nxtValue.nonzeroBitCount {
            return nxtValue
        }
        nxtValue += 1
    }
    
    return -1
}

func solution(_ n:Int) -> Int {
    return next(n)
}