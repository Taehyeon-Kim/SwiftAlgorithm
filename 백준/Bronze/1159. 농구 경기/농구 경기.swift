/*
1. 문제 파악
첫 글자가 같은 선수 5명 선발
인원이 5명보다 적다면 기권
뽑을 수 있는 성의 첫 글자 모두 구하기

최대 150명

2. 전략 수립
첫글자는 모두 알파벳 -> 26개 중 하나
a-z 딕셔너리 만들고 반복문 돌면서 개수 체크
value가 5이상 체크 후 필터

딕셔너리가 비어있으면 PREDAJA 출력
딕셔너리 sort -> key값 join해서 출력

3. 손코딩
let alp = "abcdefghijklmnopqrstuvwxyz"
let arr = input
var dict: [Character: Int] = [:]

// 딕셔너리 개수 체크
for str in arr {
  let key = str.first!
  dict[key, default: 0] += 1
}

let res = dict.sorted().filter{$0.1.count >= 5}
if res.isEmpty { print("PREDAJA") }
else { res.map{String($0.0)}.joined() }
*/
import Foundation

let alp = "abcdefghijklmnopqrstuvwxyz"
let n = Int(readLine()!)!
var arr = [String]()
for _ in 0..<n {
  arr.append(readLine()!)
}

var dict: [Character: Int] = [:]
// 딕셔너리 개수 체크
for str in arr {
  let key = str.first!
  dict[key, default: 0] += 1
}

let res = dict.sorted{$0.0 < $1.0}.filter{$0.1 >= 5}

if res.isEmpty { print("PREDAJA"); exit(0) }
print(res.map{String($0.key)}.joined())