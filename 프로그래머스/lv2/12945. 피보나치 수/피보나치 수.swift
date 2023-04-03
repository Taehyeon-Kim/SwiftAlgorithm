var cache = Array(repeating: 0, count: 100_001)

func solution(_ n:Int) -> Int {
    if [0, 1].contains(n) { return n }
    if cache[n] > 0 { return cache[n] }
    cache[n] = (solution(n-1) + solution(n-2)) % 1234567
    return cache[n]
}