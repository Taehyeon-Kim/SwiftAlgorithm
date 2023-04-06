let n = Int(readLine()!)!
let liquids = readLine()!.split(separator: " ").compactMap{Int(String($0))}.sorted()

/*
완전탐색으로 3개의 수 택 - O(N^3) = 1250억 (X)
한쪽을 투포인터로만 풀이해도 N2으로 줄일 수 있음 - O(N^2)
이분탐색으로 풀이하면 O(NlogN)
*/

var ans: (sum: Int, one: Int, two: Int, three: Int) = (Int.max, liquids[0], liquids[1], liquids[2])

// 마지막 2개를 자른 이유는 최소 3개는 택해야 하기 때문.
for i in 0..<n-2 {
  var (st, en) = (i+1, n-1) // 남은 범위 => 다음 용액 ~ 마지막 용액

  // 포인터 이동
  while st < en {
    let sum = liquids[i] + liquids[st] + liquids[en] // 세 용액의 합
    
    if abs(sum) < abs(ans.sum) {
      ans = (sum, liquids[i], liquids[st], liquids[en])
    }

    if sum < 0 {
      st += 1
    } else {
      en -= 1
    }
  }
}

print("\(ans.one) \(ans.two) \(ans.three)")