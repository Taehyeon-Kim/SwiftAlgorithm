import Foundation

// 비교 메서드
func compare(_ target: String, _ banned: String) -> Bool {
    if target.count != banned.count { return false }
    
    for (i, j) in zip(target, banned) {
        if i == j || j == "*" { continue }
        if i != j { return false }
    }
    
    return true
}

// 순열
func permutation<T: Comparable>(_ target: [T], _ n: Int) -> [[T]] {
    var ret = [[T]]()
    var visited = [Bool](repeating: false, count: target.count)
    
    func recur(_ cur: [T]) {
        if cur.count == n { ret.append(cur); return }
        
        for i in 0..<target.count {
            if visited[i] { continue }
            
            visited[i] = true
            recur(cur + [target[i]])
            visited[i] = false
        }
    }
    recur([])
    return ret
}

func solution(_ user_id:[String], _ banned_id:[String]) -> Int {
    var answer = Set<Set<String>>()
    
    for users in permutation(user_id, banned_id.count) {
        var count = 0
        for (a, b) in zip(users, banned_id) {
            if compare(a, b) {
                count += 1
            }
        }
        
        if count == banned_id.count {
            answer.insert(Set(users))
        }
    }
    
    return answer.count
}