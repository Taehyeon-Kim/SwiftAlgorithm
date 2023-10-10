let k = Int(readLine()!)!
let a = readLine()!.split{$0==" "}.compactMap{Int(String($0))}

var dict = [Int:[Int]]()

func dfs(_ s: Int, _ e: Int, _ lv: Int) {
  if s == e {
    // 종료
    dict[lv, default: []].append(s)
    return
  }

  let root = (s+e)/2
  dict[lv, default: []].append(root)

  dfs(s,root-1,lv+1)  // left
  dfs(root+1,e,lv+1) // right
}

dfs(0, a.count-1, 0)

let newDict = dict.sorted { $0.key < $1.key }
for (_, v) in newDict {
  for i in v {
    print(a[i], terminator: " ")
  }
  print()
}