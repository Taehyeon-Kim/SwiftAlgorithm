// bfs로 접근
// 레버를 무조건 거쳐야 하기 때문에
// 입구에서 레버까지의 이동 시간 + 레버에서 출구까지의 이동 시간을 나누어 계산했음

func solution(_ maps:[String]) -> Int {
    
    // 2차원 배열로 변환
    var board = [[String]]()
    for map in maps {
        board.append(map.map{String($0)})
    }

    // 좌표 초기화
    var (start, lever, end) = ((-1, -1), (-1, -1), (-1, -1))
    let (r, c) = (board.count, board[0].count)
    
    for i in 0..<r {
        for j in 0..<c {
            if board[i][j] == "S" { start = (i, j) }
            if board[i][j] == "L" { lever = (i, j) }
            if board[i][j] == "E" { end = (i, j) }
        }
    }

    // bfs
    // start: 시작 지점 / goal: 목표 지점
    func bfs(_ start: (Int, Int), _ goal: (Int, Int)) -> Int {
        var dist = [[Int]](repeating: [Int](repeating: 0, count: c), count: r)          // 거리 == 최소 시간
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: c), count: r) // 방문 여부 체크 배열
        
        // 좌표
        let dx = [-1,1,0,0]
        let dy = [0,0,-1,1]
   
        // 큐 처리
        var q = [start]
        var idx = 0
        visited[start.0][start.1] = true
        
        while q.count > idx {
            let cur = q[idx]
            idx += 1
            
            for i in 0..<4 {
                let (nx, ny) = (cur.0 + dx[i], cur.1 + dy[i])       // nxt 좌표
                
                if !((0..<r) ~= nx && (0..<c) ~= ny) { continue }   // 범위 바깥
                if board[nx][ny] == "X" { continue }                // 벽
                if visited[nx][ny] { continue }                     // 방문여부 체크
                
                q.append((nx, ny))
                visited[nx][ny] = true
                dist[nx][ny] = dist[cur.0][cur.1] + 1
                
                // 목표 지점 도달했으면 return
                if nx == goal.0 && ny == goal.1 {
                    return dist[nx][ny]
                }
            }
        }
        
        // 갈 수 없으면 -1 return
        return -1
    }
    
    if [bfs(start, lever), bfs(lever, end)].contains(-1) { return -1 }
    return bfs(start, lever) + bfs(lever, end)
}