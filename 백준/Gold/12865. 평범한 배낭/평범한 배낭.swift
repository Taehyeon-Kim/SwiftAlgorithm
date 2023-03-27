let nk = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let (n,k) = (nk[0],nk[1])

// 물품 무게
var weights = [Int](repeating: 0, count: n)
// 가치
var values = [Int](repeating: 0, count: n)

// 인풋 채우기
for i in 0..<n {
  let line = readLine()!.split(separator: " ").compactMap{Int(String($0))}
  weights[i] = line[0]
  values[i] = line[1]
}

var cache = [[Int]](repeating: [Int](repeating: 0, count: 100_001), count: 101)

func go(_ idx: Int, _ w: Int) -> Int {
  if cache[idx][w] > 0 {
    return cache[idx][w]
  }
  
  if (idx == n) {
    return 0
  }

  var n1 = 0
  if w + weights[idx] <= k {
    n1 = values[idx] + go(idx+1, w + weights[idx]) // 포함
  }
  let n2 = go(idx+1, w)

  cache[idx][w] = max(n1, n2)
  return cache[idx][w]
}

func main() {
  print(go(0,0))
}

main()