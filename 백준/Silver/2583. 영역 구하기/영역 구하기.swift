let mnk = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let (m,n,k) = (mnk[0], mnk[1], mnk[2])

var board = Array(repeating: Array(repeating: 0, count: n), count: m)
var visited = Array(repeating: Array(repeating: false, count: n), count: m)

for _ in 0..<k {
    let line = readLine()!.split(separator: " ").compactMap{Int(String($0))}
    let (fromX, fromY) = (line[1], line[0])
    let (toX, toY) = (line[3], line[2])
    
    for i in stride(from: fromX, to: toX, by: 1) {
        for j in stride(from: fromY, to: toY, by: 1) {
            board[i][j] = 1
        }
    }
}

func bfs(_ sx: Int, _ sy: Int) -> Int {
    var q = [(sx, sy)]
    var idx = 0
    visited[sx][sy] = true
    
    var count = 1
    let dx = [1,-1,0,0]
    let dy = [0,0,1,-1]
    
    while q.count > idx {
        let (cx, cy) = q[idx]
        idx += 1
        
        for i in 0..<4 {
            let (nx, ny) = (cx+dx[i], cy+dy[i])
            
            if (0..<m) ~= nx && (0..<n) ~= ny && !visited[nx][ny] && board[nx][ny] == 0 {
                q.append((nx, ny))
                visited[nx][ny] = true
                count += 1
            }
        }
    }
    
    return count
}

var ret = [Int]()
for i in 0..<m {
    for j in 0..<n {
        if board[i][j] == 0 && !visited[i][j] {
            ret.append(bfs(i, j))
        }
    }
}

print(ret.count)
print(ret.sorted().map{String($0)}.joined(separator: " "))