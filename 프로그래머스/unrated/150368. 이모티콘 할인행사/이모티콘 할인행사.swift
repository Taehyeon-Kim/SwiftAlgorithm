import Foundation

/*
/// 시작전에 주석을 좀 더 자세하게 적어놓아도 좋을 것 같다.

문제
1. 이모티콘 플러스 서비스 가입자를 최대한 늘리는 것.
2. 이모티콘 판매액을 최대한 늘리는 것.
- 1번 목표가 우선이며, 2번 목표가 그 다음입니다.

조건
- 이모티콘마다 할인율은 다를 수 있으며, 할인율은 10%, 20%, 30%, 40% 중 하나로 설정됩니다.
- 1 ≤ emoticons의 길이 = m ≤ 7

할인율의 조합은 다음과 같이 된다.
10 10 10 10
10 10 10 20
10 10 10 30
...
40 40 40 40

- 이모티콘의 길이가 작기 때문에 4^7 = 2^14 = 약 16000가지로 연산 횟수도 적은편이다.

단계
1. 할인율의 조합을 구한다. -> 재귀 / 중복순열
2. 할인율의 조합을 구한 시점에서 계산을 시작한다.
    - user 배열을 돌면서 조건에 부합하는 이모티콘을 구매한다.
    - users의 원소는 [비율, 가격]의 형태
    - 비율% 이상의 할인이 있는 이모티콘을 모두 구매한다는 의미
    - 가격 이상의 돈을 이모티콘 구매에 사용한다면, 이모티콘 구매를 모두 취소하고 이모티콘 플러스 서비스에 가입한다는 의미

결과
- 답은 도출했으나, 코드 작성하는데 시간이 어느정도 소요됨
- 빠르고 정확하게 코드 쓰는 연습이 필요함
*/

func solution(_ users:[[Int]], _ emoticons:[Int]) -> [Int] {
    
    var cases = [[Int]]()
    var rates = [[Int]]() // 할인율 조합
    
    // 할인율 경우의 수 구하기
    func recur(_ discounts: [Int], _ idx: Int) {
        // 종료 조건
        if idx == emoticons.count {
            rates.append(discounts)
            return
        }
        
        for rate in [10, 20, 30, 40] {
            recur(discounts + [rate], idx + 1)
        }
    }
    
    recur([], 0)

    // 계산 로직
    for rate in rates {
        // rate : [10,20,30,40]
        var ret = [0, 0]
        
        // 사용자별로 체크
        for user in users {
            // user : [40, 10000]
            let (limit, price) = (user[0], user[1])
            var pays = 0
            
            /*
            각 사용자들은 자신의 기준에 따라 일정 비율 이상 할인하는 이모티콘을 모두 구매합니다.
            */
            for (idx, emoticon) in emoticons.enumerated() {
                if limit <= rate[idx] {
                    pays += Int(Double(emoticon * (100 - rate[idx])) / 100.0)
                }
            }
            
            /*
            각 사용자들은 자신의 기준에 따라 이모티콘 구매 비용의 합이 일정 가격 이상이 된다면, 
            이모티콘 구매를 모두 취소하고 이모티콘 플러스 서비스에 가입합니다.
            */
            if pays >= price {
                ret[0] += 1
                pays = 0
            }
            ret[1] += pays
        }
        
        cases.append(ret)
    }
    
    // 힙 사용하면 정렬 과정이 따로 필요 없음
    cases = cases.sorted {
        if $0[0] == $1[0] { return $0[1] > $1[1] }
        return $0[0] > $1[0] 
    }
    return cases.first!
}