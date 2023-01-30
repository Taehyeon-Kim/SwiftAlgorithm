import Foundation

var N = 0, M = 0

func rotateKey(_ key: [[Int]], _ angle: Int) -> [[Int]] {
    var newKey = key
    let n = key.count - 1
    
    for i in key.indices {
        for j in key.indices {
            if angle == 90 {
                newKey[i][j] = key[n - j][i]
            } else if angle == 180 {
                newKey[i][j] = key[abs(i-n)][abs(j-n)]
            } else if angle == 270 {
                newKey[i][j] = key[j][abs(i-n)]
            }
        }
    }
    
    return newKey
}

func getKey(_ key: [[Int]], _ point: (x: Int, y: Int)) -> [[Int]] {
    var expandedKeys = Array(repeating: Array(repeating: 0, count: 2*M + N), count: 2*M + N)
    for i in 0..<M {
        for j in 0..<M {
            expandedKeys[i + point.x][j + point.y] = key[i][j]
        }
    }
    return expandedKeys
}

func move(_ key: [[Int]], _ lock: [[Int]]) -> Bool {
    var expandedLock = [[Int]](repeating: [Int](repeating: 0, count: 3 * N), count: 3 * N)
    
    for i in 0..<N {
        for j in 0..<N {
            expandedLock[i+N][j+N] = lock[i][j]
        }
    }
    
    for i in (N-M+1)..<2*N {
        for j in (N-M+1)..<2*N {
            var tmpLock = expandedLock
            for row in 0..<M {
                for col in 0..<M {
                    tmpLock[i+row][j+col] += key[row][col]
                }
            }
            
            if isPossible(tmpLock) { return true }
        }
    }

    return false
}

func isPossible(_ lock: [[Int]]) -> Bool {
    for i in N..<2*N {
        for j in N..<2*N {
            if lock[i][j] != 1 {
                return false
            }
        }
    }
    return true
}


func solution(_ key:[[Int]], _ lock:[[Int]]) -> Bool {
    N = lock.count; M = key.count
    
    for angle in [0, 90, 180, 270] {
        let key = rotateKey(key, angle)
        if move(key, lock) { return true }
    }
    
    return false
}