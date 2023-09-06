let n = Int(readLine()!)!
let a = readLine()!.split{$0 == " "}.compactMap{Int(String($0))}
var ret = [Int](repeating: -1, count: n)
var stack = [Int]()

for i in 0..<n {
  while !stack.isEmpty && a[stack.last!] < a[i] {
    ret[stack.last!] = a[i]
    _ = stack.removeLast()
  }
  stack.append(i)
}

print(ret.map{String($0)}.joined(separator: " "))