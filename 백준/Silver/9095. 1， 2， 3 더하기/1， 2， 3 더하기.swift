let n = Int(readLine()!)!

for _ in 0..<n {
    let num = Int(readLine()!)!
    var d = Array(repeating: 0, count: num + 4)

    d[1] = 1
    d[2] = 2
    d[3] = 4

    if num > 3 {
        for i in 4...num {
            d[i] = d[i-1] + d[i-2] + d[i-3]
        }
    }
    print(d[num])
}