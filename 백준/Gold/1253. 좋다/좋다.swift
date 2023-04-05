let n = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").compactMap{Int(String($0))}.sorted()
var count = 0

func isGood(_ idx: Int, _ element: Int) -> Bool {
  // 합의 범위를 이분탐색의 시작과 끝으로 만듦
  var (st, en) = (0, n-1)

  while st < en {
    let target = nums[st] + nums[en]
    if target == element {
      if ![st, en].contains(idx) { return true }
      else if st == idx { st += 1 }
      else if en == idx { en -= 1 }
    }
    else if target < element { st += 1 }
    else { en -= 1 }
  }
  
  return false
}

for i in stride(from: 0, to: n, by: 1) {
  if isGood(i, nums[i]) { count += 1 }
}

print(count)