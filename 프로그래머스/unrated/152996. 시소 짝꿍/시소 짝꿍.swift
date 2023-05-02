// 거리: 2, 3, 4m -> 두사람 앉는 경우의 수 비 7가지
// weights: 사람 몸무게 -> 100,000개에서 2명을 뽑는 경우 -> 50억가지
// 크기가 너무 커서 완전 탐색으로 풀 수 없음

// 4 3 2 - 2 3 4
// 1:1 1:2 2:3 3:4 2:1 3:2 4:3 => 쌍의 조합 수 7가지
// 해당 쌍에 해당하는 몸무게를 키를 가진 값이 존재하는지 체크하면 된다.
// [몸무게(숫자): 개수]

func solution(_ weights:[Int]) -> Int64 {
    
    var dict = [Double: Int]()
    var ans = 0
    
    func check(_ target: Int) -> Int {
        var ret = 0
        let weight = Double(target)
        ret += dict[weight, default: 0]
        ret += dict[weight * 2.0, default: 0]
        ret += dict[weight / 2.0, default: 0]
        ret += dict[weight / 2.0 * 3.0, default: 0]
        ret += dict[weight / 3.0 * 2.0, default: 0]
        ret += dict[weight / 3.0 * 4.0, default: 0]
        ret += dict[weight / 4.0 * 3.0, default: 0]
        return ret
    }
    
    for w in weights {
        ans += check(w)    
        dict[Double(w), default: 0] += 1
    }

    return Int64(ans)
}