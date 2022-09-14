import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
        
    let release = zip(progresses, speeds).map { ceil(Double(100 - $0) / Double($1)) }
    
    return release.reduce(([], 0)) { (tuple, day) -> ([Int], Double) in                      
        let (list, lastMax) = tuple
        // 꺼낼 요소가 있을 때, 배열에서 마지막 요소를 꺼낸다.
        guard let lastCount = list.last else {
            return ([1], day)
        }
        // lastMax는 최근에 들어간 것중 가장 큰 값을 저장한다.
        // 이후에 들어오는 값이 lastMax보다 작으면 count를 1 증가시킨다.
        // 더 큰 값이 나오면 큰 값을 넣는다.
        if lastMax >= day {
            return (list.dropLast() + [lastCount + 1], lastMax)
        }
        // 맨 처음의 경우 원소 추가 (배열이 비어있을 때)
        return (list + [1], day)
    }.0
}

assert(solution([93, 30, 55], [1, 30, 5]) == [2, 1], "❌ 테스트 케이스를 만족하지 못했어요")
assert(solution([95, 90, 99, 99, 80, 99], [1, 1, 1, 1, 1, 1]) == [1, 3, 2], "❌ 테스트 케이스를 만족하지 못했어요")