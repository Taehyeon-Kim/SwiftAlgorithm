let array = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let (f,s,g,u,d) = (array[0], array[1], array[2], array[3], array[4])

var dists = Array(repeating: -1, count: f+1)

func bfs() {
  var q = [s]
  var idx = 0

  dists[0] = 0
  dists[s] = 0

  while q.count > idx {
    let cur = q[idx]
    idx += 1

    if cur == g { break }
    
    let (up, down) = (cur + u, cur - d)

    if (1...f) ~= up && dists[up] == -1 {
      q.append(up)
      dists[up] = dists[cur] + 1
    }

    if (1...f) ~= down && dists[down] == -1 {
      q.append(down)
      dists[down] = dists[cur] + 1
    }
  }
}

bfs()

if dists[g] != -1 {
  print(dists[g])
} else {
  print("use the stairs")
}