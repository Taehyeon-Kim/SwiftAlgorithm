/*
1. 빠르게 읽기
팰린드롬 - 거꾸로 읽을 때 똑같은 단어
단어의 길이는 1 <= len <= 100
소문자로만 이루어짐
짝수 혹은 홀수
팰린드롬 => 1 / 아니면 => 0

2. TC
대칭을 이루는지 체크 필요
-> 스택 

홀수면 중간 문자는 skip
arr
stack

arr의 앞부터 하나씩 빼서 stack에 넣고
같은 것이 들어오면 pop
최종적으로 stack이 비어있으면 팰린드롬 -> 짝이 맞는거니까

3. 기본적인 자료구조 활용 및 구현
'스택'

var str = "abcd"
var stack = [Character]()
for (idx, ch) in str.enumerated()
  if idx == str.count/2 { continue }
  if stack.isEmpty
    stack.append(ch)
  else
    if stack.last! == ch
      stack.popLast()
    else
      stack.append(ch)

if stack.isEmpty { print(1) }
else { print(0) }
*/

let str = readLine()!
var stack = [Character]()

for (idx, ch) in str.enumerated() {
  if str.count % 2 == 1 && idx == str.count / 2 { continue }
  if stack.isEmpty {
    stack.append(ch)
  } else {
    if stack.last! == ch {
      _ = stack.popLast()!
    } else {
      stack.append(ch)
    }
  }
}

if stack.isEmpty {
  print(1)
} else {
  print(0)
}