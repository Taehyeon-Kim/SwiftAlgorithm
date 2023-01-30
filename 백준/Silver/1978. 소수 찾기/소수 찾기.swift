let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }

func isPrime(_ n: Int) -> Bool {
    if [0, 1].contains(n) { return false }
    for i in 0...n/2 {
        if i == 0 || i == 1 { continue }
        if n % i == 0 { return false }
    }
    return true
}

print(arr.filter { isPrime($0) }.count)