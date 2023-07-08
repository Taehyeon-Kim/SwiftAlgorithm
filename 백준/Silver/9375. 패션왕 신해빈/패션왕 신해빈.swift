/*
1. 문제 파악
- 옷의 조합
- 며칠동안

테스트케이스 최대 100개
의상 수 최대 30개
의상의 이름 + 의상의 종류 -> 같은 종류는 하나씩만 입을 수 있음

모든 조합의 수를 구하는 문제

2. 전략 수립
c++ -> next_permutation
경우의 수 공식

3. 손코딩
String -> Int : map / dictionary

var dict: [String: Int] = [:]
for _ in 0..<n {
  input <-
  (key, value) = input0, input1
  dict[key, default: 0] = value
}

var ret = 1
for item in dict {
  ret *= item.value + 1
}
print(ret - 1)
*/

let tc = Int(readLine()!)!
for _ in 0..<tc {
  let n = Int(readLine()!)!
  var dict: [String: Int] = [:]
  for _ in 0..<n {
    let input = readLine()!.split{$0==" "}.map{String($0)}
    let (_, value) = (input[0], input[1])
    dict[value, default: 0] += 1
  }

  var ret = 1
  for item in dict {
    ret *= item.value + 1
  }
  print(ret - 1)
}