import Foundation

// 탈락하는 경우
// 1. 이미 말한 단어 말하는 경우
// 2. 끝말잇기 조건에 부합하지 않는 경우

func solution(_ n:Int, _ words:[String]) -> [Int] {
    
    var sets = Set<String>()
    var answer = [Int]()
    
    var lastWord = words.first!
    sets.insert(lastWord)
    
    for i in stride(from: 1, to: words.count, by: 1) {
        let last = lastWord.map { String($0) }
        let cur = words[i].map { String($0) }
       
        if sets.contains(cur.joined()) {
            return [i%n + 1, i/n + 1]
        }
        else if last[last.endIndex - 1] != cur[0] {
            return [i%n + 1, i/n + 1]
        }
        else if last[last.endIndex - 1] == cur[0] { 
            lastWord = cur.joined()
            sets.insert(lastWord)
        }
    }

    return sets.count == words.count ? [0, 0] : [(words.count - 1)%n + 1, (words.count - 1)/n + 1]
}