import Foundation

// 50
// 작거나 같은 숫자 카드 준비 -> 그만큼 상자 준비
// 상자를 무작위로 섞고 나열
// 상자1[숫자 30] -> 상자30[숫자 2] -> 상자2[숫자 22] -> 상자22 ...
// 열어야 하는 상자가 이미 열려있을 때까지 반복

// 임의의 상자를 하나 선택하여 선택한 상자 안의 숫자 카드를 확인
// 만약 1번 상자 그룹을 제외하고 남는 상자가 없으면 그대로 게임이 종료되며, 이때 획득하는 점수는 0점
// 1번 상자 그룹에 속한 상자의 수와 2번 상자 그룹에 속한 상자의 수를 곱한 값이 게임의 점수
// 최고 점수 구하는 것이 목표

// 8뽑기
// 8 -> 4 -> 7 -> 1 : 오픈
// x 6 3 x 2 5 x x
// 6 -> 5 -> 2 : 오픈

// 첫번째 게임에서 시작 카드를 어떤 것을 선택하는지, 그리고 두번째 게임에서 시작 카드를 어떤 것을 선택하는지에 따라서 점수가 달라진다.
// 동일한 게임 로직이 반복되고, cards의 숫자가 100이하로 적은 수이기 때문에 재귀로 풀 수 있겠다라는 생각이 들었다.
// 100개의 카드 중에서 2개를 뽑는 경우라고 생각해보고 순서에 따라서도 결과가 달리지기 때문에 총 9900의 경우의 수가 나오고
// 이에 대해서 재귀를 수행하게 된다. 이 풀이에서 재귀는 O(n)으로 시간복잡도가 계산되므로 총 시간복잡도는 O(n^3)이다.

func solution(_ cards:[Int]) -> Int {
    var newCards = [0] + cards                                   // 인덱스 계산 편하게 하기 위해서 첫번째 원소 추가
    var opened = Array(repeating: false, count: cards.count + 1) // 상자 열려있는지 체크하는 배열
    var mx = 0  // 최고 점수
    
    // 상자를 열고 체크하는 로직
    func checkBox(_ i: Int, _ group: [Int]) -> [Int] {
        if opened[i] { return group }   // 상자가 열려있으면 종료
        opened[i] = true                // 아니면 열고 다음 작업 수행
        return checkBox(newCards[i] , group + [newCards[i]])
    }
    
    // 상자 체크를 각각 1번, 2번 그룹에 대해 수행.
    // 그 경우의 수가 많기 때문에 2중 for문으로 경우의 수 계산
    for i in (1...cards.count) {
        for j in (1...cards.count) {
            // 매번 열었던 상자를 다시 초기화해주어야 에러를 방지할 수 있음
            opened = Array(repeating: false, count: cards.count + 1)
            let group1 = checkBox(i, [])    // 첫번째 그룹
            let group2 = checkBox(j, [])    // 두번째 그룹
            mx = max(mx, group1.count * group2.count)
        }
    }
    
    return mx
}