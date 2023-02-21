var arr = readLine()!.split(separator: " ").compactMap{Int(String($0))}
var d = Array(repeating: Array(repeating: Array(repeating: -1, count: 100_000), count: 5), count: 5)

let power = [
    [1, 2, 2, 2, 2],
    [2, 1, 3, 4, 3],
    [2, 3, 1, 3, 4],
    [2, 4, 3, 1, 3],
    [2, 3, 4, 3, 1]
]

func dfs(_ left: Int, _ right: Int, _ idx: Int) -> Int {
  if idx == arr.count - 1 { 
    return 0 
  }

  if d[left][right][idx] != -1 { 
    return d[left][right][idx] 
  }

  d[left][right][idx] = min(dfs(arr[idx], right, idx + 1) + power[left][arr[idx]],
                           dfs(left, arr[idx], idx + 1) + power[right][arr[idx]])
  return d[left][right][idx]
}

print(dfs(0, 0, 0))