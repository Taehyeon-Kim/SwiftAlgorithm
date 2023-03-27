// 변수 준비
let ns = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let (N, S) = (ns[0], ns[1])

var nums = readLine()!.split(separator: " ").compactMap{Int(String($0))}

var (left, right, s) = (0, 0, 0)
s = nums[left]
var ans = Int.max

// 끝까지 탐색, 투포인터 이용
while left < N && right < N {
  // 작으면 오른쪽 포인터 증가
  if s < S {
    right += 1
    if right == N { break }
    s += nums[right]
  }

  else {
    ans = min(ans, right - left + 1)
    s -= nums[left]
    left += 1
  }
}

print(ans == Int.max ? 0 : ans)