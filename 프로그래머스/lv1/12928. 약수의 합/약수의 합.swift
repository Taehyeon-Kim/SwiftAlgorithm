func solution(_ n:Int) -> Int {
    
    func divisor(_ n: Int) -> Set<Int> {
        var ret = Set<Int>()
        if n == 0 || n == 1 { ret.insert(n); return ret }
        for i in 1...n/2 where n % i == 0 {
            ret.insert(i)
            ret.insert(n/i)
        }
        return ret
    }

    return divisor(n).reduce(0,+)
}