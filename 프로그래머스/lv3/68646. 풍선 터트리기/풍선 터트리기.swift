import Foundation

/*
풍선들을 단 1개만 남을 때까지 계속 터트리려고 합니다.
1. 임의의 인접한 두 풍선을 고른 뒤, 두 풍선 중 하나를 터트립니다.
2. 터진 풍선으로 인해 풍선들 사이에 빈 공간이 생겼다면, 빈 공간이 없도록 풍선들을 중앙으로 밀착시킵니다.

인접한 두 풍선 중에서 번호가 더 작은 풍선을 터트리는 행위는 최대 1번만 할 수 있습니다.
어떤 시점에서 인접한 두 풍선 중 번호가 더 작은 풍선을 터트렸다면, 그 이후에는 인접한 두 풍선을 고른 뒤 번호가 더 큰 풍선만을 터트릴 수 있습니다.

어떤 풍선은 최후까지 남을 수도 있지만, 어떤 풍선은 무슨 수를 쓰더라도 마지막까지 남기는 것이 불가능할 수도 있습니다.

모든 경우의 수 체크? 
-> 2 * for loop만 해도 시간 초과
-> 한 번 순회로 체크가 가능하다면?

(1. 숫자를 하나씩 관찰하면서 대략적으로 이 솔루션을 떠올림)
타겟 넘버를 기준으로 좌우 영역의 최솟값을 구해서 비교를 해야 하는데,
매순간 min() 메소드를 이용해서 계산하는 것은 시간 초과가 발생할 수 밖에 없음

최솟값을 구하는 부분에서 시간을 절약해야 함(2. 이 부분 생각해내기가 조금 어려웠음)
-> a 배열을 왼쪽 ~ 오른쪽으로 순회할 때 최솟값을 갱신해가면서 값을 가지고 있는 것이 시간을 아낄 수 있는 방법
-> 테이블을 두어서 관리하는 방법을 생각해볼 수 있다.
*/

func solution(_ a:[Int]) -> Int {
    
    // 왼쪽 영역의 최솟값 테이블
    var leftTable = [Int](repeating: 0, count: a.count)
    leftTable[0] = a.first!
    
    // 왼쪽 테이블에 최솟값 채워넣는 로직
    for i in stride(from: 1, to: a.count, by: 1) {
        leftTable[i] = min(leftTable[i-1], a[i-1])
    }
    
    // 배열을 뒤집은 다음에 계산하기 위함
    let reversed = a.reversed().map{$0}
    
    // 오른쪽 영역의 최솟값 테이블
    var rightTable = [Int](repeating: 0, count: a.count)
    rightTable[0] = reversed.first!
    
    // 오른쪽 테이블에 최솟값 채워넣는 로직
    for i in stride(from: 1, to: a.count, by: 1) {
        rightTable[i] = min(rightTable[i-1], reversed[i-1])
    }
    
    // 처음에 배열 뒤집었기 때문에 다시 reverse
    rightTable.reverse()
    
    // 정답 계산
    var count = 0
    for i in stride(from: 0, to: a.count, by: 1) {
        // 타겟 넘버(a[i])보다 작은 값이 2개라면 마지막까지 남기는 것이 불가능한 풍선
        let cnt = [leftTable[i], rightTable[i]].filter { $0 < a[i] }.count
        if cnt >= 2 { continue }
        count += 1
    }
    return count
}