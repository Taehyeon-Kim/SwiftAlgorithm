import Foundation
let nm = readLine()!.split{$0==" "}.compactMap{Int(String($0))}
let (n,m) = (nm[0], nm[1])
let j = Int(readLine()!)!

// 사과
var arr = [Int]()
for _ in 0..<j {
  arr.append(Int(readLine()!)! - 1)
}

// 바구니
var basket = [Int]()
for i in 0..<m {
  basket.append(i)
}

var ans = 0
var l = 0

for i in arr {
  let r = l + m - 1
  if i >= l && i <= r { continue }
  else {
    if i < l {
      ans += (l - i)
      l = i
    } else {
      ans += (i - r)
      l += (i - r)
    }
  }
}

print(ans)