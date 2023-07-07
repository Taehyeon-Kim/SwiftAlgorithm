let n = Int(readLine()!)!
let pat = readLine()!.split { $0 == "*" }.map{String($0)}
var a = [String]()
for _ in 0..<n {
  a.append(readLine()!)
}

for w in a {
  if String(w.prefix(pat[0].count)) == pat[0] && String(w.suffix(pat[1].count)) == pat[1] {
    if pat[0].count + pat[1].count > w.count {
      print("NE")
    } else {
      print("DA")  
    }
  } else {
    print("NE")
  }
}