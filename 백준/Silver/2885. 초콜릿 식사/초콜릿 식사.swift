var n = Int(readLine()!)!
var size = 1

while size < n {
  size = size << 1
}

let tmp = size
var cnt = 0

while n > 0 {
  if n >= size {
    n -= size
  } else {
    size /= 2
    cnt += 1
  }
}

print(tmp, cnt)