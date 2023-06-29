let n = Int(readLine()!)!
var a = [[Int]]()
for _ in 0..<n {
  let input = readLine()!.split(separator: " ").compactMap{Int(String($0))}
  a.append(input)
}

// # n: 일
// # a: t, p 값 배열

var ans = 0 // 정답 전역변수
func dfs(_ i: Int, _ mx: Int) {
  // 종료조건
  if i >= n {
    ans = max(ans, mx)
    return
  }

  // 상담 불가
  dfs(i+1, mx)

  // 상담 가능
  if i + a[i][0] <= n {
    dfs(i + a[i][0], mx + a[i][1])  
  }
}

dfs(0, 0)
print(ans)