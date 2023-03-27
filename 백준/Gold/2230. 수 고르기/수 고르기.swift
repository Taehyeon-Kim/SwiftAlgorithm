// 변수 준비
let nm = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let (n, m) = (nm[0], nm[1])

var nums = [Int]()
for _ in 0..<n {
  nums.append(Int(readLine()!)!)
}
nums.sort()

// index
var (left, right) = (0, 0)
var ans = Int.max

while left < n && right < n {
  let value = nums[right] - nums[left]

  if value >= m {
    ans = min(ans, value)
    left += 1
  } else {
    right += 1
  }
}

print(ans)