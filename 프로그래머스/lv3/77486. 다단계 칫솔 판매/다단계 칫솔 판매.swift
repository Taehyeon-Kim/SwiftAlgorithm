import Foundation

// DFS

// 1. enroll, referral을 통해 트리 구조가 어떻게 형성되어 있는가
//  ㄴ 딕셔너리로 부모 노드 관계를 파악할 수 있음
// 2. 이익률 계산을 어떻게 반복적으로 해낼건가

func solution(_ enroll:[String], _ referral:[String], _ seller:[String], _ amount:[Int]) -> [Int] {
    
    // 수익금 초기화
    var profits = Dictionary<String, Int>()
    for enr in enroll {
        profits[enr] = 0
    }
    
    // 딕셔너리 초기화
    var nodes = Dictionary<String, String>()
    for (enr, ref) in zip(enroll, referral) {
        nodes[enr] = ref
    }
    
    // 재귀함수
    func calculate(_ seller: String, _ profit: Int) {
        // 1원 미만
        if profit / 10 == 0 {
            profits[seller]! += profit
            return
        }
        
        // 추천인 없는 경우
        if nodes[seller] == "-" {
            profits[seller]! += profit - profit / 10
            return
        }
        
        profits[seller]! += profit - profit / 10
        calculate(nodes[seller]!, profit / 10)
    }
    
    for (seller, profit) in zip(seller, amount.map { $0 * 100 }) {
        calculate(seller, profit)
    }
    
    return enroll.map { profits[$0]! }
}