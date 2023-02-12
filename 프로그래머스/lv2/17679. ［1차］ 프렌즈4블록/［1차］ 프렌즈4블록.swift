func debug(_ board: [[String]]) {
    for row in board.indices {
        for col in board[row] {
            print(col, terminator: " ")       
        }
        print()
    }
}

func makeBoard(_ board: [String]) -> [[String]] {
    return board.map {
        return $0.map { String($0) }
    }
}

// let leftTop = [(-1,-1),(-1,0),(-1,1)]
// let rightTop = [(-1,0),(-1,1),(0,1)]
// let leftBot = [(0,-1),(1,-1),(1,0)]
let rightBot = [(0,1),(1,0),(1,1)]

struct Pair: Hashable {
    let x: Int
    let y: Int
    
    static func == (lhs: Pair, rhs: Pair) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }
}

// 삭제 가능한 좌표 모음 ... 블록 한 점을 기준으로 9개의 영역을 탐색하면 됨.
func search(_ point: (x: Int, y: Int), _ board: [[String]], _ range: [(Int, Int)]) -> Set<Pair> {
    // 탐색 범위 4군데
    var sets = Set<Pair>()
    let curBlock = board[point.x][point.y]

    for (x, y) in range {
        let (nx, ny) = (point.x + x, point.y + y)
        
        if (0 > nx || nx >= board.count) || (0 > ny || ny >= board[0].count) { 
            return sets 
        }
        
        if curBlock == board[nx][ny] {
            sets.insert(Pair(x: nx, y: ny))
        } else {
            sets.removeAll()
        }
    }
    
    if !sets.isEmpty { sets.insert(Pair(x: point.x, y: point.y)) }
    return sets.count == 4 ? sets : Set<Pair>()
}

var count = 0

func bfs(_ board: [[String]]) -> [[String]] {
    var sets = Set<Pair>()
    for row in board.indices {
        for col in board[0].indices {
            let (x, y) = (row, col)
            if board[x][y] == " " { continue }
            let s1 = search((x, y), board, rightBot)
            if s1.count == 4 {
                sets = sets.union(s1)
            }
        }
    }
    return remove(sets, board)
}

func remove(_ sets: Set<Pair>, _ board: [[String]]) -> [[String]] {
    var board = board
    for pair in sets {
        board[pair.x][pair.y] = " "
    }
    return replace(board)
}

func replace(_ board: [[String]]) -> [[String]] {
    var board = board
    var ret = [[String]]()
    let (rows, cols) = (board.count, board[0].count)
    
    for col in board[0].indices {
        var str = ""
        for row in board.indices where board[row][col] != " " {
            str += board[row][col] 
        }
        
        str = str.count < rows ? String(repeating: " ", count: rows - str.count) + str : str
        ret.append(str.map {String($0)})
    }
    
    for col in ret.indices {
        for row in ret[0].indices {
            board[row][col] = ret[col][row]
        }
    }
    
    return board
}

func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    var board = makeBoard(board)
    board = bfs(board)
    board = bfs(board)
    
    while true {
        let bd = bfs(board)
        if board == bd { break }
        board = bd
    }
    
    return board.flatMap { $0 }.filter { $0 == " " }.count
}