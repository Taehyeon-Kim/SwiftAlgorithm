// solution
func solution(_ w: String, _ k: Int) -> (min: Int, max: Int) {
    var dict: [Character: [Int]] = [:]
    var (minVal, maxVal) = (Int.max, -1)

    for (idx, ch) in w.enumerated() {
      dict[ch, default: []].append(idx)
    }

    for (_, value) in dict {
      var s = 0
      var e = s + k - 1

      if value.count < k { continue }
      while e < value.count {
        let len = value[e] - value[s] + 1
        minVal = min(minVal, len)
        maxVal = max(maxVal, len)

        s += 1
        e += 1
      }
    }
  
    return (minVal, maxVal)
}

// input
let tc = Int(readLine()!)!
for _ in 0..<tc {
    let w = readLine()!
    let k = Int(readLine()!)!
    let (minVal, maxVal) = solution(w, k)

    minVal == Int.max || maxVal == -1 ? print(-1) : print(minVal, maxVal)
}