import Foundation

/*
구현
1. discount를 10개인 구간으로 잘라서 계속 탐색한다.
2. 구간 안에서 want: number를 만족하는지 체크한다. -> 딕셔너리 이용
3. 조건에 부합하면 개수 증가를 시켜준다.
*/

func solution(_ want:[String], _ number:[Int], _ discount:[String]) -> Int {

    // 시작 인덱스, 끝 인덱스
    var (st, en) = (0, 9)
    var dict = [String: Int]() // 딕셔너리
    var cnt = 0 // 정답 개수
    
    // 최초 딕셔너리 초기화
    for i in st...en {
        let key = discount[i]
        dict[key, default: 0] += 1
    }

    while true {
        // 조건에 부합하는지 체크
        var isSame = true
        for (idx, item) in want.enumerated() {
            if dict[item, default: 0] == number[idx] { continue }
            isSame = false; break
        }
        
        // 정답 카운트
        if isSame { cnt += 1 }
        
        // 슬라이딩 윈도우 방식으로 연산 최적화
        (st, en) = (st + 1, en + 1)
        if en == discount.count { break }
        dict[discount[st - 1], default: 0] -= 1
        dict[discount[en], default: 0] += 1
    }

    return cnt
}