let n = Int(readLine()!)! // n개
var n_num = readLine()!.split(separator: " ").map{Int(String($0))!}
n_num.sort() // 오름차순 정렬

// 찾아야 하는 수 배열
let m = Int(readLine()!)! // m개
let m_num = readLine()!.split(separator: " ").map{Int(String($0))!}

var dict = [Int: Int]()
for num in n_num {
  dict[num, default: 0] += 1
}

for num in m_num {
  print(dict[num] ?? 0, terminator: " ")
}