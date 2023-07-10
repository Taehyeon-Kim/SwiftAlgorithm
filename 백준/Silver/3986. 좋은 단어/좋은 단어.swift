let n = Int(readLine()!)!
var cnt = 0
for _ in 0..<n {
  let str = readLine()!.map{String($0)}
  var stack = [String]()
  for s in str {
    if stack.isEmpty { stack.append(s) }
    else {
      if stack.last! == s { _ = stack.popLast()! }
      else { stack.append(s) }
    }
  }
  if stack.isEmpty { cnt += 1 }
}
print(cnt)