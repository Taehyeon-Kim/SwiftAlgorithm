let k = Int(readLine()!)!
let a = readLine()!.split{$0 == " "}.map{String($0)}

var ret = [Int]()
var ans = [String]()
var v = Array(repeating: false, count: 10)

func dfs(_ len: Int, _ num: Int) {
  // 종료 조건
  // 숫자는 부등호보다 1개 더 많음
  if len == k + 1 {
    ans.append(ret.map{String($0)}.joined())
    return
  }

  for i in 0...9 {
    if !v[i] {
      // 조건 만족못하면 그냥 스킵
      if len > 0 {
          if num <= i && a[len - 1] == ">" { continue }
          else if num >= i && a[len - 1] == "<" { continue }
      }

      v[i] = true
      ret.append(i)
      dfs(len+1, i)
      v[i] = false
      ret.removeLast()
    }
  }
}

dfs(0,0)
print(ans.max()!)
print(ans.min()!)