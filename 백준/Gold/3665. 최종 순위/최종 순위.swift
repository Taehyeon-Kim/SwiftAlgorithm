let tc = Int(readLine()!)!

for _ in 0..<tc {
  let n = Int(readLine()!)!

  var inDegree = Array(repeating: 0, count: n+1)
  var adj = Array(repeating: Array(repeating: false, count: n + 1), count: n + 1)
  let arr = readLine()!.split(separator: " ").compactMap{Int(String($0))}

  // 작년 순위 처리
  for i in 0..<(n-1) {
    for j in (i+1)..<n {
      adj[arr[i]][arr[j]] = true // 선행순서
      inDegree[arr[j]] += 1      // 진입차수
    }
  }

  // 올해
  let m = Int(readLine()!)!
  for _ in 0..<m {
    let ab = readLine()!.split(separator: " ").compactMap{Int(String($0))}
    let (a, b) = (ab[0], ab[1])

    if adj[a][b] {
      adj[a][b] = false
      adj[b][a] = true
      inDegree[b] -= 1
      inDegree[a] += 1
    } else {
      adj[b][a] = false
      adj[a][b] = true
      inDegree[a] -= 1
      inDegree[b] += 1
    }
  }

  var answer = [Int]() // 위상 정렬 결과 담을 배열
  var q = [Int]()      // 진입차수 0인 것들 넣을 배열

  for i in 1...n {
    if inDegree[i] == 0 {
      q.append(i)
    }
  }

  for _ in 0..<n {
    // Cycle
    if q.isEmpty {
      print("IMPOSSIBLE")
      break
    }

    // 2개 이상
    if q.count > 1 {
      print("?")
      break
    }

    let cur = q.removeFirst()
    answer.append(cur)

    for i in 1...n {
      if adj[cur][i] {
        inDegree[i] -= 1
        if inDegree[i] == 0 {
          q.append(i)
        }
      }
    }
  }

  if answer.count == n {
    print(answer.map{String($0)}.joined(separator: " "))
  }
}