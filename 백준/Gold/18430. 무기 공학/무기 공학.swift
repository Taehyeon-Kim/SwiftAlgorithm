func input() -> (n: Int, m: Int, wood: [[Int]]) {
  let input = readLine()!.split(separator: " ").compactMap{Int(String($0))}
  let (n, m) = (input[0], input[1])

  var wood = [[Int]](repeating: [Int](), count: 5)
  for i in 0..<n {
    let line = readLine()!.split(separator: " ").compactMap{Int(String($0))}
    wood[i].append(contentsOf: line)
  }
  return (n, m, wood)
}

func solution() {
  let (n, m, wood) = input()
  var ans = 0
  var visited = [[Bool]](repeating: [Bool](repeating: false, count: 5), count: 5)

  func topLeft(_ x: Int, _ y: Int) -> Int {
    return 2 * wood[x][y] + wood[x][y+1] + wood[x+1][y]
  }
  
  func topRight(_ x: Int, _ y: Int) -> Int {
    return 2 * wood[x][y] + wood[x][y-1] + wood[x+1][y]
  }
  
  func bottomLeft(_ x: Int, _ y: Int) -> Int {
    return 2 * wood[x][y] + wood[x-1][y] + wood[x][y+1]
  }
  
  func bottomRight(_ x: Int, _ y: Int) -> Int {
    return 2 * wood[x][y] + wood[x][y-1] + wood[x-1][y]
  }
  
  func dfs(_ x: Int, _ y: Int, _ power: Int) {
    // 우측까지 모두 이동한 경우
    // 아래로 이동
    var x = x
    var y = y
    
    if y == m {
      x += 1
      y = 0
    }
  
    // base condition
    if x == n {
      ans = max(ans, power)
      return
    }

    if !visited[x][y] {
      /// top left
      if y+1 < m && x+1 < n && !visited[x][y+1] && !visited[x+1][y] {
        visited[x][y] = true
        visited[x][y+1] = true
        visited[x+1][y] = true
        dfs(x, y+1, power + topLeft(x, y))
        visited[x][y] = false
        visited[x][y+1] = false
        visited[x+1][y] = false
      }

      /// top right
      if y-1 >= 0 && x+1 < n && !visited[x][y-1] && !visited[x+1][y] {
        visited[x][y] = true
        visited[x][y-1] = true
        visited[x+1][y] = true
        dfs(x, y+1, power + topRight(x, y))
        visited[x][y] = false
        visited[x][y-1] = false
        visited[x+1][y] = false
      }

      /// bottom left
      if y+1 < m && x-1 >= 0 && !visited[x][y+1] && !visited[x-1][y] {
        visited[x][y] = true
        visited[x][y+1] = true
        visited[x-1][y] = true
        dfs(x, y+1, power + bottomLeft(x, y))
        visited[x][y] = false
        visited[x][y+1] = false
        visited[x-1][y] = false
      }

      /// bottom right
      if y-1 >= 0 && x-1 >= 0 && !visited[x][y-1] && !visited[x-1][y] {
        visited[x][y] = true
        visited[x][y-1] = true
        visited[x-1][y] = true
        dfs(x, y+1, power + bottomRight(x, y))
        visited[x][y] = false
        visited[x][y-1] = false
        visited[x-1][y] = false
      }
    }

    dfs(x, y+1, power)
  }

  dfs(0,0,0)
  print(ans)
}

solution()