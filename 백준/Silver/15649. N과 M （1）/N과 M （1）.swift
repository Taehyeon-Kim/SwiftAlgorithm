let nm = readLine()!.split{$0==" "}.compactMap{Int(String($0))}
let (n,m) = (nm[0],nm[1])

var ans = [[Int]]()
var ret = [Int]()
var v = Array(repeating: false, count: n+1)

func dfs(_ len: Int) {
  if len == m {
    // 결과 추가
    // ans:[[Int]], ret:[Int]
    ans.append(ret)
  }

  for i in 1...n {
    if !v[i] {
      v[i] = true
      ret.append(i)
      dfs(len+1)
      v[i] = false
      ret.removeLast()
    }
  }
}

dfs(0)

for num in ans {
  print(num.map{String($0)}.joined(separator: " "))
}