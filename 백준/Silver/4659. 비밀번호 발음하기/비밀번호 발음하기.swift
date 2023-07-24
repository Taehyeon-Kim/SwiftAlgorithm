func aeiou(_ str: String) -> Bool {
  return str.contains("a") ||
  str.contains("e") ||
  str.contains("i") ||
  str.contains("o") ||
  str.contains("u")
}

func isContinuous(_ str: String) -> Bool {
  var (jcnt, mcnt) = (0,0)

  for ch in str {
    if jcnt >= 3 || mcnt >= 3 { return true }
    
    if ["a", "e", "i", "o", "u"].contains(ch) {
      mcnt += 1
      jcnt = 0
    } else {
      jcnt += 1
      mcnt = 0
    }
  }
  
  return jcnt >= 3 || mcnt >= 3
}

func same(_ str: String) -> Bool {
  let str = str.map{String($0)}
  var string = str[0]
  
  for i in 1..<str.count {
    if str[i] == str[i-1] {
      string += str[i]
    } else {
      string = str[i]
    }
    if string.count >= 2 && string != "ee" && string != "oo" {
      return true
    }
  }

  return false
}

while let str = readLine() {
  if str == "end" { break }

  var flag = true

  if !aeiou(str) {
    flag = false
  }

  if isContinuous(str) {
    flag = false
  }

  if same(str) {
    flag = false
  }

  let result = flag ? "acceptable." : "not acceptable."
  print("<\(str)> is", result)
}