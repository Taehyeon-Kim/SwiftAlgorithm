let nk = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let (n, k) = (nk[0], nk[1])

var dist = Array(repeating: 0, count: 200_001)
var q = [n]  // (인덱스, 거리)

while !q.isEmpty {
  let pos = q.removeFirst()

  // 종료 조건
  // 무한정 계속 돌 수 밖에 없는 구조라서 중간에 컷 해줘야 함
  if pos == k { print(dist[pos]); break }

  if (0...100_001) ~= (pos - 1) && dist[pos - 1] == 0 {
    dist[pos - 1] = dist[pos] + 1
    q.append(pos - 1)
  }

  if (0...100_001) ~= (pos + 1) && dist[pos + 1] == 0 {
    dist[pos + 1] = dist[pos] + 1
    q.append(pos + 1)
  }

  if (0...200_001) ~= (pos * 2) && dist[pos * 2] == 0 {
    dist[pos * 2] = dist[pos] + 1
    q.append(pos * 2)
  }
}