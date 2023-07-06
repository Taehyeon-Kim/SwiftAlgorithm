/*
1. 문제 파악
ROT13 -> 암호화 -> 13글자씩 밀어서 만듦
대문자 소문자에만 적용가능
공백, 숫자 x

2. 전략 수립
아스키코드 이용
반복문 1회 순회

3. 손코딩
대 : 65 ~
소 : 97 ~

let str = input
var ans = ""
for ch in str {
  let val = UnicodeScalar(ch)!.value
  if (65...90) ~= val || (97...122) ~= val {
    ans += String(UnicodeScalar(val+13))
  } else {
    ans += String(ch)
  }
}
*/

let str = readLine()!
var ans = ""

let largeRange: ClosedRange = (65...90)
let smallRange: ClosedRange = (97...122)

for ch in str {
  let ch = String(ch)
  let val = UnicodeScalar(ch)!.value
  // 대문자
  if largeRange ~= Int(val) {
    var newVal = (val + 13)
    if newVal > 90 {
      newVal -= 26
    }
    ans += String(UnicodeScalar(newVal)!)
  } 
  // 소문자
  else if smallRange ~= Int(val) {
    var newVal = (val + 13)
    if newVal > 122 {
      newVal -= 26
    }
    ans += String(UnicodeScalar(newVal)!)
  }
  else {
    ans += String(ch)
  }
}
print(ans)