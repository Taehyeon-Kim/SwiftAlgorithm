import Foundation

// 이미 올바른 괄호 문자열인지 판단
func isRight(_ p: String) -> Bool {
    var stack = [String]()
    for ch in p.map {String($0)} {
        if stack.isEmpty { stack.append(ch); continue }
        
        if ch == "(" {
            stack.append(ch)
        } else {
            if stack.last! == "(" { stack.removeLast() }
            else { return false }
        }
    }
    return stack.isEmpty
}

// 균형 잡힌 문자열 인지 판단
func isBalanced(_ s: String) -> Bool {
    let s = s.map { String($0) }
    return s.filter { $0 == "("}.count == s.filter { $0 == ")"}.count
}

func reverse(_ u: String) -> String {
    return u.map { String($0) == ")" ? "(" : ")"}.joined()
}

func split(_ w: String) -> (u: String, v: String) {
    if w == "" { return ("", "") }
    
    var u = "", v = ""
    var arr = w.map { String($0 ) }
    var index = 0
    
    for (i, ch) in arr.enumerated() {
        u += ch
        
        if isBalanced(u) {
            index = i
            break 
        }
    }

    v = index == w.count - 1 ? "" : arr[(index+1)...].joined()
    return (u, v)
}

func rec(_ p: String) -> String {
    var result = ""
    var (u, v) = split(p)
    
    if p == "" { return "" }

    if isRight(u) {
        result = u + rec(v)
    } else {
        var str = "(" + rec(v) + ")"
        u.removeFirst()
        u.removeLast()
        return str + reverse(u)
    }

    return result
}

func solution(_ p:String) -> String {
    var p = p
    var answer = ""
    
    if isRight(p) { return p }
    answer = rec(p)
    return answer
}