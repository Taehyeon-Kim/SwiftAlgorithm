let n = Int(readLine()!)!
let a = readLine()!.split{$0 == " "}.compactMap{Int(String($0))}
var start = Int(readLine()!)!
var dict = [Int: [Int]]()

// 트리 탐색 알고리즘(dfs)
func dfs(_ n: Int) -> Int {
  var ret = 0
  var child = 0

  for i in dict[n, default: []] {
    if i == start { continue }
    ret += dfs(i)
    child += 1
  }

  if child == 0 { return 1 }
  return ret
}

// 개수 카운트
// 딕셔너리 세팅
var root = 0
for (i, v) in a.enumerated() {
  if v == -1 { root = i; continue } 
  dict[v, default: []].append(i)
}

// 메인 함수
func main() {
  if start == root {
    print(0)
    return
  }

  let ret = dfs(root)
  print(ret)
}

main()