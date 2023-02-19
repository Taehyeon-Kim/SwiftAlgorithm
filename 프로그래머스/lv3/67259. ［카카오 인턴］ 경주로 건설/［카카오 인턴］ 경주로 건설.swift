import Foundation

func solution(_ board:[[Int]]) -> Int {
    
    var costs = Array(repeating: [Int](repeating: Int.max, count: board.count), count: board.count)
    let dx = [-1, 0, 1, 0]
    let dy = [0, 1, 0, -1]

    func dfs(_ x: Int, _ y: Int, _ cost: Int, _ dir: Int) {
        
        if costs[x][y] < cost || board[x][y] == 1 { return }
        costs[x][y] = cost
        
        for i in 0..<4 {
            let (nx, ny) = (x + dx[i], y + dy[i])
            
            if (0..<board.count) ~= nx && (0..<board.count) ~= ny {
                if dir == i {
                    dfs(nx, ny, cost + 100, i)
                } else {
                    dfs(nx, ny, cost + 600, i)
                }
            }
        }
    }
    
    costs[0][0] = 0
    
    dfs(0, 0, 0, 1) // 하
    dfs(0, 0, 0, 2) // 우
    
    return costs[board.count - 1][board.count - 1]
}