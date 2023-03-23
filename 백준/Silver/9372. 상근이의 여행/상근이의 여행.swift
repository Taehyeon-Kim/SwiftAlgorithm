/*
가중치가 없는 연결 그래프에서 가장 적은 종류, 즉 스패닝 트리인 상태를 구하니 결국에는 cost가 존재하지 않으므로 n-1이 답이 된다.
*/
let tc = Int(readLine()!)!
for _ in 0..<tc {
  let nm = readLine()!.split(separator: " ").compactMap{Int(String($0))}
  let (n,m) = (nm[0], nm[1])
  for _ in 0..<m {
    let _ = readLine()!.split(separator: " ").compactMap{Int(String($0))}
  }
  print(n-1)
}