func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    let dict = genres.enumerated().reduce(into: [String: [[Int]]]()) {
        let (index, genre) = $1
        $0[genre, default: []] += [[index, plays[index]]]
    }
    return Array(dict.values)
        .sorted {
            ($0.reduce(0) { $0 + $1[1] }) > ($1.reduce(0) { $0 + $1[1] })
        }
        .flatMap {
            $0.sorted { $0[1] > $1[1] }.map { $0[0] }.prefix(2)
        }
}

assert(solution(["classic", "pop", "classic", "classic", "pop"], [500, 600, 150, 800, 2500]) == [4, 1, 3, 0], "❌ 테스트 케이스를 만족하지 못했어요")