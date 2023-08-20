import Foundation

// 카운트 -> 맵, 딕셔너리
// 빼야 하는 개수 -> 남은 게 적은 것부터 제거하면 됨

func solution(_ k:Int, _ tangerine:[Int]) -> Int {
    var remove = tangerine.count - k
    let dict = Dictionary(grouping: tangerine) { $0 }
      .map { ($0.key, $0.value.count) }
      .sorted { $0.1 < $1.1 }

    var ans = dict.count
    for (_, value) in dict {
      if remove == 0 { break }

      if value <= remove {
        remove -= value
        ans -= 1
      }

      else { break }
    }

    return ans
}