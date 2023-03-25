func solution(_ msg:String) -> [Int] {
    
    // 단어
    var words: [String: [String]] = [:]
    
    // 길이가 1인 단어 사전 초기화
    var alphabets = [
        "A","B","C","D","E","F","G","H","I","J","K","L","M","N",
        "O","P","Q","R","S","T","U","V","W","X","Y","Z"
    ]
    for alphabet in alphabets {
        words[alphabet, default: []].append(alphabet)
    }
    
    let msg = msg.map({String($0)})
    var idx = 0
    
    // 답
    var ret = [Int]()
    
    while idx < msg.count {
        let alphabet = msg[idx]
        var w = ""
        // 사전에 들어있는 글자 찾을 때까지 반복
        for i in stride(from: idx, to: msg.count, by: 1) {
            if words[alphabet]!.contains(w + msg[i]) {
                w += msg[i]
                idx = i
            } else {
                break
            }
        }
                
        let output = alphabets.enumerated().first(where: { $0.element == w })
        ret.append(output!.offset + 1)
        
        if idx == msg.count - 1 { break }
        
        let c = msg[idx + 1]
        let wc = w+c
        
        words[alphabet, default: []].append(wc)
        alphabets.append(wc)
        words[alphabet]!.sort(by:{$0.count > $1.count})
        
        idx += 1
    }

    return ret
}