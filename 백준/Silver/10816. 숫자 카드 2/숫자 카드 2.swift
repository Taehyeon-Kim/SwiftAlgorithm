let n = Int(readLine()!)!
var cards = readLine()!.split(separator: " ").map{ Int($0)! }.sorted(by: <)
let m = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map{ Int($0)! }

func lowerBound(_ array: [Int], _ target: Int) -> Int {
  // end point가 배열의 마지막 인덱스 + 1
  var (s, e) = (0, n)
  while s < e {
    let mid = (s + e) / 2
    if array[mid] < target { s = mid + 1 }
    else { e = mid }
  }
  // 같아지면 종료
  return s
}

func upperBound(_ array: [Int], _ target: Int) -> Int {
  var (s, e) = (0, n)
  while s < e {
    let mid = (s + e) / 2
    if array[mid] <= target { s = mid + 1 }
    else { e = mid }
  }
  // 같아지면 종료
  return s
}

for i in 0..<m {
    let target = nums[i]
    let up = upperBound(cards, target)
    let low = lowerBound(cards, target)
    print("\(up - low)", terminator: " ")
}