while let input = readLine() {
  let n = Int(input)!
  var ret = 1
  var cnt = 1
  
  while true {  
    if ret % n == 0 {
      print(cnt)
      break
    } else {
      ret = (ret * 10) + 1
      ret %= n
      cnt += 1
    }
  }
}