let nc = readLine()!.split{$0==" "}.compactMap{Int(String($0))}
let (n,c) = (nc[0],nc[1])
let arr = readLine()!.split{$0==" "}.compactMap{Int(String($0))}

var dict = [Int: [Int]]()
var num = 0

for (idx, a) in arr.enumerated() {
  var val = dict[a, default: [0, idx]]
  val[0] += 1
  dict[a, default: [0, idx]] = val
}

let ret = dict.sorted {
  if $0.value[0] == $1.value[0] {
    return $0.value[1] < $1.value[1]
  } else {
    return $0.value[0] > $1.value[0]
  }
}

for item in ret {
  for _ in 0..<item.value[0] {
    print(item.key, terminator: " ")
  }
}