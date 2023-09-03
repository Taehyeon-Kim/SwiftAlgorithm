while true {
  let input = readLine()!
  if input == "." { break }

  var stack = [Character]()
  var check = true

  for ch in input {
    if ch == "[" || ch == "(" {
      stack.append(ch)
    }

    else if ch == "]" {
      if stack.isEmpty || stack.last! == "(" {
        check = false
        break
      }
      else {
        _ = stack.removeLast()
      }
    }

    else if ch == ")" {
      if stack.isEmpty || stack.last! == "[" {
        check = false
        break
      }
      else {
        _ = stack.removeLast()
      }
    }
  }

  print(check && stack.isEmpty ? "yes" : "no")
}