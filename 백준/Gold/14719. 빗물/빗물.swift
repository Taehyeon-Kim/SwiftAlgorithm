let hw = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let (h, w) = (hw[0], hw[1])
let blocks = readLine()!.split(separator: " ").compactMap{Int(String($0))}

var ans = 0
for i in 1...w-1 {
  let wall = min(blocks[...i].max() ?? 0 , blocks[(i+1)...].max() ?? 0)
    if blocks[i] < wall {
        ans += wall - blocks[i]
    }
}

print(ans)