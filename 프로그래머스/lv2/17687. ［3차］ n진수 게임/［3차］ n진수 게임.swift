func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    
    var ret = ""
    for i in stride(from: 0, to: t * m, by: 1) {
        ret += String(i, radix: n)
    }

    var ans = ""
    for (i, value) in ret.enumerated() {
        if (i % m) == p - 1 {
            ans += String(value).uppercased()
        }
    }
    return String(ans.prefix(t))
}