let n = Int(readLine()!)!
var house = [[Int]]()
var d = [[Int]](repeating: [Int](repeating: 0 ,count: 3), count: n)

// 원본 배열(집 비용)
for _ in 0..<n {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    house.append(line)
}

// 첫 줄 세팅
for i in 0..<3 {
    d[0][i] = house[0][i]
}

// dp 점화식
for i in 1..<n {
    d[i][0] = min(d[i-1][1], d[i-1][2]) + house[i][0]
    d[i][1] = min(d[i-1][0], d[i-1][2]) + house[i][1]
    d[i][2] = min(d[i-1][0], d[i-1][1]) + house[i][2]
}

print(d[n-1].min()!)