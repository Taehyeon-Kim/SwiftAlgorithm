import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    
    // hit / hot
    // hot / dot lot
    // dot / dog lot
    // lot / dot log 
    // dog / log dot cog
    
    func canChange(from word: String, to target: String) -> Bool {
        var diff = 0
        for (s1, s2) in zip(word, target) {
            if s1 != s2 { diff += 1 }
        }
        return diff == 1
    }
    
    func bfs() -> Int {
        var q = [[begin, 0]]
        
        if !words.contains(target) { return 0 }
        
        while !q.isEmpty {
            let elem = q.removeFirst()
            let w = elem[0] as! String, c = elem[1] as! Int
            
            for word in words {
                if canChange(from: w, to: word) {
                    if word == target { return c + 1 }
                    else { q.append([word, c + 1]) }
                }
            }
        }
        
        return 0
    }

    return bfs()
}