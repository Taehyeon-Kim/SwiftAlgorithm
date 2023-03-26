import Foundation

func makeFilename(_ filename: String) -> (head: String, number: Int, origin: String) {
    var letter = ""
    var number = ""
    
    for ch in filename {
        if ch.isNumber {
            number += String(ch)
        }
        
        // 공백도 포함시켜야 함
        else if ch.isLetter || [" ", ".", "-"].contains(ch) {
            if !number.isEmpty { break }
            letter += String(ch)
        }
    }
    
    return (letter.lowercased(), Int(number)!, filename)
}

func solution(_ files:[String]) -> [String] {
    var ret = [(head: String, number: Int, origin: String)]()
    
    // 1. Head, Number 추출
    for file in files {
        let filename = makeFilename(file)
        ret.append(filename)
    }

    // 2.정렬
    ret = ret.sorted {
        if $0.head == $1.head {
            return $0.number < $1.number
        } else {
            return $0.head < $1.head
        }
    }

    return ret.map { $0.origin }
}