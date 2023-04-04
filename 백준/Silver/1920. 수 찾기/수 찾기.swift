let n = Int(readLine()!)! // n개
var n_num = readLine()!.split(separator: " ").compactMap{Int(String($0))}
n_num.sort() // 오름차순 정렬

// 찾아야 하는 수 배열
let m = Int(readLine()!)! // m개
let m_num = readLine()!.split(separator: " ").compactMap{Int(String($0))}

let sets = Set(n_num)
for num in m_num {
  // print(binarySearch(n_num, num))

  // Set으로 푸는게 훨씬 빠를듯
  print(sets.contains(num) ? 1 : 0)
}