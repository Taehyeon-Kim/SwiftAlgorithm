func solution(_ a: Int, _ b: Int, _ m: Int) -> Int {
  if b == 1 { return a % m }

  var val = solution(a, b/2, m)
  val = val * val % m

  if b % 2 == 0 { return val }
  return val * a % m
}

let input = readLine()!.split(separator: " ").compactMap{Int(String($0))}
let (a, b, c) = (input[0], input[1], input[2])
print(solution(a, b, c))