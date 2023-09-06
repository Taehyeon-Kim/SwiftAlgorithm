import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M) = (input[0], input[1])
var childs = [[Int]](repeating: [], count: N + 1)  // 번호 id: id를 신뢰하는 번호들 id
var routes = Array(repeating: 0, count: N + 1)
var max = 0

for _ in 0..<M {
    let str = readLine()!.split(separator: " ").map { Int($0)! }
    childs[str[1]] += [str[0]]
}

for i in 1...N {
    var checked = [Bool](repeating: false, count: N + 1)
    var depth = 0
    dfs(i, &depth, &checked, &childs)
    max = depth > max ? depth: max
    routes[i] = depth
}

for i in 1...N where routes[i] == max {
    print("\(i) ", terminator: "")
}


func dfs(_ curr: Int, _ depth: inout Int, _ checked: inout [Bool], _ childs: inout [[Int]]) {
    checked[curr] = true
    depth += 1
    
    for c in childs[curr] {
        if !checked[c] {
            dfs(c, &depth, &checked, &childs)
        }
    }
}