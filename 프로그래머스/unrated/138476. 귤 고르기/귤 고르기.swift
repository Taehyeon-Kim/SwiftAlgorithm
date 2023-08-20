import Foundation

// 카운트 -> 맵, 딕셔너리
// 빼야 하는 개수 -> 남은 게 적은 것부터 제거하면 됨

func solution(_ k:Int, _ tangerine:[Int]) -> Int {
    var removeCnt = tangerine.count - k
    var dict = [Int: Int]()
    for t in tangerine {
        dict[t, default: 0] += 1
    }

    var ans = dict.count
    let sortedDict = dict.sorted { $0.value < $1.value }
    
    for (key, value) in sortedDict {
        if removeCnt <= 0 { break }
        
        if value <= removeCnt {
            removeCnt -= value
            ans -= 1
        } else {
            break
        }
    }
    
    return ans
}