import Foundation

func makeBoard(_ rows: Int, _ cols: Int) -> [[Int]] {
    var count = 0
    var arr = Array(repeating: Array(repeating: 0, count: cols), count: rows)
    
    for i in 0..<rows {
        for j in 0..<cols {
            count += 1
            arr[i][j] = count
        }
    }
    
    return arr
}

@frozen
enum Position {
    case top, bottom, left, right
}

func getPoint(_ board: [[Int]], query: [Int]) -> (Int, [[Int]]) {
    var board = board
    
    // query
    let fromX = query[0] - 1, fromY = query[1] - 1
    let toX = query[2] - 1, toY = query[3] - 1

    // 꼭짓점
    let topL = board[fromX][fromY], topR = board[fromX][toY]
    let botL = board[toX][fromY], botR = board[toX][toY]
    
    var pos: Position = .right
    
    var curX = fromX
    var curY = fromY
    var curVal = board[curX][curY]  // 8
    var nextVal = board[curX][curY]
    
    var totalCount = (toX - fromX) * 2 + (toY - fromY) * 2
    var count = 0
    var minVal = curVal
    
    while count != totalCount {
        count += 1
        minVal = min(minVal, curVal)
        // print(minVal)
        
        switch pos {
        case .right:
            curY += 1
            
            if curY == toY {
                pos = .bottom
            }

            nextVal = board[curX][curY]
            board[curX][curY] = curVal
            curVal = nextVal
        
        case .bottom:
            curX += 1
            
            if curX == toX {
                pos = .left
            }

            nextVal = board[curX][curY]
            board[curX][curY] = curVal
            curVal = nextVal

        case .left:
            curY -= 1
            
            if curY == fromY {
                pos = .top
            }

            nextVal = board[curX][curY]
            board[curX][curY] = curVal
            curVal = nextVal

        case .top:
            curX -= 1

            if curX == fromX {
                board[curX][curY] = nextVal
                break
            }

            nextVal = board[curX][curY]
            board[curX][curY] = curVal
            curVal = nextVal
        }
    }

    return (minVal, board)
}

func solution(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
    var answer = [Int]()
    
    var board = makeBoard(rows, columns)
    var min = 0
    
    for query in queries {
        (min, board) = getPoint(board, query: query)
        answer.append(min)
    }
    
    return answer
}