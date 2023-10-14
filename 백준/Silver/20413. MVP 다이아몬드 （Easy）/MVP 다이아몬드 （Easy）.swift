let n = Int(readLine()!)!
let a = readLine()!.split{$0 == " "}.compactMap{Int(String($0))}
let grades = readLine()!.map{String($0)}
let info = ["B": 0, "S": 1, "G": 2, "P": 3, "D": 4]

var ans = [Int]()
for i in grades {
  let b = a[0] - 1 - (ans.last ?? 0)
  let s = a[1] - 1 - (ans.last ?? 0)
  let g = a[2] - 1 - (ans.last ?? 0)
  let p = a[3] - 1 - (ans.last ?? 0)
  let d = a[3]

  switch i {
    case "B":
      ans.append(b)
    case "S":
      ans.append(s)
    case "G":
      ans.append(g)
    case "P":
      ans.append(p)
    default:
      ans.append(d)
  }
}
print(ans.reduce(0,+))