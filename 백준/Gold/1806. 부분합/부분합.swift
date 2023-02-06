func input() -> (Int, Int, [Int]) {
    let ns = readLine()!.split(separator: " ").compactMap {Int(String($0))}
    let (n, s) = (ns[0], ns[1])
    let arr = readLine()!.split(separator: " ").compactMap {Int(String($0))}
    return (n, s, arr)
}

func solution() -> Int {
    let (n, s, arr) = input()
    var (ans, left, right) = (Int.max, 0, 0)
    var sums = arr[left]
    while left < n && right < n {
      if sums < s {
        right += 1
        if right == n { break }
        sums += arr[right]
      } else {
        ans = min(ans, right - left + 1)
        sums -= arr[left]
        left += 1
      }
    }
    return ans == Int.max ? 0 : ans 
}

print(solution())