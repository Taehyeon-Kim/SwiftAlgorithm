/*
1. 읽기
소문자로만 이루어진 string
a-z까지 개수 출력
단어의 길이는 100을 넘지 않음

2. 문제 분석
자료구조 : 딕셔너리
단어 순회하면서 각 알파벳을 키로 가지는 값 +1
출력 a-z까지 순차적으로 개수 출력

3. 전략
구현

4. 손코딩
s: string = [character]
var dict = [ch: int]()

for ch in string
  dict[ch, default: 0] += 1

// x
dict.sort()
for (k,v) in dict
  print(v)

for ch in alphabet
  print(dict[ch, default: 0], terminator: " ")
*/

let str = readLine()!
var dict: [Character: Int] = [:]

for ch in str {
  dict[ch, default: 0] += 1
}

let alphabets = "abcdefghijklmnopqrstuvwxyz"
for ch in alphabets {
  print(dict[ch, default: 0], terminator: " ")
}