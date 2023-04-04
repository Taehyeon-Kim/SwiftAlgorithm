let n = Int(readLine()!)! // n개
var n_num = readLine()!.split(separator: " ").compactMap{Int(String($0))}
n_num.sort() // 오름차순 정렬

// 찾아야 하는 수 배열
let m = Int(readLine()!)! // m개
let m_num = readLine()!.split(separator: " ").compactMap{Int(String($0))}

// array: 정수 배열, target: 찾아야 하는 수
func binarySearch(_ array: [Int], _ target: Int) -> Int {
  var (left, right) = (0, array.count - 1)

  // 반복
  while left <= right {
    let mid = (left + right) / 2  // 중간값 - 인덱스
    // 찾아야 하는 수가 더 크면 오른쪽 범위로 한정
    if array[mid] < target {
      left = mid + 1
    }
    // 더 작다면 왼쪽 범위로 한정
    else if array[mid] > target {
      right = mid - 1 
    }
    else {
      return 1
    }
  }

  // 찾아야 하는 수가 없다면 0 반환
  return 0
}

for num in m_num {
  print(binarySearch(n_num, num))
}