let nc = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let (n, c) = (nc[0], nc[1])

var houses = [Int]()
for _ in 0..<n {
  houses.append(Int(readLine()!)!)
}

// sorting
houses = houses.sorted()

// 거리에 따른 가능한 공유기 개수 카운트
func count(_ distInterval: Int) -> [Int] {
  var coordinates = [houses[0]]
  var cur = 0
  
  for i in 1..<n {
    if houses[i] - houses[cur] >= distInterval {
      coordinates.append(houses[i])
      cur = i
    }
  }
  return coordinates
}

func isPossible(_ dist: Int) -> Bool {
  // 첫번째 집은 놓을 수 있음
  var (count, lastIdx) = (1, 0)
  for i in 1..<n {
    if houses[i] - houses[lastIdx] >= dist {
      lastIdx = i
      count += 1
    }
  }
  return count >= c
}

// Binary search
func binarySearch() -> Int {
  var (st, en) = (1, houses[n-1] - houses[0])
  var ans = 1

  while st <= en {
    let mid = (st + en) / 2    
    // C개 이상으로 공유기 설치 가능 -> 인접 거리를 늘려본다.
    if isPossible(mid) {
      ans = max(ans, mid)
      st = mid + 1
    } else {
      en = mid - 1
    }
  }
  return ans
}

print(binarySearch())