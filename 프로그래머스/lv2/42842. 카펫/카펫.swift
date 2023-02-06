import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    let total = brown + yellow
    
    func divisor(_ n: Int) -> [(w: Int, h: Int)] {
        var tuple = [(Int, Int)]()
        for i in 1...n/2 where n % i == 0 {
            tuple.append((n/i, i))
        }
        return tuple
    }
    
    func border(_ w: Int, _ h: Int) -> Int {
        return w * 2 + h * 2 - 4
    }
    
    for (w, h) in divisor(total) {
        if border(w, h) == brown {
            return [w, h]
        }
    }
    
    return []
}