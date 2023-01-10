import Foundation

func solution(_ w:Int, _ h:Int) -> Int64{
    var answer: Int64 = 0
    var pointY = 0
    
    let slope = abs(Double(h)/Double(w))
    
    for x in 1...w {
        for y in pointY...h {
            if slope * Double(x) <= Double(y) {
                answer += Int64(h - y)
                pointY = y
                break
            }
        }
    }
    
    return answer * 2
}