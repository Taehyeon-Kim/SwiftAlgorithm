let input = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let (n, m) = (input[0], input[1])

var board = [[Int]]()
for _ in 0..<n{
    let line = readLine()!.split(separator: " ").compactMap{Int(String($0))}
    board.append(line)
}

let dx = [1,0,-1,0]
let dy = [0,1,0,-1]

var count = 0
var maxArea = 0

func bfs(_ i: Int, _ j: Int) -> Int {
    board[i][j] = 0
    var q = [(i,j)]
    var area = 1
        
    while !q.isEmpty {
        let (curX, curY) = q.removeFirst()
        for i in 0..<4 {
            let (nx, ny) = (curX + dx[i], curY + dy[i])
            if nx < 0 || nx >= n || ny < 0 || ny >= m { continue }
            if board[nx][ny] != 1 { continue }
            
            board[nx][ny] = 0
            q.append((nx, ny))
            area += 1
        }
    }

    return area
}

for i in 0..<n {
    for j in 0..<m {
        if board[i][j] == 1 {
          count += 1
          maxArea = max(maxArea, bfs(i,j))
        }
    }
}

print(count)
print(maxArea)