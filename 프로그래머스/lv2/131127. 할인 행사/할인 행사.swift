import Foundation

/*
chicken: 1
apple: 2,3,6
banana: 4,8,12,14
rice: 5,10
pork: 7,9
pot: 11
*/

func solution(_ want:[String], _ number:[Int], _ discount:[String]) -> Int {

    // 시작 인덱스, 끝 인덱스
    var (st, en) = (0, 9)
    var cnt = 0

    while true {
        if en == discount.count { break }
        
        var flag = true
        var dict = [String: Int]()
        for i in st...en {
            dict[discount[i], default: 0] += 1
        }

        for (idx, w) in want.enumerated() {
            if let value = dict[w] {
                if value != number[idx] {
                    flag = false
                    break
                }
            } else {
                flag = false
                break
            }
        }
        
        if flag {
            cnt += 1
        }
        
        st += 1
        en += 1
    }

    return cnt
}