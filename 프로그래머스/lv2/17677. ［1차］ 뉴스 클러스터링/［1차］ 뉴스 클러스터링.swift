import Foundation

// 12:10
// - 문제에 대한 이해
// - 자카드 유사도? 뭔지는 중요하지 않다. 어떤 식으로 유사도가 계산되는지만 확인하기

func isSmallAscii(_ char: Character) -> Bool {
    return Int(char.asciiValue!) >= 97 && Int(char.asciiValue!) <= 122
}

func cutting(_ str: String) -> [String] {
    var list = [String]()
    let string = Array(str)
    for i in 0..<string.count - 1 {
        var elem = ""
        if isSmallAscii(string[i]) && isSmallAscii(string[i+1]) {
            elem += String(string[i])
            elem += String(string[i+1])
            list.append(elem)
        }
    }
    return list
}

func makeSimilarity(_ list1: [String], _ list2: [String]) -> Double {
    let unionCount = list1.count + list2.count - countIntersection(list1, list2)
    let intersectionCount = countIntersection(list1, list2)
    
    return (unionCount == 0 && intersectionCount == 0) ? 65536 : Double(intersectionCount) / Double(unionCount) * 65536
}

func countIntersection(_ list1: [String], _ list2: [String]) -> Int {
    var count = 0
    var list2 = list2
    
    for elem in list1 {
        if list2.contains(elem) {
            count += 1
            let index = list2.firstIndex(of: elem)!
            list2.remove(at: index)
        }
    }
    return count
}

func solution(_ str1:String, _ str2:String) -> Int {
    let list1 = cutting(str1.lowercased())
    let list2 = cutting(str2.lowercased())

    return Int(makeSimilarity(list1, list2))
}