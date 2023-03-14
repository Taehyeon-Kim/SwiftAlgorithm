let t = Int(readLine()!)!

for _ in 0..<t {
  let n = Int(readLine()!)!
  var arr = [String]()
  var ans = "YES"
  
  for _ in 0..<n {
    let number = readLine()!
    arr.append(number)
  }

  arr.sort()

  for i in 0..<arr.count - 1 {
      if arr[i+1].hasPrefix(arr[i]) {
          ans = "NO"
          break
      }
  }
  print(ans)
}