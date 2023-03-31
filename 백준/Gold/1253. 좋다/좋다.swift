let n = Int(readLine()!)!

var nums: [Int] = []
nums = readLine()!.split(separator: " ").compactMap{Int(String($0))}
nums.sort()

var dict: [Int: Int] = [:]
var sets = Set<Int>()
var count = 0

for i in 0..<n {
  dict[nums[i], default: 0] += 1
}

// 0이 3개 이상일 때 포함
if let zero = dict[0], zero >= 3 {
  sets.insert(0)
}

for i in stride(from: 0, to: n, by: 1) {
  for j in stride(from: i+1, to: n, by: 1) {
    if nums[i] == 0 && nums[j] == 0 { continue }
    if nums[i] == 0 && dict[nums[j]] == 1 { continue }
    if nums[j] == 0 && dict[nums[i]] == 1 { continue }
    sets.insert(nums[i] + nums[j])
  }
}

for i in 0..<n {
  if sets.contains(nums[i]) {
    count += 1
  }
}

print(count)