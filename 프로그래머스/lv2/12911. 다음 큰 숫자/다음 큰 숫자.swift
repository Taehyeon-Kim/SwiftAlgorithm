func next(_ n: Int) -> Int {
    var countOfTwo = String(n, radix: 2).filter { $0 == "1" }.count
    var nxtValue = n
    
    while true {
        nxtValue += 1
        let cnt = String(nxtValue, radix: 2).filter { $0 == "1" }.count
        
        if countOfTwo == cnt {
            return nxtValue
        }
    }
    
    return -1
}

func solution(_ n:Int) -> Int
{
    return next(n)
}