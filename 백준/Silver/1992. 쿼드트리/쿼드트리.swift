let n = Int(readLine()!)!
var a = [[String]]()
for _ in 0..<n {
  a.append(readLine()!.map{String($0)})
}

func go(_ x: Int, _ y: Int, _ size: Int) -> String {
  let b = a[x][y]
  
  if size == 1 {
    return b
  }

  var ret = ""
  for i in x..<x+size {
    for j in y..<y+size {
      if b != a[i][j] {
        ret += "("
        ret += go(x, y, size/2)
        ret += go(x, y+size/2, size/2)
        ret += go(x+size/2, y, size/2)
        ret += go(x+size/2, y+size/2, size/2)
        ret += ")"
        return ret
      }
    }
  }

  return b
}

print(go(0, 0, n))