let n = Int(readLine()!)!

func input() -> (board: [[Int]], n: Int, m: Int) {
    let line = readLine()!.split(separator: " ").compactMap{Int(String($0))}
    let (row, col, cab) = (line[0], line[1], line[2])
    var board = Array(repeating: Array(repeating: 0, count: col), count: row)
    for _ in 0..<cab {
        let pos = readLine()!.split(separator: " ").compactMap{Int(String($0))}
        let (x, y) = (pos[0], pos[1])
        board[x][y] = 1
    }
    return (board, row, col)
}

// paramter sx, sy = 시작 좌표
// return = 영역 개수
func solution(_ board: [[Int]], _ row: Int, _ col: Int) -> Int {
    var board = board
    var cnt = 0
    
    func bfs(_ sx: Int, _ sy: Int) {
        board[sx][sy] = 0
        var q = [(sx, sy)]
        var idx = 0
        
        let dx = [1,-1,0,0]
        let dy = [0,0,1,-1]
        
        while q.count > idx {
            let (cx, cy) = q[idx]
            idx += 1
            
            for i in 0..<4 {
                let nx = cx + dx[i]
                let ny = cy + dy[i]
                
                if (0..<row) ~= nx && (0..<col) ~= ny && board[nx][ny] == 1 {
                    board[nx][ny] = 0
                    q.append((nx,ny))
                }
            }
        }
    }
    
    for i in 0..<row {
        for j in 0..<col {
            if board[i][j] == 1 {
                bfs(i, j)
                cnt += 1
            }
        }
    }
    
    return cnt
}

for _ in 0..<n {
    let (board, row, col) = input()
    print(solution(board, row, col))
}