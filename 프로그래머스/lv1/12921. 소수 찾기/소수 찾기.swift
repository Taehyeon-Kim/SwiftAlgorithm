let N = 1_000_000

func solution(_ n:Int) -> Int {
    var prime = Array(repeating: true, count: N+1)
    prime[0...1] = [false, false]
    
    for i in 2...n {
        if !prime[i] { continue }
        for j in stride(from: i+i, to: n+1, by: i) {
            prime[j] = false
        }
    }

    return prime[0...n].filter { $0 == true }.count
}